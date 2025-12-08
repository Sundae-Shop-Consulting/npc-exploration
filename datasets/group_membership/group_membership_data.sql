-- =========================================
-- Group Membership & Households Sample Data
-- =========================================

-- -----------------------------------------
-- Core objects
-- -----------------------------------------

CREATE TABLE "Account" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "RecordTypeId" VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE "Account_rt_mapping" (
    record_type_id VARCHAR(18) NOT NULL,
    developer_name VARCHAR(255),
    is_person_type BOOLEAN,
    PRIMARY KEY (record_type_id)
);

CREATE TABLE "Contact" (
    id VARCHAR(255) NOT NULL,
    "FirstName" VARCHAR(40),
    "LastName" VARCHAR(80),
    "AccountId" VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE "PartyRelationshipGroup" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "AccountId" VARCHAR(255),
    "Category" VARCHAR(40),
    "GroupSize" INTEGER,
    "Subtype" VARCHAR(40),
    "Description" VARCHAR(255),
    "Type" VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE "PartyRoleRelation" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "RelationshipObjectName" VARCHAR(255),
    "RoleName" VARCHAR(255),
    "RelatedRoleName" VARCHAR(255),
    "ShouldCreaInversRoleAuto" BOOLEAN,
    PRIMARY KEY (id)
);

CREATE TABLE "AccountContactRelation" (
    id VARCHAR(255) NOT NULL,
    "AccountId" VARCHAR(255),
    "ContactId" VARCHAR(255),
    "Roles" VARCHAR(4099),
    "IsPrimaryMember" BOOLEAN,
    "IsActive" BOOLEAN,
    "IsPrimaryGroup" BOOLEAN,
    "IsIncludedInGroup" BOOLEAN,
    PRIMARY KEY (id)
);

CREATE TABLE "AccountAccountRelation" (
    id VARCHAR(255) NOT NULL,
    "AccountId" VARCHAR(255),
    "RelatedAccountId" VARCHAR(255),
    "PartyRoleRelationId" VARCHAR(255),
    "IsActive" BOOLEAN,
    "HierarchyType" VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE "ContactContactRelation" (
    id VARCHAR(255) NOT NULL,
    "ContactId" VARCHAR(255),
    "RelatedContactId" VARCHAR(255),
    "PartyRoleRelationId" VARCHAR(255),
    "IsActive" BOOLEAN,
    "HierarchyType" VARCHAR(255),
    PRIMARY KEY (id)
);

-- -----------------------------------------
-- Record type mapping for Account
-- -----------------------------------------

INSERT INTO "Account_rt_mapping" VALUES('RT-HOUSEHOLD','Household_Account',FALSE);
INSERT INTO "Account_rt_mapping" VALUES('RT-BUSINESS','Business_Account',FALSE);

-- -----------------------------------------
-- Accounts (Households + related businesses)
-- -----------------------------------------

-- Two household accounts
INSERT INTO "Account" VALUES('Account-1','Smith Household','RT-HOUSEHOLD');
INSERT INTO "Account" VALUES('Account-2','Mason Household','RT-HOUSEHOLD');

-- Related business accounts (dealer + financial institution)
INSERT INTO "Account" VALUES('Account-3','Xela Motors','RT-BUSINESS');
INSERT INTO "Account" VALUES('Account-4','Xela Financials','RT-BUSINESS');

-- An additional business account to anchor a non-household group
INSERT INTO "Account" VALUES('Account-5','Car Oh! Dealers','RT-BUSINESS');

-- -----------------------------------------
-- Contacts (family members)
-- -----------------------------------------

-- Parents
INSERT INTO "Contact" VALUES('Contact-1','John','Smith','Account-1');  -- primary on Smith Household
INSERT INTO "Contact" VALUES('Contact-2','Mary','Mason','Account-2');  -- primary on Mason Household

-- Children who belong to BOTH households
INSERT INTO "Contact" VALUES('Contact-3','Leah','Mason','Account-2');  -- primary household: Mason
INSERT INTO "Contact" VALUES('Contact-4','Bob','Smith','Account-1');   -- primary household: Smith

-- -----------------------------------------
-- Party role relationship definitions
-- (standardized relationship types)
-- -----------------------------------------

-- Household-to-household relationship between accounts
INSERT INTO "PartyRoleRelation" VALUES(
  'PRR-1',
  'Family-Family AAR',
  'Account_Account_Relationship',
  'Family',
  'Family',
  FALSE
);

-- Spouse / partner relationship between contacts
INSERT INTO "PartyRoleRelation" VALUES(
  'PRR-2',
  'Spouse-Spouse CCR',
  'Contact_Contact_Relationship',
  'Spouse',
  'Spouse',
  FALSE
);

-- Parent / child relationship between contacts
INSERT INTO "PartyRoleRelation" VALUES(
  'PRR-3',
  'Parent-Child CCR',
  'Contact_Contact_Relationship',
  'Parent',
  'Child',
  TRUE
);

-- -----------------------------------------
-- Party relationship groups (Households & a dealer group)
-- -----------------------------------------

-- Party relationship group for each physical household
INSERT INTO "PartyRelationshipGroup" VALUES(
  'PRG-1',
  'Smith Household',
  NULL,                    -- AccountId (left NULL for now)
  'Staying under same roof',  -- valid Category picklist value
  3,
  'Nuclear Household',
  'Primary Smith household group',
  'Household'
);

INSERT INTO "PartyRelationshipGroup" VALUES(
  'PRG-2',
  'Mason Household',
  NULL,
  'Staying under same roof',
  3,
  'Nuclear Household',
  'Primary Mason household group',
  'Household'
);

-- Blended / co-parenting household group that spans both accounts
INSERT INTO "PartyRelationshipGroup" VALUES(
  'PRG-3',
  'Smith-Mason Household',
  NULL,
  'Staying under same roof',
  4,                        -- John, Mary, Leah, Bob
  'Extension Household',
  'Blended Smith/Mason co-parenting household',
  'Household'
);

-- Example of a non-household group (dealer group)
INSERT INTO "PartyRelationshipGroup" VALUES(
  'PRG-4',
  'Car Oh! Dealers',
  NULL,
  'Staying under same roof',  -- still required, even if not literally a household
  70,
  NULL,
  'Dealer group representing multiple car dealers',
  'Group'
);

-- -----------------------------------------
-- AccountContactRelation (group membership)
-- -----------------------------------------
-- This is where you see:
-- - Which contacts belong to which household account
-- - Which household is primary vs secondary for a given person
-- - Which relationships participate in group rollups (IsIncludedInGroup)

-- John Smith is the primary member of Smith Household
INSERT INTO "AccountContactRelation" VALUES(
  'ACR-1',
  'Account-1',                    -- Smith Household
  'Contact-1',                    -- John Smith
  'Business User;Decision Maker', -- Roles
  TRUE,                           -- IsPrimaryMember
  TRUE,                           -- IsActive
  TRUE,                           -- IsPrimaryGroup
  TRUE                            -- IsIncludedInGroup
);

-- Mary Mason is the primary member of Mason Household
INSERT INTO "AccountContactRelation" VALUES(
  'ACR-2',
  'Account-2',                    -- Mason Household
  'Contact-2',                    -- Mary Mason
  'Business User;Decision Maker',
  TRUE,
  TRUE,
  TRUE,
  TRUE
);

-- Leah Mason: primary household is Mason; she also belongs to Smith
INSERT INTO "AccountContactRelation" VALUES(
  'ACR-3',
  'Account-2',     -- Mason Household (primary)
  'Contact-3',     -- Leah Mason
  'Other',
  FALSE,           -- IsPrimaryMember
  TRUE,            -- IsActive
  TRUE,            -- IsPrimaryGroup
  TRUE             -- IsIncludedInGroup
);

INSERT INTO "AccountContactRelation" VALUES(
  'ACR-4',
  'Account-1',     -- Smith Household (secondary)
  'Contact-3',     -- Leah Mason
  'Other',
  FALSE,
  TRUE,
  FALSE,           -- not primary group
  TRUE
);

-- Bob Smith: primary household is Smith; also belongs to Mason
INSERT INTO "AccountContactRelation" VALUES(
  'ACR-5',
  'Account-1',     -- Smith Household (primary)
  'Contact-4',     -- Bob Smith
  'Other',
  FALSE,
  TRUE,
  TRUE,            -- primary group
  TRUE
);

INSERT INTO "AccountContactRelation" VALUES(
  'ACR-6',
  'Account-2',     -- Mason Household (secondary)
  'Contact-4',     -- Bob Smith
  'Other',
  FALSE,
  TRUE,
  FALSE,           -- not primary group
  TRUE
);

-- -----------------------------------------
-- AccountAccountRelation (household-to-household)
-- -----------------------------------------
-- Models the relationship between the two household accounts themselves
-- using the Family-Family AAR party role relationship.

INSERT INTO "AccountAccountRelation" VALUES(
  'AAR-1',
  'Account-1',   -- Smith Household
  'Account-2',   -- Mason Household
  'PRR-1',       -- Family-Family AAR
  TRUE,
  'Peer'         -- sibling / peer households
);

-- -----------------------------------------
-- ContactContactRelation (person-to-person)
-- -----------------------------------------
-- Spouse relationship between John and Mary, plus parent/child relationships
-- between each parent and each child, using the Parent-Child CCR type.

-- Spouses / partners
INSERT INTO "ContactContactRelation" VALUES(
  'CCR-1',
  'Contact-1',   -- John Smith
  'Contact-2',   -- Mary Mason
  'PRR-2',       -- Spouse-Spouse CCR
  TRUE,
  'Peer'
);

-- Parent-child relationships: John as parent
INSERT INTO "ContactContactRelation" VALUES(
  'CCR-2',
  'Contact-1',   -- John Smith
  'Contact-3',   -- Leah Mason
  'PRR-3',       -- Parent-Child CCR
  TRUE,
  'Parent'
);

INSERT INTO "ContactContactRelation" VALUES(
  'CCR-3',
  'Contact-1',   -- John Smith
  'Contact-4',   -- Bob Smith
  'PRR-3',
  TRUE,
  'Parent'
);

-- Parent-child relationships: Mary as parent
INSERT INTO "ContactContactRelation" VALUES(
  'CCR-4',
  'Contact-2',   -- Mary Mason
  'Contact-3',   -- Leah Mason
  'PRR-3',
  TRUE,
  'Parent'
);

INSERT INTO "ContactContactRelation" VALUES(
  'CCR-5',
  'Contact-2',   -- Mary Mason
  'Contact-4',   -- Bob Smith
  'PRR-3',
  TRUE,
  'Parent'
);
