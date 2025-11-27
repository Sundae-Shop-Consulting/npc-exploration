BEGIN TRANSACTION;

-- =========================================================
-- Accounts: 2 orgs + 8 volunteer person accounts
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
    "IsPersonAccount" VARCHAR(255),
    "OperatingHoursId" VARCHAR(255),
    "ParentId" VARCHAR(255),
    "PersonEmail" VARCHAR(255),
    "Phone" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Business Accounts (non-person)
INSERT INTO "Account" VALUES(
  'Account-1',
  '',
  '',
  'Seattle Community Food Bank',
  'False',
  'False',
  'False',
  '012RL000009LeYLYA0',
  'False',
  '',
  '',
  '',
  '(206) 555-0100'
);

INSERT INTO "Account" VALUES(
  'Account-2',
  '',
  '',
  'Friends of Greenlake Park',
  'False',
  'False',
  'False',
  '012RL000009LeYLYA0',
  'False',
  '',
  '',
  '',
  '(206) 555-0200'
);

-- Volunteer Person Accounts
INSERT INTO "Account" VALUES(
  'Account-3',
  'Alex',
  'Nguyen',
  '',
  'False',
  'False',
  'False',
  '012RL000009LeYMYA0',
  'True',
  '',
  '',
  'alex.nguyen@example.org',
  '(206) 555-1003'
);

INSERT INTO "Account" VALUES(
  'Account-4',
  'Maria',
  'Lopez',
  '',
  'False',
  'False',
  'False',
  '012RL000009LeYMYA0',
  'True',
  '',
  '',
  'maria.lopez@example.org',
  '(206) 555-1004'
);

INSERT INTO "Account" VALUES(
  'Account-5',
  'Jordan',
  'Reed',
  '',
  'False',
  'False',
  'False',
  '012RL000009LeYMYA0',
  'True',
  '',
  '',
  'jordan.reed@example.org',
  '(206) 555-1005'
);

INSERT INTO "Account" VALUES(
  'Account-6',
  'Priya',
  'Patel',
  '',
  'False',
  'False',
  'False',
  '012RL000009LeYMYA0',
  'True',
  '',
  '',
  'priya.patel@example.org',
  '(206) 555-1006'
);

INSERT INTO "Account" VALUES(
  'Account-7',
  'Sam',
  'Chen',
  '',
  'False',
  'False',
  'False',
  '012RL000009LeYMYA0',
  'True',
  '',
  '',
  'sam.chen@example.org',
  '(206) 555-1007'
);

INSERT INTO "Account" VALUES(
  'Account-8',
  'Taylor',
  'Martin',
  '',
  'False',
  'False',
  'False',
  '012RL000009LeYMYA0',
  'True',
  '',
  '',
  'taylor.martin@example.org',
  '(206) 555-1008'
);

INSERT INTO "Account" VALUES(
  'Account-9',
  'Owen',
  'Garcia',
  '',
  'False',
  'False',
  'False',
  '012RL000009LeYMYA0',
  'True',
  '',
  '',
  'owen.garcia@example.org',
  '(206) 555-1009'
);

INSERT INTO "Account" VALUES(
  'Account-10',
  'Lena',
  'Hughes',
  '',
  'False',
  'False',
  'False',
  '012RL000009LeYMYA0',
  'True',
  '',
  '',
  'lena.hughes@example.org',
  '(206) 555-1010'
);

-- =========================================================
-- Account Record Type Mapping
-- =========================================================

CREATE TABLE "Account_rt_mapping" (
    record_type_id VARCHAR(18) NOT NULL,
    developer_name VARCHAR(255),
    is_person_type BOOLEAN,
    PRIMARY KEY (record_type_id)
);

INSERT INTO "Account_rt_mapping" VALUES('012RL000009LeYLYA0','Business_Account',0);
INSERT INTO "Account_rt_mapping" VALUES('012RL000009LeYMYA0','PersonAccount',1);

-- =========================================================
-- Competencies (skills)
-- =========================================================

CREATE TABLE "Competency" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "Competency" VALUES('Competency-1','Food handling & safety');
INSERT INTO "Competency" VALUES('Competency-2','Customer service');
INSERT INTO "Competency" VALUES('Competency-3','Heavy lifting');
INSERT INTO "Competency" VALUES('Competency-4','Event setup & teardown');
INSERT INTO "Competency" VALUES('Competency-5','Outdoor work & landscaping');
INSERT INTO "Competency" VALUES('Competency-6','Children''s activities support');
INSERT INTO "Competency" VALUES('Competency-7','Data entry & check-in');
INSERT INTO "Competency" VALUES('Competency-8','Driving / delivery');
INSERT INTO "Competency" VALUES('Competency-9','Spanish language support');
INSERT INTO "Competency" VALUES('Competency-10','First aid / CPR');

-- =========================================================
-- Operating Hours
-- =========================================================

CREATE TABLE "OperatingHours" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "TimeZone" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "OperatingHours" VALUES('OperatingHours-1','Food Bank Saturday Morning','America/Los_Angeles');
INSERT INTO "OperatingHours" VALUES('OperatingHours-2','Park Cleanup Sunday Morning','America/Los_Angeles');
INSERT INTO "OperatingHours" VALUES('OperatingHours-3','Weeknight Youth Tutoring','America/Los_Angeles');

-- =========================================================
-- Time Slots (shift patterns tied to operating hours)
-- =========================================================

CREATE TABLE "TimeSlot" (
    id VARCHAR(255) NOT NULL,
    "DayOfWeek" VARCHAR(255),
    "EndTime" VARCHAR(255),
    "StartTime" VARCHAR(255),
    "Type" VARCHAR(255),
    "OperatingHoursId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Food bank Saturday
INSERT INTO "TimeSlot" VALUES('TimeSlot-1','Saturday','12:00:00.000Z','09:00:00.000Z','Normal','OperatingHours-1');

-- Park cleanup Sunday
INSERT INTO "TimeSlot" VALUES('TimeSlot-2','Sunday','11:30:00.000Z','09:00:00.000Z','Normal','OperatingHours-2');

-- Youth tutoring weeknight
INSERT INTO "TimeSlot" VALUES('TimeSlot-3','Tuesday','19:30:00.000Z','17:30:00.000Z','Normal','OperatingHours-3');

-- =========================================================
-- Positions (position templates)
-- =========================================================

CREATE TABLE "Position" (
    id VARCHAR(255) NOT NULL,
    "IsInternalApprovalRequired" VARCHAR(255),
    "Name" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "Position" VALUES('Position-1','False','Food Pantry Volunteer');
INSERT INTO "Position" VALUES('Position-2','False','Food Pantry Lead Volunteer');
INSERT INTO "Position" VALUES('Position-3','False','Park Cleanup Volunteer');
INSERT INTO "Position" VALUES('Position-4','False','Park Cleanup Crew Lead');
INSERT INTO "Position" VALUES('Position-5','False','Youth Tutor');
INSERT INTO "Position" VALUES('Position-6','False','Youth Program Assistant');

-- =========================================================
-- Position Qualifications (Position -> Competency)
-- =========================================================

CREATE TABLE "PositionQualification" (
    id VARCHAR(255) NOT NULL,
    "PositionId" VARCHAR(255),
    "QualificationReferenceRecordId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "PositionQualification" VALUES('PositionQualification-1','Position-1','Competency-1');
INSERT INTO "PositionQualification" VALUES('PositionQualification-2','Position-1','Competency-2');
INSERT INTO "PositionQualification" VALUES('PositionQualification-3','Position-1','Competency-3');
INSERT INTO "PositionQualification" VALUES('PositionQualification-4','Position-2','Competency-1');
INSERT INTO "PositionQualification" VALUES('PositionQualification-5','Position-2','Competency-2');
INSERT INTO "PositionQualification" VALUES('PositionQualification-6','Position-2','Competency-10');
INSERT INTO "PositionQualification" VALUES('PositionQualification-7','Position-3','Competency-3');
INSERT INTO "PositionQualification" VALUES('PositionQualification-8','Position-3','Competency-5');
INSERT INTO "PositionQualification" VALUES('PositionQualification-9','Position-4','Competency-5');
INSERT INTO "PositionQualification" VALUES('PositionQualification-10','Position-4','Competency-10');
INSERT INTO "PositionQualification" VALUES('PositionQualification-11','Position-5','Competency-6');
INSERT INTO "PositionQualification" VALUES('PositionQualification-12','Position-5','Competency-9');
INSERT INTO "PositionQualification" VALUES('PositionQualification-13','Position-6','Competency-6');
INSERT INTO "PositionQualification" VALUES('PositionQualification-14','Position-6','Competency-7');

CREATE TABLE "VolunteerInitiative" (
    id VARCHAR(255) NOT NULL,
    "IsPublished" VARCHAR(255),
    "Name" VARCHAR(255),
    "ParentVolunteerInitiativeId" VARCHAR(255),
    "Description" VARCHAR(8000),
    "StartDate" VARCHAR(255),
    "EndDate" VARCHAR(255),
    "Status" VARCHAR(255),
    "AttendanceRate" VARCHAR(255),
    "FilledAssignmentCount" VARCHAR(255),
    "OpenAssignmentCount" VARCHAR(255),
    "TotalActiveVolunteerCount" VARCHAR(255),
    "TotalAssignmentCount" VARCHAR(255),
    "TotalVolunteerHours" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "VolunteerInitiative" VALUES('VolunteerInitiative-1','True','Weekend Food Pantry','','A weekly food distribution effort serving families facing food insecurity in Seattle.','2025-01-01','','In Progress','92','24','6','18','30','180');
INSERT INTO "VolunteerInitiative" VALUES('VolunteerInitiative-2','True','Greenlake Park Cleanup Days','','Monthly park cleanup focused on litter removal and light maintenance at Greenlake Park.','2025-03-01','','In Progress','88','16','8','20','24','120');
INSERT INTO "VolunteerInitiative" VALUES('VolunteerInitiative-3','True','After-School Youth Tutoring','','Volunteer tutors support students with homework, reading, and enrichment activities during the school year.','2025-02-15','2025-06-15','In Progress','95','12','4','10','16','140');
INSERT INTO "VolunteerInitiative" VALUES('VolunteerInitiative-4','True','Summer Youth Tutoring Intensive','VolunteerInitiative-3','A focused 6-week tutoring program to prepare students for fall classes.','2025-07-01','2025-08-15','Upcoming','0','0','10','0','10','0');

-- =========================================================
-- Locations
-- =========================================================

CREATE TABLE "Location" (
    id VARCHAR(255) NOT NULL,
    "IsInventoryLocation" VARCHAR(255),
    "IsMobile" VARCHAR(255),
    "LocationType" VARCHAR(255),
    "Name" VARCHAR(255),
    "ShouldSyncWithOci" VARCHAR(255),
    "AccountId" VARCHAR(255),
    "ParentLocationId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "Location" VALUES('Location-1','False','False','Program Site','Food Bank Warehouse','False','Account-1','');
INSERT INTO "Location" VALUES('Location-2','False','False','Program Site','Greenlake Park North Meadow','False','Account-2','');
INSERT INTO "Location" VALUES('Location-3','False','False','Program Site','Community Center Classroom 101','False','Account-1','');

-- =========================================================
-- Person Location Availability
-- =========================================================

CREATE TABLE "PersonLocationAvailability" (
    id VARCHAR(255) NOT NULL,
    "UsageType" VARCHAR(255),
    "AccountId" VARCHAR(255),
    "LocationId" VARCHAR(255),
    "OperatingHoursId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Food bank: Alex, Maria, Jordan
INSERT INTO "PersonLocationAvailability" VALUES('PersonLocationAvailability-1','VolunteerManagement','Account-3','Location-1','OperatingHours-1');
INSERT INTO "PersonLocationAvailability" VALUES('PersonLocationAvailability-2','VolunteerManagement','Account-4','Location-1','OperatingHours-1');
INSERT INTO "PersonLocationAvailability" VALUES('PersonLocationAvailability-3','VolunteerManagement','Account-5','Location-1','OperatingHours-1');

-- Park cleanup: Priya, Sam, Owen
INSERT INTO "PersonLocationAvailability" VALUES('PersonLocationAvailability-4','VolunteerManagement','Account-6','Location-2','OperatingHours-2');
INSERT INTO "PersonLocationAvailability" VALUES('PersonLocationAvailability-5','VolunteerManagement','Account-7','Location-2','OperatingHours-2');
INSERT INTO "PersonLocationAvailability" VALUES('PersonLocationAvailability-6','VolunteerManagement','Account-9','Location-2','OperatingHours-2');

-- Youth tutoring: Taylor, Lena, Alex
INSERT INTO "PersonLocationAvailability" VALUES('PersonLocationAvailability-7','VolunteerManagement','Account-8','Location-3','OperatingHours-3');
INSERT INTO "PersonLocationAvailability" VALUES('PersonLocationAvailability-8','VolunteerManagement','Account-10','Location-3','OperatingHours-3');
INSERT INTO "PersonLocationAvailability" VALUES('PersonLocationAvailability-9','VolunteerManagement','Account-3','Location-3','OperatingHours-3');

-- =========================================================
-- Job Positions (specific postings)
-- =========================================================

CREATE TABLE "JobPosition" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "Title" VARCHAR(255),
    "LocationId" VARCHAR(255),
    "ManagerId" VARCHAR(255),
    "PositionId" VARCHAR(255),
    "VolunteerInitiativeId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Weekend Food Pantry
INSERT INTO "JobPosition" VALUES('JobPosition-1','Saturday Morning Food Sorting','Food Pantry Volunteer','Location-1','Account-3','Position-1','VolunteerInitiative-1');
INSERT INTO "JobPosition" VALUES('JobPosition-2','Saturday Guest Check-In','Food Pantry Lead Volunteer','Location-1','Account-4','Position-2','VolunteerInitiative-1');

-- Greenlake Park Cleanup
INSERT INTO "JobPosition" VALUES('JobPosition-3','Sunday Litter Pickup Crew','Park Cleanup Volunteer','Location-2','Account-6','Position-3','VolunteerInitiative-2');
INSERT INTO "JobPosition" VALUES('JobPosition-4','Sunday Crew Lead','Park Cleanup Crew Lead','Location-2','Account-7','Position-4','VolunteerInitiative-2');

-- Youth Tutoring
INSERT INTO "JobPosition" VALUES('JobPosition-5','Tuesday Math Tutor','Youth Tutor','Location-3','Account-8','Position-5','VolunteerInitiative-3');
INSERT INTO "JobPosition" VALUES('JobPosition-6','Tuesday Check-In & Snacks','Youth Program Assistant','Location-3','Account-10','Position-6','VolunteerInitiative-3');

-- =========================================================
-- Job Position Shifts
-- =========================================================

CREATE TABLE "JobPositionShift" (
    id VARCHAR(255) NOT NULL,
    "JobPositionId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Food bank shifts
INSERT INTO "JobPositionShift" VALUES('JobPositionShift-1','JobPosition-1');
INSERT INTO "JobPositionShift" VALUES('JobPositionShift-2','JobPosition-1');
INSERT INTO "JobPositionShift" VALUES('JobPositionShift-3','JobPosition-2');

-- Park cleanup shifts
INSERT INTO "JobPositionShift" VALUES('JobPositionShift-4','JobPosition-3');
INSERT INTO "JobPositionShift" VALUES('JobPositionShift-5','JobPosition-3');
INSERT INTO "JobPositionShift" VALUES('JobPositionShift-6','JobPosition-4');

-- Tutoring shifts
INSERT INTO "JobPositionShift" VALUES('JobPositionShift-7','JobPosition-5');
INSERT INTO "JobPositionShift" VALUES('JobPositionShift-8','JobPosition-5');
INSERT INTO "JobPositionShift" VALUES('JobPositionShift-9','JobPosition-6');

-- =========================================================
-- Job Position Qualifications (JobPosition -> Competency)
-- =========================================================

CREATE TABLE "JobPositionQualification" (
    id VARCHAR(255) NOT NULL,
    "JobPositionId" VARCHAR(255),
    "QualificationReferenceRecordId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-1','JobPosition-1','Competency-1');
INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-2','JobPosition-1','Competency-2');
INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-3','JobPosition-1','Competency-3');
INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-4','JobPosition-2','Competency-1');
INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-5','JobPosition-2','Competency-2');
INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-6','JobPosition-2','Competency-7');
INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-7','JobPosition-3','Competency-3');
INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-8','JobPosition-3','Competency-5');
INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-9','JobPosition-4','Competency-5');
INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-10','JobPosition-4','Competency-10');
INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-11','JobPosition-5','Competency-6');
INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-12','JobPosition-5','Competency-9');
INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-13','JobPosition-6','Competency-6');
INSERT INTO "JobPositionQualification" VALUES('JobPositionQualification-14','JobPosition-6','Competency-7');

-- =========================================================
-- Job Position Assignments (volunteers signed up)
-- =========================================================

CREATE TABLE "JobPositionAssignment" (
    id VARCHAR(255) NOT NULL,
    "Status" VARCHAR(255),
    "AssignedAccountId" VARCHAR(255),
    "AssignedPositionShiftId" VARCHAR(255),
    "JobPositionId" VARCHAR(255),
    "RelatedVolunteerInitiativeId" VARCHAR(255),
    "ScheduledStartTime" VARCHAR(255),
    "ScheduledEndTime" VARCHAR(255),
    "ActualStartTime" VARCHAR(255),
    "ActualEndTime" VARCHAR(255),
    "ActualDuration" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Food bank
INSERT INTO "JobPositionAssignment" VALUES(
  'JobPositionAssignment-1','Complete','Account-3','JobPositionShift-1','JobPosition-1','VolunteerInitiative-1',
  '2025-02-01T09:00:00Z','2025-02-01T12:00:00Z','2025-02-01T09:02:00Z','2025-02-01T11:58:00Z','2.93'
);

INSERT INTO "JobPositionAssignment" VALUES(
  'JobPositionAssignment-2','Complete','Account-4','JobPositionShift-2','JobPosition-1','VolunteerInitiative-1',
  '2025-02-08T09:00:00Z','2025-02-08T12:00:00Z','2025-02-08T09:05:00Z','2025-02-08T12:01:00Z','2.93'
);

INSERT INTO "JobPositionAssignment" VALUES(
  'JobPositionAssignment-3','In Progress','Account-3','JobPositionShift-3','JobPosition-2','VolunteerInitiative-1',
  '2025-02-15T09:00:00Z','2025-02-15T12:00:00Z','','',''
);

INSERT INTO "JobPositionAssignment" VALUES(
  'JobPositionAssignment-4','Upcoming','Account-5','JobPositionShift-3','JobPosition-2','VolunteerInitiative-1',
  '2025-03-01T09:00:00Z','2025-03-01T12:00:00Z','','',''
);

-- Park cleanup
INSERT INTO "JobPositionAssignment" VALUES(
  'JobPositionAssignment-5','Complete','Account-6','JobPositionShift-4','JobPosition-3','VolunteerInitiative-2',
  '2025-01-12T09:00:00Z','2025-01-12T11:30:00Z','2025-01-12T09:00:00Z','2025-01-12T11:25:00Z','2.42'
);

INSERT INTO "JobPositionAssignment" VALUES(
  'JobPositionAssignment-6','Canceled','Account-7','JobPositionShift-4','JobPosition-3','VolunteerInitiative-2',
  '2025-01-12T09:00:00Z','2025-01-12T11:30:00Z','','',''
);

INSERT INTO "JobPositionAssignment" VALUES(
  'JobPositionAssignment-7','In Progress','Account-9','JobPositionShift-5','JobPosition-3','VolunteerInitiative-2',
  '2025-01-19T09:00:00Z','2025-01-19T11:30:00Z','','',''
);

INSERT INTO "JobPositionAssignment" VALUES(
  'JobPositionAssignment-8','Upcoming','Account-6','JobPositionShift-6','JobPosition-4','VolunteerInitiative-2',
  '2025-02-02T09:00:00Z','2025-02-02T11:30:00Z','','',''
);

-- Tutoring
INSERT INTO "JobPositionAssignment" VALUES(
  'JobPositionAssignment-9','Complete','Account-8','JobPositionShift-7','JobPosition-5','VolunteerInitiative-3',
  '2025-02-05T17:30:00Z','2025-02-05T19:30:00Z','2025-02-05T17:31:00Z','2025-02-05T19:25:00Z','1.90'
);

INSERT INTO "JobPositionAssignment" VALUES(
  'JobPositionAssignment-10','Pending Verification','Account-10','JobPositionShift-8','JobPosition-5','VolunteerInitiative-3',
  '2025-02-12T17:30:00Z','2025-02-12T19:30:00Z','','',''
);

INSERT INTO "JobPositionAssignment" VALUES(
  'JobPositionAssignment-11','Upcoming','Account-3','JobPositionShift-9','JobPosition-6','VolunteerInitiative-3',
  '2025-02-19T17:30:00Z','2025-02-19T19:30:00Z','','',''
);

COMMIT;
