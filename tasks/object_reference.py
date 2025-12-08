# tasks/object_reference.py

from cumulusci.tasks.salesforce import BaseSalesforceApiTask


class GenerateObjectReference(BaseSalesforceApiTask):
    """Generate a simple text data dictionary for selected objects."""

    task_options = {
        "objects": {
            "description": "Comma-separated list of object API names (e.g. 'Account,Contact')",
            "required": True,
        },
        "output_path": {
            "description": "Path to the output text file",
            "required": True,
        },
    }

    def _run_task(self):
        object_names = [
            o.strip()
            for o in self.options["objects"].split(",")
            if o.strip()
        ]
        output_path = self.options["output_path"]

        lines = []

        for obj in object_names:
            try:
                # self.sf is a pre-authenticated simple_salesforce client
                desc = getattr(self.sf, obj).describe()
            except Exception as e:
                msg = f"ERROR: Could not describe object {obj}: {e}"
                self.logger.error(msg)
                lines.append(msg)
                lines.append("")  # blank line
                continue

            lines.append(f"### Object: {desc['name']}")
            lines.append(f"Label: {desc.get('label', '')}")
            lines.append("Fields:")

            for field in desc["fields"]:
                name = field["name"]
                label = field.get("label", "")
                ftype = field["type"]
                length = field.get("length")

                # Base field line
                field_line = (
                    f"  - {name} ({label}) "
                    f"Type: {ftype}"
                    + (f", Length: {length}" if length else "")
                )
                lines.append(field_line)

                # If it's a picklist or multipicklist, include values
                if ftype in ("picklist", "multipicklist"):
                    picklist_values = field.get("picklistValues") or []
                    if picklist_values:
                        lines.append("      Picklist Values:")
                        for pv in picklist_values:
                            pv_label = pv.get("label", "")
                            pv_value = pv.get("value", "")
                            default = " (default)" if pv.get("defaultValue") else ""
                            active = "" if pv.get("active", True) else " [inactive]"
                            lines.append(
                                f"        * {pv_label} ({pv_value}){default}{active}"
                            )

            lines.append("")  # blank line between objects

        with open(output_path, "w", encoding="utf-8") as f:
            f.write("\n".join(lines))

        self.logger.info(f"Wrote object reference to {output_path}")
