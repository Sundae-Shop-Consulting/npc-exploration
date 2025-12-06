BEGIN TRANSACTION;

-- =========================================================
-- Accounts (minimal structure, with record type mapping)
-- =========================================================

CREATE TABLE "Account" (
    id VARCHAR(255) NOT NULL,
    "FirstName" VARCHAR(255),
    "LastName" VARCHAR(255),
    "Name" VARCHAR(255),
    "PersonDoNotCall" VARCHAR(255),
    "PersonHasOptedOutOfEmail" VARCHAR(255),
    "PersonHasOptedOutOfFax" VARCHAR(255),
    "RecordTypeId" VARCHAR(255),
    "ParentId" VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE "Account_rt_mapping" (
    record_type_id VARCHAR(18) NOT NULL,
    developer_name VARCHAR(255),
    is_person_type BOOLEAN,
    PRIMARY KEY (record_type_id)
);

INSERT INTO "Account_rt_mapping" VALUES('RT-BUSINESS','Business_Account',0);
INSERT INTO "Account_rt_mapping" VALUES('RT-PERSON','PersonAccount',1);

-- Business org account replacing "Sample Account for Entitlements"
INSERT INTO "Account" VALUES('Account-1','','','Northside Community Clinic','False','False','False','RT-BUSINESS',NULL);

-- Person accounts
INSERT INTO "Account" VALUES('Account-2','Suzanne','Bautista','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-3','Sarah','Ellis','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-4','Shawn','Ibarra','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-5','Collin','Huerta','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-6','Carolyn','Dalton','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-7','Karl','Franklin','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-8','Ashlee','Aguilar','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-9','Lucas','Armstrong','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-10','Cristian','Kerr','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-11','Tricia','Krause','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-12','Donald','Daugherty','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-13','Mindy','Shepherd','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-14','Colleen','Velez','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-15','Travis','Church','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-16','Andrea','Potter','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-17','Sergio','Kaiser','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-18','Diane','Ritter','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-19','Patrick','Bentley','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-20','Jeremy','Hess','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-21','Shirley','Wilcox','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-22','Sergio','Vincent','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-23','Bobby','Lane','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-24','Sheri','Lozano','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-25','Isabel','Novak','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-26','Brandy','Pugh','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-27','Johnny','Hunt','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-28','Andrew','Blevins','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-29','Carrie','Ortega','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-30','Johnathan','Williams','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-31','Meghan','Christensen','', 'False','False','False','RT-PERSON',NULL);

-- Business accounts
INSERT INTO "Account" VALUES('Account-32','','','Lynn PLC','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-33','','','Roman, Wilkerson and Frost','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-34','','','Lyons-Mayer','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-35','','','Welch, Hancock and Garza','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-36','','','Sutton-Chase','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-37','','','Goodman, Weiss and Roth','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-38','','','Paul-Gibbs','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-39','','','Day-Trujillo','False','False','False','RT-BUSINESS',NULL);

-- More person accounts
INSERT INTO "Account" VALUES('Account-40','Benefits','TestClient','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-41','Antonio','Flowers','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-42','Lindsay','Wilson','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-43','Kevin','Ross','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-44','Randy','Curry','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-45','Stacie','Marks','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-46','Katie','Herring','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-47','Darryl','Galvan','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-48','Kiara','Silva','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-49','Gerald','Cuevas','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-50','Beth','Bailey','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-51','Brendan','Wagner','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-52','Cheryl','Ward','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-53','Chelsea','Bradley','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-54','Xavier','Stephenson','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-55','Samantha','Holt','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-56','Marcia','Bender','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-57','Lynn','Dyer','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-58','Collin','Jarvis','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-59','Alison','Callahan','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-60','Luis','Hogan','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-61','Yesenia','Hayden','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-62','Isabella','Braun','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-63','Carlos','Cameron','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-64','Daisy','Boyer','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-65','Meredith','Henderson','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-66','Sherry','Ortega','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-67','Lucas','Henry','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-68','Anita','Church','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-69','Jake','Cowan','', 'False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-70','Rose','Wilcox','', 'False','False','False','RT-PERSON',NULL);

-- More business accounts
INSERT INTO "Account" VALUES('Account-71','','','Lee, Petersen and Fowler','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-72','','','Calderon-Browning','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-73','','','Haynes, Rivas and Spears','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-74','','','Jennings Ltd','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-75','','','Malone-Santos','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-76','','','Phelps, Krueger and Stephens','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-77','','','Hampton, Donaldson and Jacobson','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-78','','','Wheeler, Rowe and Levy','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-79','Benefits','TestClient','', 'False','False','False','RT-PERSON',NULL);

-- =========================================================
-- Contacts
-- =========================================================

CREATE TABLE "Contact" (
    id VARCHAR(255) NOT NULL,
    "HasOptedOutOfEmail" VARCHAR(255),
    "HasOptedOutOfFax" VARCHAR(255),
    "HasOptedOutOfPhone" VARCHAR(255),
    "FirstName" VARCHAR(255),
    "LastName" VARCHAR(255),
    "AccountId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Client contacts – not children of Person Accounts
INSERT INTO "Contact" VALUES('Contact-1','False','False','False','Suzanne','Bautista',NULL);
INSERT INTO "Contact" VALUES('Contact-2','False','False','False','Sarah','Ellis',NULL);
INSERT INTO "Contact" VALUES('Contact-3','False','False','False','Shawn','Ibarra',NULL);
INSERT INTO "Contact" VALUES('Contact-4','False','False','False','Collin','Huerta',NULL);
INSERT INTO "Contact" VALUES('Contact-5','False','False','False','Carolyn','Dalton',NULL);
INSERT INTO "Contact" VALUES('Contact-6','False','False','False','Karl','Franklin',NULL);
INSERT INTO "Contact" VALUES('Contact-7','False','False','False','Ashlee','Aguilar',NULL);
INSERT INTO "Contact" VALUES('Contact-8','False','False','False','Lucas','Armstrong',NULL);
INSERT INTO "Contact" VALUES('Contact-9','False','False','False','Cristian','Kerr',NULL);
INSERT INTO "Contact" VALUES('Contact-10','False','False','False','Meghan','Christensen',NULL);

-- Staff / partner contacts – tied to **business** accounts
INSERT INTO "Contact" VALUES('Contact-11','False','False','False','Alex','Rivera','Account-1');   -- Northside Community Clinic (business)
INSERT INTO "Contact" VALUES('Contact-12','False','False','False','Nora','Singh','Account-32');  -- Lynn PLC (business)

-- Additional standalone contacts (no org association)
INSERT INTO "Contact" VALUES('Contact-13','False','False','False','Casey','Morgan',NULL);
INSERT INTO "Contact" VALUES('Contact-14','False','False','False','Riley','James',NULL);
INSERT INTO "Contact" VALUES('Contact-15','False','False','False','Elliot','Green',NULL);
INSERT INTO "Contact" VALUES('Contact-16','False','False','False','Hannah','Ortiz',NULL);


-- =========================================================
-- Program and cohorts
-- =========================================================

CREATE TABLE "Program" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "ParentProgramId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "Program" VALUES
('Program-1','Family Stability Case Management',NULL),
('Program-2','Food Security Navigation',NULL),
('Program-3','Emergency Rental Assistance','Program-1'),
('Program-4','Youth Housing Support','Program-1'),
('Program-5','Benefits Enrollment Clinics','Program-2');

CREATE TABLE "ProgramCohort" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "ProgramId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "ProgramCohort" VALUES
('ProgCohort-1','Family Stability 2025 Cohort','Program-1'),
('ProgCohort-2','Youth Housing Spring 2025','Program-4');

-- =========================================================
-- Program Enrollment
-- =========================================================

CREATE TABLE "ProgramEnrollment" (
    id VARCHAR(255) NOT NULL,
    "IsActive" VARCHAR(255),
    "IsAnonymous" VARCHAR(255),
    "Name" VARCHAR(255),
    "AccountId" VARCHAR(255),
    "ProgramId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Program enrollments using Person Accounts as participants
INSERT INTO "ProgramEnrollment" VALUES
('Enroll-1','True','False','Suzanne – Family Stability','Account-2','Program-1'),
('Enroll-2','True','False','Sarah – Family Stability','Account-3','Program-1'),
('Enroll-3','True','False','Shawn – Family Stability','Account-4','Program-1'),
('Enroll-4','True','False','Collin – Family Stability','Account-5','Program-1'),
('Enroll-5','True','False','Carolyn – Rental Assistance','Account-6','Program-3'),
('Enroll-6','True','False','Karl – Food Security','Account-7','Program-2'),
('Enroll-7','False','False','Suzanne – Emergency Rental Assistance','Account-2','Program-3'),
('Enroll-8','False','False','Sarah – Youth Housing','Account-3','Program-4');

CREATE TABLE "ProgramCohortMember" (
    id VARCHAR(255) NOT NULL,
    "IsRemovedFromCohort" VARCHAR(255),
    "ProgramCohortId" VARCHAR(255),
    "ProgramEnrollmentId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "ProgramCohortMember" VALUES
('CohortMember-1','False','ProgCohort-1','Enroll-1'),
('CohortMember-2','False','ProgCohort-1','Enroll-3'),
('CohortMember-3','False','ProgCohort-1','Enroll-4'),
('CohortMember-4','False','ProgCohort-2','Enroll-8');

-- =========================================================
-- Business Hours
-- =========================================================

CREATE TABLE "BusinessHours" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "TimeZoneSidKey" VARCHAR(255),
    "IsActive" VARCHAR(255),
    "MondayStartTime" VARCHAR(255),
    "MondayEndTime" VARCHAR(255),
    "TuesdayStartTime" VARCHAR(255),
    "TuesdayEndTime" VARCHAR(255),
    "WednesdayStartTime" VARCHAR(255),
    "WednesdayEndTime" VARCHAR(255),
    "ThursdayStartTime" VARCHAR(255),
    "ThursdayEndTime" VARCHAR(255),
    "FridayStartTime" VARCHAR(255),
    "FridayEndTime" VARCHAR(255),
    "SaturdayStartTime" VARCHAR(255),
    "SaturdayEndTime" VARCHAR(255),
    "SundayStartTime" VARCHAR(255),
    "SundayEndTime" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Default business hours used by all cases in this dataset
INSERT INTO "BusinessHours" VALUES(
  'BH-Default',
  'Default NPC Business Hours',
  'America/Los_Angeles',
  'True',              -- IsActive
  '09:00:00.000Z',     -- MondayStartTime
  '17:00:00.000Z',     -- MondayEndTime
  '09:00:00.000Z',     -- TuesdayStartTime
  '17:00:00.000Z',     -- TuesdayEndTime
  '09:00:00.000Z',     -- WednesdayStartTime
  '17:00:00.000Z',     -- WednesdayEndTime
  '09:00:00.000Z',     -- ThursdayStartTime
  '17:00:00.000Z',     -- ThursdayEndTime
  '09:00:00.000Z',     -- FridayStartTime
  '17:00:00.000Z',     -- FridayEndTime
  NULL,                -- SaturdayStartTime
  NULL,                -- SaturdayEndTime
  NULL,                -- SundayStartTime
  NULL                 -- SundayEndTime
);

-- =========================================================
-- Case, Case Participants, Case Program
-- =========================================================

CREATE TABLE "Case" (
    id VARCHAR(255) NOT NULL,
    "IsEscalated" VARCHAR(255),
    "IsSelfServiceClosed" VARCHAR(255),
    "IsStopped" VARCHAR(255),
    "IsVisibleInSelfService" VARCHAR(255),
    "AccountId" VARCHAR(255),
    "ContactId" VARCHAR(255),
    "ParentId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "Case" VALUES
('Case-1','False','False','False','False','Account-2','Contact-1',NULL),
('Case-2','False','False','False','False','Account-3','Contact-2',NULL),
('Case-3','False','False','False','False','Account-4','Contact-3',NULL),
('Case-4','False','False','False','False','Account-5','Contact-4',NULL),
('Case-5','False','False','False','False','Account-6','Contact-5',NULL);

-- =========================================================
-- Case Participants
-- =========================================================

CREATE TABLE "CaseParticipant" (
    id VARCHAR(255) NOT NULL,
    "Status" VARCHAR(255),
    "CaseId" VARCHAR(255),
    "ParticipantId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "CaseParticipant" VALUES
('CasePart-1','Active','Case-1','Account-2'),
('CasePart-2','Active','Case-2','Account-3'),
('CasePart-3','Active','Case-3','Account-4'),
('CasePart-4','Active','Case-4','Account-5'),
('CasePart-5','Active','Case-5','Account-6');

CREATE TABLE "CaseProgram" (
    id VARCHAR(255) NOT NULL,
    "CaseId" VARCHAR(255),
    "ProgramEnrollmentId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "CaseProgram" VALUES
('CaseProg-1','Case-1','Enroll-1'),
('CaseProg-2','Case-1','Enroll-7'),
('CaseProg-3','Case-2','Enroll-3'),
('CaseProg-4','Case-3','Enroll-4'),
('CaseProg-5','Case-4','Enroll-5'),
('CaseProg-6','Case-5','Enroll-2');

-- =========================================================
-- Referral
-- =========================================================

CREATE TABLE "Referral" (
    id VARCHAR(255) NOT NULL,
    "IsSelfReferred" VARCHAR(255),
    "ReferralType" VARCHAR(255),
    "CaseId" VARCHAR(255),
    "ClientId" VARCHAR(255),
    "ReferrerId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "Referral" VALUES
('Referral-1','True','Self-Referral','Case-1','Contact-1',NULL),
('Referral-2','False','External Provider','Case-2','Contact-2','Contact-11'),
('Referral-3','False','External Provider','Case-3','Contact-3','Contact-12'),
('Referral-4','True','Self-Referral','Case-4','Contact-4',NULL),
('Referral-5','False','Community Partner','Case-5','Contact-5','Contact-11');

-- =========================================================
-- Care Plan Templates, Care Plans, Goals
-- =========================================================

CREATE TABLE "CarePlanTemplate" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "Status" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "CarePlanTemplate" VALUES
('CPT-1','Family Stability – Standard','Published'),
('CPT-2','Youth Housing – Intensive','Draft');

-- =========================================================
-- Care Plans
-- =========================================================

CREATE TABLE "CarePlan" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "Status" VARCHAR(255),
    "CarePlanTemplateId" VARCHAR(255),
    "CaseId" VARCHAR(255),
    "ParticipantId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- One care plan per case/client
INSERT INTO "CarePlan" VALUES
('CP-1','Suzanne – Family Stability Plan','Active','CPT-1','Case-1','Account-2'),
('CP-2','Sarah – Family Stability Plan','Active','CPT-1','Case-2','Account-3'),
('CP-3','Shawn – Family Stability Plan','Active','CPT-1','Case-3','Account-4'),
('CP-4','Collin – Rental Assistance Plan','Active','CPT-1','Case-4','Account-5');


CREATE TABLE "GoalDefinition" (
    id VARCHAR(255) NOT NULL,
    "Description" VARCHAR(255),
    "Name" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "GoalDefinition" VALUES
('GoalDef-1','Maintain stable housing for 12 months','Maintain Stable Housing'),
('GoalDef-2','Resolve past-due rent within 90 days','Resolve Rental Arrears'),
('GoalDef-3','Ensure consistent access to food','Improve Food Security'),
('GoalDef-4','Enroll in youth housing program','Enroll in Housing Program'),
('GoalDef-5','Connect to legal supports','Connect to Legal Aid');

CREATE TABLE "GoalAssignment" (
    id VARCHAR(255) NOT NULL,
    "EndDate" VARCHAR(255),
    "Name" VARCHAR(255),
    "StartDate" VARCHAR(255),
    "CarePlanId" VARCHAR(255),
    "GoalDefinitionId" VARCHAR(255),
    "ParentRecordId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "GoalAssignment" VALUES
('GoalAssign-1',
 '2025-06-30T23:59:59.000Z',
 'Suzanne – Maintain Stable Housing',
 '2025-01-15T00:00:00.000Z',
 'CP-1','GoalDef-1','Account-2'),

('GoalAssign-2',
 '2025-03-31T23:59:59.000Z',
 'Suzanne – Resolve Rental Arrears',
 '2025-01-15T00:00:00.000Z',
 'CP-1','GoalDef-2','Account-2'),

('GoalAssign-3',
 NULL,
 'Suzanne – Improve Food Security',
 '2025-08-01T00:00:00.000Z',
 'CP-2','GoalDef-3','Account-2'),

('GoalAssign-4',
 '2025-09-30T23:59:59.000Z',
 'Sarah – Enroll in Housing Program',
 '2025-04-01T00:00:00.000Z',
 'CP-3','GoalDef-4','Account-3'),

('GoalAssign-5',
 NULL,
 'Carolyn – Resolve Rental Arrears',
 '2025-11-01T00:00:00.000Z',
 'CP-4','GoalDef-2','Account-6');

-- =========================================================
-- Code Sets, Bundles, Barrier Types, Barriers
-- =========================================================

CREATE TABLE "CodeSet" (
    id VARCHAR(255) NOT NULL,
    "Code" VARCHAR(255),
    "IsActive" VARCHAR(255),
    "IsCustomCode" VARCHAR(255),
    "IsPrimary" VARCHAR(255),
    "Name" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "CodeSet" VALUES
('CodeSet-1','HOUSING-DEMO','True','True','True','Housing Instability.'),
('CodeSet-2','INCOME-DEMO','True','True','False','Insufficient Income.'),
('CodeSet-3','FOOD-DEMO','True','True','False','Food Insecurity.'),
('CodeSet-4','LEGAL-DEMO','True','True','False','Legal Issue.');

CREATE TABLE "CodeSetBundle" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "CodeSet1Id" VARCHAR(255),
    "CodeSet2Id" VARCHAR(255),
    "CodeSet3Id" VARCHAR(255),
    "CodeSet4Id" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "CodeSetBundle" VALUES
('CodeBundle-1','Basic Stability Barriers',
 'CodeSet-1','CodeSet-2','CodeSet-3','CodeSet-4');

CREATE TABLE "CareBarrierType" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "BarrierType" VARCHAR(255),
    "DiagnosisCodeSetId" VARCHAR(255),
    "RiskFactorCodeSetId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "CareBarrierType" VALUES
('BarrierType-1','Housing Barrier','Housing','CodeSet-1',NULL),
('BarrierType-2','Income Barrier','Financial','CodeSet-2',NULL),
('BarrierType-3','Food Barrier','Food','CodeSet-3',NULL);

-- =========================================================
-- Care Barriers
-- =========================================================

CREATE TABLE "CareBarrier" (
    id VARCHAR(255) NOT NULL,
    "IsActive" VARCHAR(255),
    "Name" VARCHAR(255),
    "Status" VARCHAR(255),
    "CareBarrierTypeId" VARCHAR(255),
    "CaseId" VARCHAR(255),
    "PatientId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Example barriers tied to cases + clients (Person Accounts)
INSERT INTO "CareBarrier" VALUES
('Barrier-1','True','Eviction notice','Open','CBType-1','Case-1','Account-2'),
('Barrier-2','True','Food insecurity','Open','CBType-2','Case-1','Account-2'),
('Barrier-3','True','Job loss','Open','CBType-3','Case-2','Account-3'),
('Barrier-4','True','Unstable employment','Open','CBType-3','Case-3','Account-4');

-- =========================================================
-- CarePlanTemplateGoal, CarePlanTemplateBenefit
-- =========================================================

CREATE TABLE "CarePlanTemplateGoal" (
    id VARCHAR(255) NOT NULL,
    "CarePlanTemplateId" VARCHAR(255),
    "GoalDefinitionId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "CarePlanTemplateGoal" VALUES
('CPTGoal-1','CPT-2','GoalDef-1'),
('CPTGoal-2','CPT-2','GoalDef-2'),
('CPTGoal-3','CPT-2','GoalDef-3'),
('CPTGoal-4','CPT-2','GoalDef-4');

CREATE TABLE "CarePlanTemplateBenefit" (
    id VARCHAR(255) NOT NULL,
    "BenefitId" VARCHAR(255),
    "CarePlanTemplateId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- no rows yet, but structure exists

CREATE TABLE "UnitOfMeasure" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "UnitCode" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "UnitOfMeasure" VALUES
('UOM-1','Count','COUNT'),
('UOM-2','Percent','PERCENT');


--- =========================================================
-- Recurrence Schedule (Program Management)
-- =========================================================

CREATE TABLE "RecurrenceSchedule" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "NextScheduleDateTime" VARCHAR(255),
    "ProcessName" VARCHAR(255),
    "ScheduleFrequency" VARCHAR(255),
    "ScheduleDayValue" INTEGER,
    "StartDate" VARCHAR(255),
    "EndDate" VARCHAR(255),
    "TotalRecurrencesCount" INTEGER,
    PRIMARY KEY (id)
);

-- Monthly schedule for grocery-related benefits
INSERT INTO "RecurrenceSchedule" VALUES (
  'RecSched-1',
  'Monthly Grocery Support Schedule',
  '2025-09-15T10:00:00.000Z',   -- NextScheduleDateTime
  'Industries_ProgramManagement',
  'Monthly',
  NULL,                         -- ScheduleDayValue (not needed for Monthly)
  '2025-06-15',                 -- StartDate
  '2025-12-15',                 -- EndDate
  7                             -- TotalRecurrencesCount
);

-- Quarterly schedule for housing check-ins
INSERT INTO "RecurrenceSchedule" VALUES (
  'RecSched-2',
  'Quarterly Housing Stability Check-Ins',
  '2025-04-01T17:00:00.000Z',
  'Industries_ProgramManagement',
  'Quarterly',
  NULL,                         -- ScheduleDayValue (not needed for Quarterly)
  '2025-01-01',
  '2025-12-31',
  4
);

-- Biweekly schedule for youth support touchpoints
INSERT INTO "RecurrenceSchedule" VALUES (
  'RecSched-3',
  'Biweekly Youth Support Touchpoints',
  '2025-03-14T16:00:00.000Z',
  'Industries_ProgramManagement',
  'Biweekly',
  64,                           -- ScheduleDayValue: e.g., Monday (bit mask)
  '2025-02-01',
  '2025-06-30',
  10
);


-- =========================================================
-- Benefit Types, Benefits, Schedules, Sessions, Assignments
-- =========================================================

CREATE TABLE "BenefitType" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "ProcessType" VARCHAR(255),
    "UnitOfMeasureId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "BenefitType" VALUES
('BenType-1','Grocery Vouchers','ProgramManagement','UOM-1'),
('BenType-2','Rental Assistance Payment','ProgramManagement','UOM-1'),
('BenType-3','Transit Passes','ProgramManagement','UOM-1');

CREATE TABLE "Benefit" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "BenefitTypeId" VARCHAR(255),
    "ProgramId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "Benefit" VALUES
('Benefit-1','Suzanne Grocery Support','BenType-1','Program-2'),
('Benefit-2','Suzanne Rental Assistance','BenType-2','Program-3'),
('Benefit-3','Sarah Housing Transition Support','BenType-2','Program-4'),
('Benefit-4','Carolyn Rental Assistance','BenType-2','Program-3'),
('Benefit-5','Suzanne Transit Support','BenType-3','Program-1');

CREATE TABLE "BenefitSchedule" (
    id VARCHAR(255) NOT NULL,
    "DefaultBenefitQuantity" VARCHAR(255),
    "Description" VARCHAR(255),
    "FirstSessionEndDateTime" VARCHAR(255),
    "FirstSessionStartDateTime" VARCHAR(255),
    "MaximumParticipantCount" VARCHAR(255),
    "Name" VARCHAR(255),
    "BenefitId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "BenefitSchedule" VALUES
('BenSched-1','1','Monthly grocery pickup – Suzanne',
 '2025-09-15T11:00:00.000Z',
 '2025-09-15T10:00:00.000Z',
 '10',
 'Suzanne Monthly Grocery Pickup',
 'Benefit-1'),

('BenSched-2','1','One-time rental payment – Suzanne',
 '2025-03-10T18:00:00.000Z',
 '2025-03-10T17:00:00.000Z',
 '5',
 'Suzanne Rental Assistance Session',
 'Benefit-2'),

('BenSched-3','1','Youth housing workshop – Sarah',
 '2025-05-20T20:00:00.000Z',
 '2025-05-20T18:00:00.000Z',
 '15',
 'Sarah Housing Workshop',
 'Benefit-3');

CREATE TABLE "BenefitSession" (
    id VARCHAR(255) NOT NULL,
    "EndDateTime" VARCHAR(255),
    "Name" VARCHAR(255),
    "StartDateTime" VARCHAR(255),
    "Status" VARCHAR(255),
    "BenefitScheduleId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "BenefitSession" VALUES
('BenSess-1',
 '2025-09-15T11:00:00.000Z',
 'Suzanne Grocery – Sept',
 '2025-09-15T10:00:00.000Z',
 'Completed',
 'BenSched-1'),

('BenSess-2',
 '2025-10-15T11:00:00.000Z',
 'Suzanne Grocery – Oct',
 '2025-10-15T10:00:00.000Z',
 'Completed',
 'BenSched-1'),

('BenSess-3',
 '2025-11-15T11:00:00.000Z',
 'Suzanne Grocery – Nov',
 '2025-11-15T10:00:00.000Z',
 'Completed',
 'BenSched-1'),

('BenSess-4',
 '2026-01-15T11:00:00.000Z',
 'Suzanne Grocery – Jan',
 '2026-01-15T10:00:00.000Z',
 'Scheduled',
 'BenSched-1'),

('BenSess-5',
 '2025-03-10T18:00:00.000Z',
 'Suzanne Rental – One-time',
 '2025-03-10T17:00:00.000Z',
 'Completed',
 'BenSched-2'),

('BenSess-6',
 '2025-05-20T20:00:00.000Z',
 'Sarah Housing Workshop',
 '2025-05-20T18:00:00.000Z',
 'Completed',
 'BenSched-3');

CREATE TABLE "BenefitAssignment" (
    id VARCHAR(255) NOT NULL,
    "IsActive" VARCHAR(255),
    "Name" VARCHAR(255),
    "ParticipantId" VARCHAR(255),
    "ProgramEnrollmentId" VARCHAR(255),
    "BenefitId" VARCHAR(255),
    "ParentRecordId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "BenefitAssignment" VALUES
('BenAssign-1','True','Suzanne – Grocery Support','Contact-1','Enroll-1','Benefit-1','CP-2'),
('BenAssign-2','True','Suzanne – Rental Assistance','Contact-1','Enroll-7','Benefit-2','Enroll-7'),
('BenAssign-3','True','Sarah – Housing Support','Contact-2','Enroll-8','Benefit-3','Enroll-8'),
('BenAssign-4','True','Carolyn – Rental Assistance','Contact-4','Enroll-5','Benefit-4','Enroll-5'),
('BenAssign-5','True','Suzanne – Transit Support','Contact-1','Enroll-1','Benefit-5','Enroll-1');

CREATE TABLE "BenefitScheduleAssignment" (
    id VARCHAR(255) NOT NULL,
    "BenefitScheduleId" VARCHAR(255),
    "BenefitAssignmentId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "BenefitScheduleAssignment" VALUES
('BenSchedAssign-1','BenSched-1','BenAssign-1'),
('BenSchedAssign-2','BenSched-2','BenAssign-2'),
('BenSchedAssign-3','BenSched-3','BenAssign-3');

CREATE TABLE "BenefitDisbursement" (
    id VARCHAR(255) NOT NULL,
    "ActualCompletionDate" VARCHAR(255),
    "Name" VARCHAR(255),
    "BenefitAssignmentId" VARCHAR(255),
    "BenefitSessionId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "BenefitDisbursement" VALUES
('BenDisb-1','2025-09-15','Suzanne Grocery Sept','BenAssign-1','BenSess-1'),
('BenDisb-2','2025-10-15','Suzanne Grocery Oct','BenAssign-1','BenSess-2'),
('BenDisb-3','2025-11-15','Suzanne Grocery Nov','BenAssign-1','BenSess-3'),
('BenDisb-4','2025-03-10','Suzanne Rental One-time','BenAssign-2','BenSess-5'),
('BenDisb-5','2025-05-20','Sarah Housing Workshop','BenAssign-3','BenSess-6');

-- =========================================================
-- Care Plan Detail and Goal Assignment Detail
-- =========================================================

CREATE TABLE "CarePlanDetail" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "CarePlanId" VARCHAR(255),
    "Description" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "CarePlanDetail" VALUES
('CPDetail-1','Suzanne – Initial Intake','CP-1','Completed intake and assessment.'),
('CPDetail-2','Suzanne – Landlord Negotiation','CP-1','Negotiated repayment plan.'),
('CPDetail-3','Suzanne – Food Pantry Enrollment','CP-2','Enrolled in monthly food pickup.'),
('CPDetail-4','Sarah – Housing Intake','CP-3','Completed youth housing intake.'),
('CPDetail-5','Carolyn – Rental Arrears Intake','CP-4','Gathered documentation for arrears.');

CREATE TABLE "GoalAssignmentDetail" (
    id VARCHAR(255) NOT NULL,
    "DetailCodeId" VARCHAR(255),
    "DetailRecordId" VARCHAR(255),
    "GoalAssignmentId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "GoalAssignmentDetail" VALUES
('GoalDetail-1','CodeSet-1','Barrier-1','GoalAssign-1'),
('GoalDetail-2','CodeSet-2','Barrier-2','GoalAssign-2'),
('GoalDetail-3','CodeSet-3','Barrier-3','GoalAssign-3'),
('GoalDetail-4','CodeSet-1','Barrier-4','GoalAssign-4'),
('GoalDetail-5','CodeSet-2','Barrier-5','GoalAssign-5');

-- =========================================================
-- Interaction Summary
-- =========================================================

CREATE TABLE "InteractionSummary" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "InteractionDate" VARCHAR(255),
    "AccountId" VARCHAR(255),
    "RelatedRecordId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- For this dataset:
--  - AccountId = client’s Person Account
--  - RelatedRecordId = Case

INSERT INTO "InteractionSummary" VALUES
('Interact-1','Suzanne – Intake Appointment','2025-01-10','Account-2','Case-1'),
('Interact-2','Suzanne – Landlord Call','2025-02-05','Account-2','Case-1'),
('Interact-3','Suzanne – Food Pantry Orientation','2025-08-05','Account-2','Case-1'),
('Interact-4','Sarah – Intake Appointment','2025-03-01','Account-3','Case-2'),
('Interact-5','Shawn – Intake Appointment','2025-03-15','Account-4','Case-3'),
('Interact-6','Carolyn – Rental Assistance Intake','2025-11-02','Account-5','Case-4');

-- =========================================================
-- Public Complaint, ComplaintCase, ComplaintParticipant
-- =========================================================

CREATE TABLE "PublicComplaint" (
    id VARCHAR(255) NOT NULL,
    "IncidentDate" VARCHAR(255),
    "Name" VARCHAR(255),
    "ComplainantId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "PublicComplaint" VALUES
('Complaint-1','2025-02-15','Noise Complaint – Shared Housing','Contact-2'),
('Complaint-2','2025-07-10','Unsafe Housing Conditions','Contact-1');

CREATE TABLE "ComplaintCase" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "CaseId" VARCHAR(255),
    "PublicComplaintId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "ComplaintCase" VALUES
('ComplaintCase-1','Sarah Housing Complaint Case','Case-2','Complaint-1'),
('ComplaintCase-2','Suzanne Housing Complaint Case','Case-1','Complaint-2');

CREATE TABLE "ComplaintParticipant" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "ComplaintCaseId" VARCHAR(255),
    "ParticipantId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "ComplaintParticipant" VALUES
('ComplaintPart-1','Complainant – Sarah','ComplaintCase-1','Contact-2'),
('ComplaintPart-2','Complainant – Suzanne','ComplaintCase-2','Contact-1'),
('ComplaintPart-3','Landlord Representative','ComplaintCase-2','Contact-11');

-- =========================================================
-- Outcome / Indicator
-- =========================================================

CREATE TABLE "Outcome" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "Status" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Simple outcome framework tied conceptually to your programs:
--  - A couple of active, currently-tracked outcomes
--  - One completed/historical outcome
--  - One planned/future outcome

INSERT INTO "Outcome" VALUES(
  'Outcome-1',
  'Reduce food insecurity for enrolled households',
  'In Progress'
);

INSERT INTO "Outcome" VALUES(
  'Outcome-2',
  'Improve housing stability for enrolled clients',
  'In Progress'
);

INSERT INTO "Outcome" VALUES(
  'Outcome-3',
  'Increase employment for job-readiness participants',
  'Completed'
);

INSERT INTO "Outcome" VALUES(
  'Outcome-4',
  'Improve access to mental health supports',
  'Planned'
);

CREATE TABLE "IndicatorDefinition" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "Status" VARCHAR(255),
    "UnitOfMeasureId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "IndicatorDefinition" VALUES
('IndDef-1','Households retaining stable housing','Active','UOM-1'),
('IndDef-2','Clients with improved food security','Active','UOM-2');

CREATE TABLE "IndicatorAssignment" (
    id VARCHAR(255) NOT NULL,
    "IndicatorAssignmentType" VARCHAR(255),
    "Name" VARCHAR(255),
    "Status" VARCHAR(255),
    "IndicatorDefinitionId" VARCHAR(255),
    "OutcomeId" VARCHAR(255),
    "ProgramId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Link food security outcome to your food security program
INSERT INTO "IndicatorAssignment" VALUES (
  'IndAssign-1',
  'Outcome',  -- IndicatorAssignmentType
  'Food security outcome for pantry program',
  'Active',   -- valid status: Active / Canceled / Completed / Planned
  'IndDef-2', -- Clients with improved food security
  'Outcome-1',
  'Program-2' 
);

-- Link housing stability outcome
INSERT INTO "IndicatorAssignment" VALUES (
  'IndAssign-2',
  'Outcome',
  'Housing stability outcome for rental assistance program',
  'Active',
  'IndDef-1', -- Households retaining stable housing
  'Outcome-2',
  'Program-4'
);

-- Historical / completed employment outcome
INSERT INTO "IndicatorAssignment" VALUES (
  'IndAssign-3',
  'Outcome',
  'Employment outcome for job-readiness program',
  'Completed',
  'IndDef-1',
  'Outcome-3',
  'Program-1' 
);

CREATE TABLE "OutcomeActivity" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "OutcomeActivityType" VARCHAR(255),
    "BenefitId" VARCHAR(255),
    "GoalDefinitionId" VARCHAR(255),
    "OutcomeId" VARCHAR(255),
    "ProgramId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Food security: pantry distributions linked to a food benefit + goal
INSERT INTO "OutcomeActivity" VALUES (
  'OutAct-1',
  'Monthly pantry food distributions',
  'Outcome',          -- OutcomeActivityType (Outcome / Care Program are standard values) :contentReference[oaicite:6]{index=6}
  'Benefit-1',        -- adjust to a real food-related Benefit id
  'GoalDefinition-1', -- adjust to a real goal definition id
  'Outcome-1',
  'Program-1'
);

-- Housing stability: rental assistance checks
INSERT INTO "OutcomeActivity" VALUES (
  'OutAct-2',
  'Quarterly housing stability check-ins',
  'Outcome',
  'Benefit-2',        -- e.g. rental assistance benefit
  'GoalDefinition-2', -- housing stability goal
  'Outcome-2',
  'Program-2'
);

-- Employment: job-readiness workshops
INSERT INTO "OutcomeActivity" VALUES (
  'OutAct-3',
  'Job readiness workshop series',
  'Outcome',
  'Benefit-3',        -- e.g. job coaching / training benefit
  'GoalDefinition-3', -- employment outcome goal
  'Outcome-3',
  'Program-3'
);


COMMIT;
