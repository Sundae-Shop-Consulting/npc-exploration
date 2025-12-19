"""
Custom CumulusCI tasks for managing Data Processing Engine (DPE) Definitions.

These tasks interact with BatchCalcJobDefinition metadata to:
- List available DPE definitions in an org
- Retrieve DPE definitions to local files
- Deploy DPE definitions from local files
- Clone DPE definitions by retrieve -> modify -> deploy
"""

import json
import os
import shutil
import tempfile
import xml.etree.ElementTree as ET
from pathlib import Path

from cumulusci.core.exceptions import TaskOptionsError
from cumulusci.tasks.salesforce import BaseSalesforceApiTask
from cumulusci.utils import temporary_dir


class ListDPEDefinitions(BaseSalesforceApiTask):
    """List all Data Processing Engine definitions in the org using Tooling API."""

    task_docs = """
    Lists all Data Processing Engine (DPE) definitions available in the org.
    
    Uses the Tooling API to query BatchCalcJobDefinition records and displays:
    - Definition Name
    - API Name (DeveloperName)
    - Active status
    - Description
    
    Example:
        cci task run list_dpe_definitions
    """

    task_options = {
        "active_only": {
            "description": "If True, only show active definitions. Defaults to False.",
            "required": False,
        }
    }

    def _init_options(self, kwargs):
        super()._init_options(kwargs)
        self.options.setdefault("active_only", False)

    def _run_task(self):
        """Query and display DPE definitions."""
        # Build SOQL query - using only fields that exist on BatchCalcJobDefinition
        # Note: The Tooling API object has limited fields compared to metadata
        query = "SELECT Id, DeveloperName FROM BatchCalcJobDefinition"
        
        if self.options["active_only"]:
            # IsActive might not be available in Tooling API
            # We'll retrieve all and filter in Python if needed
            pass
        
        query += " ORDER BY DeveloperName"

        self.logger.info("Querying Data Processing Engine definitions...")
        
        # Use Tooling API
        try:
            result = self.tooling.query(query)
        except Exception as e:
            self.logger.error(f"Query failed: {str(e)}")
            self.logger.info("Note: The Tooling API for BatchCalcJobDefinition has limited field access.")
            self.logger.info("Consider using Metadata API retrieve to get full details.")
            raise
        
        if result["totalSize"] == 0:
            self.logger.info("No Data Processing Engine definitions found.")
            return

        self.logger.info(f"\nFound {result['totalSize']} DPE definition(s):\n")
        
        # Display results - simple format since we have limited fields
        header = f"{'API Name (DeveloperName)':<50} {'Salesforce Id'}"
        self.logger.info(header)
        self.logger.info("-" * 80)
        
        for record in result["records"]:
            dev_name = record.get("DeveloperName", "")[:49]
            sf_id = record.get("Id", "")
            
            row = f"{dev_name:<50} {sf_id}"
            self.logger.info(row)
        
        self.logger.info("\nNote: For more details (Label, Description, IsActive), use 'retrieve_dpe_definitions' to get the full metadata.")


class RetrieveDPEDefinitions(BaseSalesforceApiTask):
    """Retrieve Data Processing Engine definitions using Metadata API."""

    task_docs = """
    Retrieves Data Processing Engine definitions from the org to local files.
    
    Downloads BatchCalcJobDefinition metadata to a specified directory.
    If no definitions are specified, retrieves all definitions.
    
    Options:
        definitions: Comma-separated list of DPE definition API names to retrieve.
                    If not specified, retrieves all definitions.
        path: Directory path where definitions will be saved. 
              Defaults to 'dpe_definitions'
    
    Examples:
        # Retrieve all definitions
        cci task run retrieve_dpe_definitions
        
        # Retrieve specific definitions
        cci task run retrieve_dpe_definitions -o definitions "MyDPE,AnotherDPE"
        
        # Retrieve to custom path
        cci task run retrieve_dpe_definitions -o path "metadata/dpe"
    """

    task_options = {
        "definitions": {
            "description": "Comma-separated list of DPE definition API names. If not specified, retrieves all.",
            "required": False,
        },
        "path": {
            "description": "Directory path for retrieved definitions. Defaults to 'dpe_definitions'",
            "required": False,
        },
    }

    def _init_options(self, kwargs):
        super()._init_options(kwargs)
        self.options.setdefault("path", "dpe_definitions")

    def _run_task(self):
        """Retrieve DPE definitions using Metadata API."""
        # Determine which definitions to retrieve
        if "definitions" in self.options and self.options["definitions"]:
            definition_names = [d.strip() for d in self.options["definitions"].split(",")]
            self.logger.info(f"Retrieving {len(definition_names)} specified DPE definition(s)...")
        else:
            # Query all definitions
            result = self.tooling.query(
                "SELECT DeveloperName FROM BatchCalcJobDefinition ORDER BY DeveloperName"
            )
            definition_names = [r["DeveloperName"] for r in result["records"]]
            self.logger.info(f"Retrieving all {len(definition_names)} DPE definition(s)...")

        if not definition_names:
            self.logger.warning("No DPE definitions to retrieve.")
            return

        # Create package.xml
        package_xml = self._create_package_xml(definition_names)
        
        # Create temporary directory for retrieve
        with temporary_dir() as temp_dir:
            package_xml_path = Path(temp_dir) / "package.xml"
            package_xml_path.write_text(package_xml)
            
            self.logger.info("Retrieving metadata from org...")
            
            # Use Metadata API retrieve
            retrieve_result = self.md_api._retrieve_metadata(
                package_xml=package_xml,
                package_xml_path=str(package_xml_path)
            )
            
            # Extract to temp directory
            extract_dir = Path(temp_dir) / "extracted"
            extract_dir.mkdir(exist_ok=True)
            
            import zipfile
            with zipfile.ZipFile(retrieve_result, 'r') as zip_ref:
                zip_ref.extractall(extract_dir)
            
            # Move to target path
            target_path = Path(self.options["path"])
            target_path.mkdir(parents=True, exist_ok=True)
            
            # Copy BatchCalcJobDefinition files
            source_dpe_dir = extract_dir / "batchCalcJobDefinitions"
            if source_dpe_dir.exists():
                for item in source_dpe_dir.iterdir():
                    target_file = target_path / item.name
                    if item.is_file():
                        shutil.copy2(item, target_file)
                        self.logger.info(f"Retrieved: {item.name}")
            
            self.logger.info(f"\nDPE definitions retrieved to: {target_path}")

    def _create_package_xml(self, definition_names):
        """Create package.xml for retrieve operation."""
        # Get API version from project config
        api_version = self.project_config.project__package__api_version
        
        # Build XML
        root = ET.Element("Package", xmlns="http://soap.sforce.com/2006/04/metadata")
        
        types_elem = ET.SubElement(root, "types")
        for name in definition_names:
            member_elem = ET.SubElement(types_elem, "members")
            member_elem.text = name
        
        name_elem = ET.SubElement(types_elem, "name")
        name_elem.text = "BatchCalcJobDefinition"
        
        version_elem = ET.SubElement(root, "version")
        version_elem.text = api_version
        
        # Convert to string with XML declaration
        xml_str = ET.tostring(root, encoding="unicode", method="xml")
        return f'<?xml version="1.0" encoding="UTF-8"?>\n{xml_str}'


class DeployDPEDefinitions(BaseSalesforceApiTask):
    """Deploy Data Processing Engine definitions using Metadata API."""

    task_docs = """
    Deploys Data Processing Engine definitions from local files to the org.
    
    Deploys BatchCalcJobDefinition metadata from a specified directory.
    
    Options:
        path: Directory path containing DPE definitions to deploy.
              Defaults to 'dpe_definitions'
        definitions: Comma-separated list of specific definition files to deploy.
                    If not specified, deploys all .batchCalcJobDefinition files in path.
    
    Examples:
        # Deploy all definitions in default directory
        cci task run deploy_dpe_definitions
        
        # Deploy from custom path
        cci task run deploy_dpe_definitions -o path "metadata/dpe"
        
        # Deploy specific definitions
        cci task run deploy_dpe_definitions -o definitions "MyDPE,AnotherDPE"
    """

    task_options = {
        "path": {
            "description": "Directory path containing DPE definitions. Defaults to 'dpe_definitions'",
            "required": False,
        },
        "definitions": {
            "description": "Comma-separated list of specific definition API names to deploy",
            "required": False,
        },
    }

    def _init_options(self, kwargs):
        super()._init_options(kwargs)
        self.options.setdefault("path", "dpe_definitions")

    def _run_task(self):
        """Deploy DPE definitions using Metadata API."""
        source_path = Path(self.options["path"])
        
        if not source_path.exists():
            raise TaskOptionsError(f"Path does not exist: {source_path}")
        
        # Find definition files
        if "definitions" in self.options and self.options["definitions"]:
            definition_names = [d.strip() for d in self.options["definitions"].split(",")]
            definition_files = [
                source_path / f"{name}.batchCalcJobDefinition"
                for name in definition_names
            ]
            # Verify files exist
            for f in definition_files:
                if not f.exists():
                    raise TaskOptionsError(f"Definition file not found: {f}")
        else:
            definition_files = list(source_path.glob("*.batchCalcJobDefinition"))
        
        if not definition_files:
            self.logger.warning(f"No DPE definition files found in: {source_path}")
            return
        
        self.logger.info(f"Deploying {len(definition_files)} DPE definition(s)...")
        
        # Create deployment package
        with temporary_dir() as temp_dir:
            deploy_dir = Path(temp_dir) / "deploy"
            dpe_dir = deploy_dir / "batchCalcJobDefinitions"
            dpe_dir.mkdir(parents=True)
            
            # Copy definition files
            definition_names = []
            for def_file in definition_files:
                shutil.copy2(def_file, dpe_dir / def_file.name)
                definition_names.append(def_file.stem)
                self.logger.info(f"Staged: {def_file.name}")
            
            # Create package.xml
            package_xml = self._create_package_xml(definition_names)
            package_xml_path = deploy_dir / "package.xml"
            package_xml_path.write_text(package_xml)
            
            # Create zip for deployment
            import zipfile
            zip_path = Path(temp_dir) / "deploy.zip"
            with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
                for root, dirs, files in os.walk(deploy_dir):
                    for file in files:
                        file_path = Path(root) / file
                        arcname = file_path.relative_to(deploy_dir)
                        zipf.write(file_path, arcname)
            
            self.logger.info("Deploying to org...")
            
            # Deploy using Metadata API
            deploy_result = self.md_api.deploy(
                zip_path.read_bytes(),
                options={"checkOnly": False, "singlePackage": True}
            )
            
            # Check result
            if deploy_result["status"] == "Succeeded":
                self.logger.info("✓ Deployment succeeded!")
                for component in deploy_result.get("componentSuccesses", []):
                    self.logger.info(f"  ✓ {component['fileName']}")
            else:
                self.logger.error("✗ Deployment failed!")
                for component in deploy_result.get("componentFailures", []):
                    self.logger.error(
                        f"  ✗ {component['fileName']}: {component['problem']}"
                    )
                raise Exception("Deployment failed")

    def _create_package_xml(self, definition_names):
        """Create package.xml for deploy operation."""
        api_version = self.project_config.project__package__api_version
        
        root = ET.Element("Package", xmlns="http://soap.sforce.com/2006/04/metadata")
        
        types_elem = ET.SubElement(root, "types")
        for name in definition_names:
            member_elem = ET.SubElement(types_elem, "members")
            member_elem.text = name
        
        name_elem = ET.SubElement(types_elem, "name")
        name_elem.text = "BatchCalcJobDefinition"
        
        version_elem = ET.SubElement(root, "version")
        version_elem.text = api_version
        
        xml_str = ET.tostring(root, encoding="unicode", method="xml")
        return f'<?xml version="1.0" encoding="UTF-8"?>\n{xml_str}'


class CloneDPEDefinition(BaseSalesforceApiTask):
    """Clone a DPE definition by retrieving, modifying, and deploying with a new name."""

    task_docs = """
    Clones an existing Data Processing Engine definition with a new name.
    
    This task:
    1. Retrieves the source definition from the org
    2. Creates a copy with a new API name and label
    3. Optionally deactivates the clone
    4. Deploys the cloned definition to the org
    
    Options:
        source: API name of the source DPE definition to clone
        target: API name for the new cloned definition
        label: Label for the new definition (defaults to target value)
        description: Description for the new definition (optional)
        activate: If True, deploy as active. If False, deploy as inactive. Defaults to False.
    
    Example:
        cci task run clone_dpe_definition \\
            -o source "Generate_Account_Forecast" \\
            -o target "Custom_Account_Forecast" \\
            -o label "Custom Account Forecast" \\
            -o description "Customized forecast calculation"
    """

    task_options = {
        "source": {
            "description": "API name (DeveloperName) of the source DPE definition",
            "required": True,
        },
        "target": {
            "description": "API name (DeveloperName) for the new cloned definition",
            "required": True,
        },
        "label": {
            "description": "Label for the new definition. Defaults to target value.",
            "required": False,
        },
        "description": {
            "description": "Description for the new definition",
            "required": False,
        },
        "activate": {
            "description": "If True, deploy as active. Defaults to False.",
            "required": False,
        },
    }

    def _init_options(self, kwargs):
        super()._init_options(kwargs)
        if "label" not in self.options:
            self.options["label"] = self.options["target"]
        self.options.setdefault("activate", False)

    def _run_task(self):
        """Clone the DPE definition."""
        source_name = self.options["source"]
        target_name = self.options["target"]
        
        self.logger.info(f"Cloning DPE definition: {source_name} → {target_name}")
        
        # Verify source exists
        result = self.tooling.query(
            f"SELECT Id, DeveloperName FROM BatchCalcJobDefinition "
            f"WHERE DeveloperName = '{source_name}'"
        )
        
        if result["totalSize"] == 0:
            raise TaskOptionsError(f"Source DPE definition not found: {source_name}")
        
        # Check if target already exists
        result = self.tooling.query(
            f"SELECT Id FROM BatchCalcJobDefinition "
            f"WHERE DeveloperName = '{target_name}'"
        )
        
        if result["totalSize"] > 0:
            raise TaskOptionsError(
                f"Target DPE definition already exists: {target_name}. "
                "Please choose a different name or delete the existing definition."
            )
        
        with temporary_dir() as temp_dir:
            # 1. Retrieve source definition
            self.logger.info(f"Retrieving source definition: {source_name}")
            package_xml = self._create_package_xml([source_name])
            package_xml_path = Path(temp_dir) / "package.xml"
            package_xml_path.write_text(package_xml)
            
            retrieve_result = self.md_api._retrieve_metadata(
                package_xml=package_xml,
                package_xml_path=str(package_xml_path)
            )
            
            # Extract
            extract_dir = Path(temp_dir) / "extracted"
            extract_dir.mkdir(exist_ok=True)
            
            import zipfile
            with zipfile.ZipFile(retrieve_result, 'r') as zip_ref:
                zip_ref.extractall(extract_dir)
            
            # 2. Modify the definition
            source_file = extract_dir / "batchCalcJobDefinitions" / f"{source_name}.batchCalcJobDefinition"
            
            if not source_file.exists():
                raise Exception(f"Retrieved definition file not found: {source_file}")
            
            self.logger.info(f"Creating cloned definition: {target_name}")
            
            # Parse and modify XML
            tree = ET.parse(source_file)
            root = tree.getroot()
            
            # Update fullName
            fullname_elem = root.find(".//{http://soap.sforce.com/2006/04/metadata}fullName")
            if fullname_elem is not None:
                fullname_elem.text = target_name
            else:
                # Add if doesn't exist
                fullname_elem = ET.Element("fullName")
                fullname_elem.text = target_name
                root.insert(0, fullname_elem)
            
            # Update label
            label_elem = root.find(".//{http://soap.sforce.com/2006/04/metadata}label")
            if label_elem is not None:
                label_elem.text = self.options["label"]
            else:
                label_elem = ET.SubElement(root, "label")
                label_elem.text = self.options["label"]
            
            # Update description if provided
            if "description" in self.options and self.options["description"]:
                desc_elem = root.find(".//{http://soap.sforce.com/2006/04/metadata}description")
                if desc_elem is not None:
                    desc_elem.text = self.options["description"]
                else:
                    desc_elem = ET.SubElement(root, "description")
                    desc_elem.text = self.options["description"]
            
            # Set activation status
            active_elem = root.find(".//{http://soap.sforce.com/2006/04/metadata}isActive")
            if active_elem is not None:
                active_elem.text = "true" if self.options["activate"] else "false"
            
            # 3. Save modified definition
            deploy_dir = Path(temp_dir) / "deploy"
            dpe_dir = deploy_dir / "batchCalcJobDefinitions"
            dpe_dir.mkdir(parents=True)
            
            target_file = dpe_dir / f"{target_name}.batchCalcJobDefinition"
            tree.write(target_file, encoding="utf-8", xml_declaration=True)
            
            # Create deployment package.xml
            deploy_package_xml = self._create_package_xml([target_name])
            (deploy_dir / "package.xml").write_text(deploy_package_xml)
            
            # 4. Deploy
            self.logger.info(f"Deploying cloned definition to org...")
            
            zip_path = Path(temp_dir) / "deploy.zip"
            with zipfile.ZipFile(zip_path, 'w', zipfile.ZIP_DEFLATED) as zipf:
                for root_dir, dirs, files in os.walk(deploy_dir):
                    for file in files:
                        file_path = Path(root_dir) / file
                        arcname = file_path.relative_to(deploy_dir)
                        zipf.write(file_path, arcname)
            
            deploy_result = self.md_api.deploy(
                zip_path.read_bytes(),
                options={"checkOnly": False, "singlePackage": True}
            )
            
            if deploy_result["status"] == "Succeeded":
                status = "active" if self.options["activate"] else "inactive"
                self.logger.info(f"✓ Successfully cloned DPE definition as {status}!")
                self.logger.info(f"  Source: {source_name}")
                self.logger.info(f"  Clone: {target_name}")
            else:
                self.logger.error("✗ Clone deployment failed!")
                for component in deploy_result.get("componentFailures", []):
                    self.logger.error(
                        f"  ✗ {component['fileName']}: {component['problem']}"
                    )
                raise Exception("Deployment failed")

    def _create_package_xml(self, definition_names):
        """Create package.xml."""
        api_version = self.project_config.project__package__api_version
        
        root = ET.Element("Package", xmlns="http://soap.sforce.com/2006/04/metadata")
        
        types_elem = ET.SubElement(root, "types")
        for name in definition_names:
            member_elem = ET.SubElement(types_elem, "members")
            member_elem.text = name
        
        name_elem = ET.SubElement(types_elem, "name")
        name_elem.text = "BatchCalcJobDefinition"
        
        version_elem = ET.SubElement(root, "version")
        version_elem.text = api_version
        
        xml_str = ET.tostring(root, encoding="unicode", method="xml")
        return f'<?xml version="1.0" encoding="UTF-8"?>\n{xml_str}'