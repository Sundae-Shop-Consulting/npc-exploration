BEGIN TRANSACTION;

--------------------------------------------------------------------------------
-- Account + Account_rt_mapping
--------------------------------------------------------------------------------

CREATE TABLE "Account" (
    id VARCHAR(255) NOT NULL,
    "FirstName" VARCHAR(255),
    "LastName" VARCHAR(255),
    "Name" VARCHAR(255),
    "RecordTypeId" VARCHAR(255),
    "IsPersonAccount" VARCHAR(255),
    "ParentId" VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE "Account_rt_mapping" (
    record_type_id VARCHAR(18) NOT NULL,
    developer_name VARCHAR(255),
    is_person_type BOOLEAN,
    PRIMARY KEY (record_type_id)
);

INSERT INTO "Account_rt_mapping" VALUES('RT-PERSON','PersonAccount',1);
INSERT INTO "Account_rt_mapping" VALUES('RT-BUSINESS','Business_Account',0);
INSERT INTO "Account_rt_mapping" VALUES('RT-ORG-BUSINESS','Org_Business_Account',0);

-- Person Accounts
INSERT INTO "Account" VALUES('Account-1','James','Price','', 'RT-PERSON','true','');
INSERT INTO "Account" VALUES('Account-2','Grace','Price','', 'RT-PERSON','true','');
INSERT INTO "Account" VALUES('Account-3','Alex','Price-Greenberg','', 'RT-PERSON','true','');

INSERT INTO "Account" VALUES('Account-4','Soledad','Torres','', 'RT-PERSON','true','');
INSERT INTO "Account" VALUES('Account-5','Javier','Torres','', 'RT-PERSON','true','');
INSERT INTO "Account" VALUES('Account-6','Diego','Torres','', 'RT-PERSON','true','');
INSERT INTO "Account" VALUES('Account-7','Mat','Torres','', 'RT-PERSON','true','');
INSERT INTO "Account" VALUES('Account-8','Izzy','Torres','', 'RT-PERSON','true','');

INSERT INTO "Account" VALUES('Account-9','Sam','Mason','', 'RT-PERSON','true','');
INSERT INTO "Account" VALUES('Account-10','Leah','Mason','', 'RT-PERSON','true','');

-- Household anchor Accounts (all Business Accounts)
INSERT INTO "Account" VALUES('Account-11','','','Price Household','RT-BUSINESS','false','');
INSERT INTO "Account" VALUES('Account-12','','','Price-Greenberg Household','RT-BUSINESS','false','');
INSERT INTO "Account" VALUES('Account-13','','','Soledad and Javier Torres Household','RT-BUSINESS','false','');
INSERT INTO "Account" VALUES('Account-14','','','Mason Household','RT-BUSINESS','false','');

-- Organizations
INSERT INTO "Account" VALUES('Account-15','','','Cumulus Cloud Bank','RT-ORG-BUSINESS','false','');
INSERT INTO "Account" VALUES('Account-16','','','Mountain Rise Foundation','RT-ORG-BUSINESS','false','');

--------------------------------------------------------------------------------
-- Contact
--------------------------------------------------------------------------------

CREATE TABLE "Contact" (
    id VARCHAR(255) NOT NULL,
    "FirstName" VARCHAR(255),
    "LastName" VARCHAR(255),
    "IsPersonAccount" VARCHAR(255),
    "AccountId" VARCHAR(255),
    "ReportsToId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "Contact" VALUES('Contact-1','James','Price','true','Account-1','');
INSERT INTO "Contact" VALUES('Contact-2','Grace','Price','true','Account-2','');
INSERT INTO "Contact" VALUES('Contact-3','Alex','Price-Greenberg','true','Account-3','');

INSERT INTO "Contact" VALUES('Contact-4','Soledad','Torres','true','Account-4','');
INSERT INTO "Contact" VALUES('Contact-5','Javier','Torres','true','Account-5','');
INSERT INTO "Contact" VALUES('Contact-6','Diego','Torres','true','Account-6','');
INSERT INTO "Contact" VALUES('Contact-7','Mat','Torres','true','Account-7','');
INSERT INTO "Contact" VALUES('Contact-8','Izzy','Torres','true','Account-8','');

INSERT INTO "Contact" VALUES('Contact-9','Sam','Mason','true','Account-9','');
INSERT INTO "Contact" VALUES('Contact-10','Leah','Mason','true','Account-10','');

--------------------------------------------------------------------------------
-- PartyRelationshipGroup
--------------------------------------------------------------------------------

CREATE TABLE "PartyRelationshipGroup" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "AccountId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "PartyRelationshipGroup" VALUES('PartyRelationshipGroup-1','Price Household','Account-11');
INSERT INTO "PartyRelationshipGroup" VALUES('PartyRelationshipGroup-2','Price-Greenberg Household','Account-12');
INSERT INTO "PartyRelationshipGroup" VALUES('PartyRelationshipGroup-3','Soledad and Javier Torres Household','Account-13');
INSERT INTO "PartyRelationshipGroup" VALUES('PartyRelationshipGroup-4','Mason Household','Account-14');

--------------------------------------------------------------------------------
-- PartyRoleRelation
--------------------------------------------------------------------------------

CREATE TABLE "PartyRoleRelation" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "RelatedRoleName" VARCHAR(255),
    "RelationshipObjectName" VARCHAR(255),
    "RoleName" VARCHAR(255),
    "ShouldCreaInversRoleAuto" VARCHAR(255),
    "RelatedInverseRecordId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Account <-> Account (Financial Advisory)
INSERT INTO "PartyRoleRelation" VALUES(
  'PartyRoleRelation-1',
  'Financial Advisory Client-Financial Advisory Firm-AAR',
  'Financial Advisory Firm',
  'Account_Account_Relationship',
  'Financial Advisory Client',
  'False',
  'PartyRoleRelation-2'
);

INSERT INTO "PartyRoleRelation" VALUES(
  'PartyRoleRelation-2',
  'Financial Advisory Firm-Financial Advisory Client-AAR',
  'Financial Advisory Client',
  'Account_Account_Relationship',
  'Financial Advisory Firm',
  'False',
  'PartyRoleRelation-1'
);

-- Contact <-> Contact parent/child
INSERT INTO "PartyRoleRelation" VALUES(
  'PartyRoleRelation-3',
  'Parent-Child-CCR',
  'Child',
  'Contact_Contact_Relationship',
  'Parent',
  'False',
  'PartyRoleRelation-4'
);

INSERT INTO "PartyRoleRelation" VALUES(
  'PartyRoleRelation-4',
  'Child-Parent-CCR',
  'Parent',
  'Contact_Contact_Relationship',
  'Child',
  'False',
  'PartyRoleRelation-3'
);

-- Contact <-> Contact spouse
INSERT INTO "PartyRoleRelation" VALUES(
  'PartyRoleRelation-7',
  'Spouse-Spouse-CCR',
  'Spouse',
  'Contact_Contact_Relationship',
  'Spouse',
  'False',
  ''
);

-- Contact <-> Contact sibling
INSERT INTO "PartyRoleRelation" VALUES(
  'PartyRoleRelation-8',
  'Sibling-Sibling-CCR',
  'Sibling',
  'Contact_Contact_Relationship',
  'Sibling',
  'False',
  ''
);

--------------------------------------------------------------------------------
-- AccountAccountRelation
--------------------------------------------------------------------------------

CREATE TABLE "AccountAccountRelation" (
    id VARCHAR(255) NOT NULL,
    "IsActive" VARCHAR(255),
    "AccountId" VARCHAR(255),
    "PartyRoleRelationId" VARCHAR(255),
    "RelatedAccountId" VARCHAR(255),
    "RelatedInverseRecordId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "AccountAccountRelation" VALUES(
  'AccountAccountRelation-1','True','Account-15','PartyRoleRelation-2','Account-14',''
);
INSERT INTO "AccountAccountRelation" VALUES(
  'AccountAccountRelation-2','True','Account-14','PartyRoleRelation-1','Account-15',''
);
INSERT INTO "AccountAccountRelation" VALUES(
  'AccountAccountRelation-3','True','Account-15','PartyRoleRelation-2','Account-13',''
);
INSERT INTO "AccountAccountRelation" VALUES(
  'AccountAccountRelation-4','True','Account-13','PartyRoleRelation-1','Account-15',''
);

--------------------------------------------------------------------------------
-- AccountContactRelation
--------------------------------------------------------------------------------

CREATE TABLE "AccountContactRelation" (
    id VARCHAR(255) NOT NULL,
    "IsActive" VARCHAR(255),
    "IsIncludedInGroup" VARCHAR(255),
    "IsPrimaryGroup" VARCHAR(255),
    "IsPrimaryMember" VARCHAR(255),
    "AccountId" VARCHAR(255),
    "ContactId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Price Household (Account-11)
-- Primary member: James (Contact-1)
INSERT INTO "AccountContactRelation" VALUES(
  'AccountContactRelation-1',
  'true',   -- IsActive
  'true',   -- IsIncludedInGroup
  'true',   -- IsPrimaryGroup
  'true',   -- IsPrimaryMember  (head of household)
  'Account-11',
  'Contact-1'
);

INSERT INTO "AccountContactRelation" VALUES(
  'AccountContactRelation-2',
  'true',
  'true',
  'true',   -- still a primary group for Grace
  'false',  -- NOT the primary member (James is)
  'Account-11',
  'Contact-2'
);

INSERT INTO "AccountContactRelation" VALUES(
  'AccountContactRelation-3',
  'true',
  'true',
  'false',  -- included in household but not primary group for Alex
  'false',
  'Account-11',
  'Contact-3'
);

-- Price-Greenberg Household (Account-12)
-- Primary member: Sam (Contact-9)
INSERT INTO "AccountContactRelation" VALUES(
  'AccountContactRelation-4',
  'true',
  'true',
  'false',  -- secondary/overlapping household for Alex
  'false',
  'Account-12',
  'Contact-3'
);

INSERT INTO "AccountContactRelation" VALUES(
  'AccountContactRelation-5',
  'true',
  'true',
  'true',   -- primary household for Sam in this scenario
  'true',   -- Sam is the primary member for this group
  'Account-12',
  'Contact-9'
);

-- Torres Household (Account-13)
-- Primary member: Soledad (Contact-4)
INSERT INTO "AccountContactRelation" VALUES(
  'AccountContactRelation-6',
  'true',
  'true',
  'true',
  'true',   -- Soledad is primary member
  'Account-13',
  'Contact-4'
);

INSERT INTO "AccountContactRelation" VALUES(
  'AccountContactRelation-7',
  'true',
  'true',
  'true',
  'false',  -- Javier is NOT primary member
  'Account-13',
  'Contact-5'
);

INSERT INTO "AccountContactRelation" VALUES(
  'AccountContactRelation-8',
  'true',
  'true',
  'false',
  'false',
  'Account-13',
  'Contact-6'
);

INSERT INTO "AccountContactRelation" VALUES(
  'AccountContactRelation-9',
  'true',
  'true',
  'false',
  'false',
  'Account-13',
  'Contact-7'
);

INSERT INTO "AccountContactRelation" VALUES(
  'AccountContactRelation-10',
  'true',
  'true',
  'false',
  'false',
  'Account-13',
  'Contact-8'
);

-- Mason Household (Account-14)
-- Primary member: Sam (Contact-9)
INSERT INTO "AccountContactRelation" VALUES(
  'AccountContactRelation-11',
  'true',
  'true',
  'true',
  'true',   -- Sam is primary member for Mason Household
  'Account-14',
  'Contact-9'
);

INSERT INTO "AccountContactRelation" VALUES(
  'AccountContactRelation-12',
  'true',
  'true',
  'true',
  'false',  -- Leah is not marked as primary member
  'Account-14',
  'Contact-10'
);

--------------------------------------------------------------------------------
-- ContactContactRelation
--------------------------------------------------------------------------------

CREATE TABLE "ContactContactRelation" (
    id VARCHAR(255) NOT NULL,
    "IsActive" VARCHAR(255),
    "ContactId" VARCHAR(255),
    "PartyRoleRelationId" VARCHAR(255),
    "RelatedContactId" VARCHAR(255),
    "RelatedInverseRecordId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Spouses (Price)
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-1','True','Contact-1','PartyRoleRelation-7','Contact-2','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-2','True','Contact-2','PartyRoleRelation-7','Contact-1','');

-- Parent/Child (Price)
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-3','True','Contact-1','PartyRoleRelation-3','Contact-3','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-4','True','Contact-2','PartyRoleRelation-3','Contact-3','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-5','True','Contact-3','PartyRoleRelation-4','Contact-1','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-6','True','Contact-3','PartyRoleRelation-4','Contact-2','');

-- Torres spouses
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-7','True','Contact-4','PartyRoleRelation-7','Contact-5','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-8','True','Contact-5','PartyRoleRelation-7','Contact-4','');

-- Torres parent/child
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-9','True','Contact-4','PartyRoleRelation-3','Contact-6','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-10','True','Contact-4','PartyRoleRelation-3','Contact-7','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-11','True','Contact-4','PartyRoleRelation-3','Contact-8','');

INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-12','True','Contact-5','PartyRoleRelation-3','Contact-6','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-13','True','Contact-5','PartyRoleRelation-3','Contact-7','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-14','True','Contact-5','PartyRoleRelation-3','Contact-8','');

-- Torres children inverse
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-15','True','Contact-6','PartyRoleRelation-4','Contact-4','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-16','True','Contact-6','PartyRoleRelation-4','Contact-5','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-17','True','Contact-7','PartyRoleRelation-4','Contact-4','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-18','True','Contact-7','PartyRoleRelation-4','Contact-5','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-19','True','Contact-8','PartyRoleRelation-4','Contact-4','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-20','True','Contact-8','PartyRoleRelation-4','Contact-5','');

-- Torres siblings
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-21','True','Contact-6','PartyRoleRelation-8','Contact-7','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-22','True','Contact-6','PartyRoleRelation-8','Contact-8','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-23','True','Contact-7','PartyRoleRelation-8','Contact-6','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-24','True','Contact-7','PartyRoleRelation-8','Contact-8','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-25','True','Contact-8','PartyRoleRelation-8','Contact-6','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-26','True','Contact-8','PartyRoleRelation-8','Contact-7','');

-- Mason spouses
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-27','True','Contact-9','PartyRoleRelation-7','Contact-10','');
INSERT INTO "ContactContactRelation" VALUES('ContactContactRelation-28','True','Contact-10','PartyRoleRelation-7','Contact-9','');

COMMIT;

