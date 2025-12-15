BEGIN TRANSACTION;

--------------------------------------------------------------------------------
-- Account + Account_rt_mapping
--------------------------------------------------------------------------------

CREATE TABLE "Account" (
    id VARCHAR(255) NOT NULL,
    "FirstName" VARCHAR(255),
    "LastName" VARCHAR(255),
    "PersonEmail" VARCHAR(255),
    "PersonBirthdate" VARCHAR(255),
    "PersonMailingStreet" VARCHAR(255),
    "PersonMailingCity" VARCHAR(255),
    "PersonMailingState" VARCHAR(255),
    "PersonMailingPostalCode" VARCHAR(255),
    "PersonMailingCountry" VARCHAR(255),
    "Phone" VARCHAR(255),
    "Description" VARCHAR(5000),
    "RecordTypeId" VARCHAR(255),
    "IsPersonAccount" VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE "Account_rt_mapping" (
    record_type_id VARCHAR(18) NOT NULL,
    developer_name VARCHAR(255),
    is_person_type BOOLEAN,
    PRIMARY KEY (record_type_id)
);

INSERT INTO "Account_rt_mapping" VALUES('RT-PERSON','PersonAccount',1);

-- Person Accounts (Philanthropic Prospects)
INSERT INTO "Account" VALUES('Account-1','Elizabeth','Chen','elizabeth.chen@techexec.example','1975-04-15','2400 Pacific Heights Ave','San Francisco','California','94109','United States','415-555-0101','Tech industry executive and entrepreneur. Founded two successful startups, currently serves on multiple nonprofit boards.','RT-PERSON','true');
INSERT INTO "Account" VALUES('Account-2','Robert','Morrison','robert.morrison@healthfund.example','1962-09-22','180 Beacon Street','Boston','Massachusetts','02116','United States','617-555-0202','Retired healthcare executive with strong interest in medical research and education.','RT-PERSON','true');
INSERT INTO "Account" VALUES('Account-3','Priya','Patel','priya.patel@investco.example','1989-11-08','875 North Michigan Avenue','Chicago','Illinois','60611','United States','312-555-0303','Rising investment banker and university alumna. Active in young professional networks.','RT-PERSON','true');
INSERT INTO "Account" VALUES('Account-4','Margaret','Whitfield','margaret.whitfield@estate.example','1948-03-30','1500 Estate Drive','Greenwich','Connecticut','06830','United States','203-555-0404','Multi-generational supporter with family foundation. Estate planning discussions underway.','RT-PERSON','true');

--------------------------------------------------------------------------------
-- Contact
--------------------------------------------------------------------------------

CREATE TABLE "Contact" (
    id VARCHAR(255) NOT NULL,
    "FirstName" VARCHAR(255),
    "LastName" VARCHAR(255),
    "Email" VARCHAR(255),
    "Birthdate" VARCHAR(255),
    "MailingStreet" VARCHAR(255),
    "MailingCity" VARCHAR(255),
    "MailingState" VARCHAR(255),
    "MailingPostalCode" VARCHAR(255),
    "MailingCountry" VARCHAR(255),
    "Phone" VARCHAR(255),
    "Title" VARCHAR(255),
    "Description" VARCHAR(5000),
    "IsPersonAccount" VARCHAR(255),
    "AccountId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Contacts automatically created for Person Accounts
INSERT INTO "Contact" VALUES('Contact-1','Elizabeth','Chen','elizabeth.chen@techexec.example','1975-04-15','2400 Pacific Heights Ave','San Francisco','California','94109','United States','415-555-0101','Tech Executive','Tech industry executive and entrepreneur','true','Account-1');
INSERT INTO "Contact" VALUES('Contact-2','Robert','Morrison','robert.morrison@healthfund.example','1962-09-22','180 Beacon Street','Boston','Massachusetts','02116','United States','617-555-0202','Retired Healthcare CEO','Retired healthcare executive','true','Account-2');
INSERT INTO "Contact" VALUES('Contact-3','Priya','Patel','priya.patel@investco.example','1989-11-08','875 North Michigan Avenue','Chicago','Illinois','60611','United States','312-555-0303','Managing Director','Rising investment banker','true','Account-3');
INSERT INTO "Contact" VALUES('Contact-4','Margaret','Whitfield','margaret.whitfield@estate.example','1948-03-30','1500 Estate Drive','Greenwich','Connecticut','06830','United States','203-555-0404','Philanthropist','Multi-generational supporter','true','Account-4');

--------------------------------------------------------------------------------
-- ContactProfile
--------------------------------------------------------------------------------

CREATE TABLE "ContactProfile" (
    id VARCHAR(255) NOT NULL,
    "ContactId" VARCHAR(255),
    "BirthPlace" VARCHAR(255),
    "PrimaryCitizenshipType" VARCHAR(255),
    "HighestEducationLevel" VARCHAR(255),
    "Ethnicity" VARCHAR(255),
    "OtherAssetsValue" VARCHAR(255),
    "RetirementSavingsAmount" VARCHAR(255),
    "StockValue" VARCHAR(255),
    "RealEstateValue" VARCHAR(255),
    "BusinessOwnershipValue" VARCHAR(255),
    "Income" VARCHAR(255),
    "OtherNonprofitGiftCount" VARCHAR(255),
    "OtherNonprofitGiftAmount" VARCHAR(255),
    "RecurringDonorType" VARCHAR(255),
    "Location" VARCHAR(255),
    "GenerationalCohort" VARCHAR(255),
    "AdvancementGraduationDate" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "ContactProfile" VALUES('ContactProfile-1','Contact-1','Taipei, Taiwan','National','PhD','Not Hispanic or Latino','15000000','8500000','45000000','12000000','25000000','3500000','12','850000','Active','San Francisco Bay Area','Generation X (1965-1980)','1997-06-15');
INSERT INTO "ContactProfile" VALUES('ContactProfile-2','Contact-2','Boston, Massachusetts','National','PhD','Not Hispanic or Latino','5000000','6500000','12000000','8500000',NULL,'425000','8','165000','Active','Greater Boston','Baby Boomers (1946-1964)','1986-05-20');
INSERT INTO "ContactProfile" VALUES('ContactProfile-3','Contact-3','Mumbai, India','National','Masters','Not Hispanic or Latino',NULL,NULL,NULL,NULL,NULL,'875000','3','35000',NULL,'Chicago','Millennials (1981-1996)','2015-05-20');
INSERT INTO "ContactProfile" VALUES('ContactProfile-4','Contact-4','Greenwich, Connecticut','National','Graduate','Not Hispanic or Latino','10000000','5000000','25000000','45000000',NULL,'1200000','8','2000000','Active','Connecticut','Silent Generation (1928-1945)','1970-06-15');

--------------------------------------------------------------------------------
-- PartyCategory
--------------------------------------------------------------------------------

CREATE TABLE "PartyCategory" (
    id VARCHAR(255) NOT NULL,
    "AccountId" VARCHAR(255),
    "Classification" VARCHAR(255),
    "Status" VARCHAR(255),
    "StartDate" VARCHAR(255),
    "EndDate" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "PartyCategory" VALUES('PartyCategory-1','Account-1','High Net Worth Prospect','Active','2023-01-15',NULL);
INSERT INTO "PartyCategory" VALUES('PartyCategory-2','Account-2','Legacy Prospect','Active','2022-03-10',NULL);
INSERT INTO "PartyCategory" VALUES('PartyCategory-3','Account-3','Undergrad or Grad Prospect','Active','2024-01-05',NULL);
INSERT INTO "PartyCategory" VALUES('PartyCategory-4','Account-4','Legacy Prospect','Active','2018-05-22',NULL);

--------------------------------------------------------------------------------
-- ConstituentRole
--------------------------------------------------------------------------------

CREATE TABLE "ConstituentRole" (
    id VARCHAR(255) NOT NULL,
    "PersonId" VARCHAR(255),
    "RoleType" VARCHAR(255),
    "Status" VARCHAR(255),
    "EffectiveStartDate" VARCHAR(255),
    "EffectiveEndDate" VARCHAR(255),
    "Description" VARCHAR(5000),
    PRIMARY KEY (id)
);

INSERT INTO "ConstituentRole" VALUES('ConstituentRole-1','Contact-1','Donor','Active','2020-03-15',NULL,'Annual donor and board member through spouse');
INSERT INTO "ConstituentRole" VALUES('ConstituentRole-2','Contact-2','Donor','Active','1995-09-20',NULL,'Long-time supporter and volunteer');
INSERT INTO "ConstituentRole" VALUES('ConstituentRole-3','Contact-3','Philanthropic Prospect','Active','2024-01-05',NULL,'Young professional emerging leader');
INSERT INTO "ConstituentRole" VALUES('ConstituentRole-4','Contact-4','Donor','Active','1985-05-22',NULL,'Multi-generational family supporter');

--------------------------------------------------------------------------------
-- PartyPhilanthropicRsrchPrfl
--------------------------------------------------------------------------------

CREATE TABLE "PartyPhilanthropicRsrchPrfl" (
    id VARCHAR(255) NOT NULL,
    "AccountId" VARCHAR(255),
    "ResearchProfileType" VARCHAR(255),
    "ResearchProfilePhase" VARCHAR(255),
    "StartDate" VARCHAR(255),
    "EndDate" VARCHAR(255),
    "DetailedSummary" VARCHAR(5000),
    "ShortSummary" VARCHAR(5000),
    PRIMARY KEY (id)
);

INSERT INTO "PartyPhilanthropicRsrchPrfl" VALUES('Research-1','Account-1','Capital Campaign','Rating and Segmentation','2024-01-15',NULL,'Co-founder of two successful tech startups (acquired for $85M and $120M). Currently serves on boards of three tech companies and two nonprofits. Significant stock holdings in publicly traded tech firms. Known for supporting STEM education and women in technology initiatives.','Tech executive, net worth $105M+, estimated capacity $3.5M for STEM education');
INSERT INTO "PartyPhilanthropicRsrchPrfl" VALUES('Research-2','Account-2','Planned Giving','Qualification','2024-03-10',NULL,'Retired CEO of regional healthcare system. Previous major gifts: $2.5M for hospital wing (2018), $500K for medical scholarship endowment (2020). Strong interest in medical education and research. Estate planning conversations indicate significant planned gift.','Healthcare philanthropist, net worth $48M+, planned giving prospect $5M+');
INSERT INTO "PartyPhilanthropicRsrchPrfl" VALUES('Research-3','Account-3','Capital Campaign','Initial Screening','2024-07-20',NULL,'Rising star in investment banking. Recent promotion to Managing Director at age 35. Active in young alumni networks. Increased giving pattern over past 3 years (40% YoY growth). Strong mentor to other young professionals.','Young professional, net worth $4.2M, emerging leader capacity $125-150K');
INSERT INTO "PartyPhilanthropicRsrchPrfl" VALUES('Research-4','Account-4','Capital Campaign','Rating and Segmentation','2024-02-15',NULL,'Multi-generational family wealth from manufacturing business (sold 2005). Three generations of university support dating to 1949. Family foundation established 1995, assets ~$15M. Current discussions around significant estate gift and endowed chair in Arts.','Legacy donor, net worth $125M+, endowed chair prospect $3M');

--------------------------------------------------------------------------------
-- Case
--------------------------------------------------------------------------------

CREATE TABLE "Case" (
    id VARCHAR(255) NOT NULL,
    "AccountId" VARCHAR(255),
    "Subject" VARCHAR(255),
    "Description" VARCHAR(5000),
    "Status" VARCHAR(255),
    "Priority" VARCHAR(255),
    "Origin" VARCHAR(255),
    "Type" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "Case" VALUES('Case-1','Account-1','Major Gift Cultivation - $3.5M','Multi-year cultivation plan focusing on STEM education initiatives and women in technology programs. Target ask: $3.5M for new Computer Science building naming opportunity.','In Progress','High','Prospect Research','Major Gift');
INSERT INTO "Case" VALUES('Case-2','Account-2','Estate Planning Discussion','Active estate planning conversations. Discussing $5M+ bequest to support medical research and education programs.','In Progress','High','Professional Advisor Referral','Planned Gift');
INSERT INTO "Case" VALUES('Case-3','Account-3','Young Professional Leadership','Strategic cultivation as emerging leader. Focus on young alumni engagement. Current capacity $100-150K range with strong growth trajectory.','In Progress','Medium','Alumni Engagement','Leadership Development');
INSERT INTO "Case" VALUES('Case-4','Account-4','Whitfield Endowed Chair','Working on $3M endowed chair in Arts. Whitfield Family Foundation may contribute $1M with personal gift of $2M.','In Progress','High','Campaign Initiative','Major Gift');

--------------------------------------------------------------------------------
-- PartyPhilanthropicAssessment
--------------------------------------------------------------------------------

CREATE TABLE "PartyPhilanthropicAssessment" (
    id VARCHAR(255) NOT NULL,
    "AccountId" VARCHAR(255),
    "Date" VARCHAR(255),
    "OverallRating" VARCHAR(255),
    "AssessmentType" VARCHAR(255),
    "StrengthsAndOpportunities" VARCHAR(5000),
    "ShortSummary" VARCHAR(5000),
    "WealthAmount" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "PartyPhilanthropicAssessment" VALUES('Assessment-1','Account-1','2024-10-15','High','Executive Summary','Exceptional prospect readiness. Strong capacity ($3.5M+ verified), high affinity (board service, consistent engagement), clear urgency. STEM focus aligns perfectly with Computer Science building campaign.','Ready for solicitation Q1 2025. Rating: A+ (Score 9.2/10). Recommend President-led proposal presentation.','105500000');
INSERT INTO "PartyPhilanthropicAssessment" VALUES('Assessment-2','Account-2','2024-09-20','High','Executive Summary','Highly qualified planned giving prospect. Estate value $52M+ with clear charitable intent. Medical education focus well-documented through $3M in previous gifts.','Continue estate planning conversations. Rating: A (Score 8.7/10). Target formal $5M+ commitment mid-2025.','48500000');
INSERT INTO "PartyPhilanthropicAssessment" VALUES('Assessment-3','Account-3','2024-11-01','Medium','Donor Brief','Strong emerging leader with high capacity trajectory. Current capacity $125-150K confirmed. Career advancement rapid (MD at 35). Engagement pattern positive with 40% YoY giving increase.','Engage in Young Professional Council. Rating: B+ (Score 7.8/10). Create multi-year pledge opportunity.','4200000');
INSERT INTO "PartyPhilanthropicAssessment" VALUES('Assessment-4','Account-4','2024-08-15','High','Executive Summary','Exceptional campaign prospect with multi-generational relationship strength spanning 75 years. Whitfield Family Foundation positioned to contribute $1M. Personal capacity for $2M+ confirmed.','Move to formal proposal phase immediately. Rating: A+ (Score 9.5/10). Target formal ask before year-end 2024.','125000000');

--------------------------------------------------------------------------------
-- PartyPhilanthropicIndicator
--------------------------------------------------------------------------------

CREATE TABLE "PartyPhilanthropicIndicator" (
    id VARCHAR(255) NOT NULL,
    "AccountId" VARCHAR(255),
    "IndicatorType" VARCHAR(255),
    "Indicator" VARCHAR(255),
    "EstimatedValue" VARCHAR(255),
    "Summary" VARCHAR(5000),
    PRIMARY KEY (id)
);

INSERT INTO "PartyPhilanthropicIndicator" VALUES('Indicator-1','Account-1','Wealth','Net Worth','85000000','First tech startup acquisition for $85M (2019). Personal proceeds estimated $35M.');
INSERT INTO "PartyPhilanthropicIndicator" VALUES('Indicator-2','Account-1','Wealth','Net Worth','120000000','Second tech startup acquisition for $120M (2022). Personal proceeds estimated $48M.');
INSERT INTO "PartyPhilanthropicIndicator" VALUES('Indicator-3','Account-2','Wealth','Inheritance','15000000','Healthcare CEO retirement package including deferred compensation and stock options.');
INSERT INTO "PartyPhilanthropicIndicator" VALUES('Indicator-4','Account-2','Philanthropy','Donation History','2500000','Morrison Medical Wing naming gift (2018) demonstrates major gift capacity.');
INSERT INTO "PartyPhilanthropicIndicator" VALUES('Indicator-5','Account-3','Engagement','Volunteer Hours',NULL,'Promoted to Managing Director at age 35 (2024). Signals strong career trajectory.');
INSERT INTO "PartyPhilanthropicIndicator" VALUES('Indicator-6','Account-4','Wealth','Inheritance','15000000','Whitfield Family Foundation assets $15M with $750K annual grant-making.');

--------------------------------------------------------------------------------
-- PartyPhilanthropicOccurrence
--------------------------------------------------------------------------------

CREATE TABLE "PartyPhilanthropicOccurrence" (
    id VARCHAR(255) NOT NULL,
    "AccountId" VARCHAR(255),
    "ResearchType" VARCHAR(255),
    "OccurrenceType" VARCHAR(255),
    "EstimatedValue" VARCHAR(255),
    "Summary" VARCHAR(5000),
    PRIMARY KEY (id)
);

INSERT INTO "PartyPhilanthropicOccurrence" VALUES('Occurrence-1','Account-1','Philanthropy','Donation History','500000','Women in Technology Scholarship Fund (2023) - $500K scholarship fund supporting computer science degrees.');
INSERT INTO "PartyPhilanthropicOccurrence" VALUES('Occurrence-2','Account-1','Philanthropy','Donation History','50000','Annual Fund Support (2024) - $50K annual contribution. Consistent 5-year pattern.');
INSERT INTO "PartyPhilanthropicOccurrence" VALUES('Occurrence-3','Account-2','Philanthropy','Donation History','2500000','Morrison Medical Wing (2018) - Named capital gift for new medical wing.');
INSERT INTO "PartyPhilanthropicOccurrence" VALUES('Occurrence-4','Account-2','Philanthropy','Donation History','500000','Medical Scholarship Endowment (2020) - Supporting medical students from underserved communities.');
INSERT INTO "PartyPhilanthropicOccurrence" VALUES('Occurrence-5','Account-3','Philanthropy','Donation History','25000','Reunion Gift (2024) - $25K leadership gift at 10-year reunion.');
INSERT INTO "PartyPhilanthropicOccurrence" VALUES('Occurrence-6','Account-4','Philanthropy','Donation History','1000000','Whitfield Arts Endowment (2010) - $1M endowment supporting Arts department.');
INSERT INTO "PartyPhilanthropicOccurrence" VALUES('Occurrence-7','Account-4','Philanthropy','Donation History','100000','Annual Leadership Gift (2024) - $100K consistent annual gift. 25+ years of support.');

--------------------------------------------------------------------------------
-- PartyPhilanthropicMilestone
--------------------------------------------------------------------------------

CREATE TABLE "PartyPhilanthropicMilestone" (
    id VARCHAR(255) NOT NULL,
    "AccountId" VARCHAR(255),
    "OverallRating" VARCHAR(255),
    "ShortSummary" VARCHAR(5000),
    "WealthAmount" VARCHAR(255),
    "Income" VARCHAR(255),
    "RealEstateValue" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "PartyPhilanthropicMilestone" VALUES('Milestone-1','Account-1','High','Tech executive net worth assessment based on two successful startup exits. Primary wealth: startup equity, stock holdings, real estate, angel investments.','105500000','3500000','12000000');
INSERT INTO "PartyPhilanthropicMilestone" VALUES('Milestone-2','Account-2','High','Healthcare executive retirement wealth from 25-year CEO tenure. Primary wealth: retirement package, board seats, real estate, investments.','48500000','850000','8500000');
INSERT INTO "PartyPhilanthropicMilestone" VALUES('Milestone-3','Account-3','Medium','Young professional emerging wealth from investment banking. Managing Director at 35 represents accelerated trajectory.','4200000','875000','');
INSERT INTO "PartyPhilanthropicMilestone" VALUES('Milestone-4','Account-4','High','Multi-generational family wealth from manufacturing business sale (2005). Family foundation assets $15M generating $750K annual grants.','125000000','1200000','45000000');

--------------------------------------------------------------------------------
-- InteractionSummary
--------------------------------------------------------------------------------

CREATE TABLE "InteractionSummary" (
    id VARCHAR(255) NOT NULL,
    "AccountId" VARCHAR(255),
    "Name" VARCHAR(255),
    "ConfidentialityType" VARCHAR(255),
    "InteractionPurpose" VARCHAR(255),
    "Status" VARCHAR(255),
    "MeetingNotes" VARCHAR(5000),
    "NextSteps" VARCHAR(5000),
    PRIMARY KEY (id)
);

INSERT INTO "InteractionSummary" VALUES('Interaction-1','Account-1','Chen Campaign Strategy Meeting','Confidential','Deal Execution','Published','Excellent meeting at Pacific Heights home. Discussed Computer Science building campaign and STEM education impact. Both enthusiastic about naming opportunity. Stock vesting in Q1 2025 noted as potential timing.','Follow up with architect renderings. Schedule student panel. Prepare draft proposal for January.');
INSERT INTO "InteractionSummary" VALUES('Interaction-2','Account-2','Morrison Estate Planning Discussion','Confidential','Deal Execution','Published','Substantive estate planning conversation at Beacon Hill home. Discussed healthcare philanthropy legacy. Both interested in endowment support for medical education scholarships. Very positive tone.','Send draft bequest language options. Prepare medical scholarship proposal. Invite to legacy society event in December.');
INSERT INTO "InteractionSummary" VALUES('Interaction-3','Account-3','Young Professional Council Planning','Public','Meet and Greet','Published','Strategic planning session. Priya actively participated and volunteered to lead mentorship subcommittee. Clear leadership qualities. Mentioned recent promotion and desire to increase involvement.','Schedule 1-1 meeting to discuss multi-year pledge. Prepare young leader giving proposal. Invite to cultivation event.');
INSERT INTO "InteractionSummary" VALUES('Interaction-4','Account-4','Whitfield Arts Strategy Meeting','Confidential','Deal Execution','Published','Exceptional meeting at Greenwich estate. Margaret deeply moved by concept of endowing chair in late mother''s memory. Foundation board approved $1M. Personal commitment to add $2M. Timeline: year-end.','Prepare formal chair proposal with naming recognition. Draft gift agreement. Target solicitation meeting in November.');

--------------------------------------------------------------------------------
-- BusinessMilestone
--------------------------------------------------------------------------------

CREATE TABLE "BusinessMilestone" (
    id VARCHAR(255) NOT NULL,
    "PrimaryAccountId" VARCHAR(255),
    "Name" VARCHAR(255),
    "MilestoneDate" VARCHAR(255),
    "IsTentative" VARCHAR(255),
    "MilestoneType" VARCHAR(255),
    "MilestoneDescription" VARCHAR(5000),
    PRIMARY KEY (id)
);

INSERT INTO "BusinessMilestone" VALUES('BizMilestone-1','Account-1','Tech Startup A Acquisition','2019-06-15T00:00:00','false','Merger & Acquisition','Elizabeth Chen''s first tech startup acquired for $85M. Personal proceeds estimated $35M creating significant liquidity event.');
INSERT INTO "BusinessMilestone" VALUES('BizMilestone-2','Account-1','Tech Startup B Acquisition','2022-03-20T00:00:00','false','Merger & Acquisition','Second startup acquisition for $120M with personal proceeds estimated $48M. Establishes pattern of successful entrepreneurship.');
INSERT INTO "BusinessMilestone" VALUES('BizMilestone-3','Account-1','TechCorp Board Appointment','2023-01-10T00:00:00','false','New Partnership','Appointed to board of directors at Fortune 500 technology company. $250K+ annual compensation.');

--------------------------------------------------------------------------------
-- PersonLifeEvent
--------------------------------------------------------------------------------

CREATE TABLE "PersonLifeEvent" (
    id VARCHAR(255) NOT NULL,
    "PrimaryPersonId" VARCHAR(255),
    "RelatedPersonId" VARCHAR(255),
    "Name" VARCHAR(255),
    "EventDate" VARCHAR(255),
    "EventDescription" VARCHAR(5000),
    "IsTentative" VARCHAR(255),
    "EventType" VARCHAR(255),
    "EventLocationCity" VARCHAR(255),
    "EventLocationState" VARCHAR(255),
    "EventLocationCountry" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "PersonLifeEvent" VALUES('LifeEvent-1','Contact-1','','Elizabeth Chen University Graduation','1997-06-15T00:00:00','Graduated with computer science degree. Foundation for successful tech career.','false','Graduation','Stanford','California','United States');
INSERT INTO "PersonLifeEvent" VALUES('LifeEvent-2','Contact-2','','Robert Morrison Retirement','2020-12-31T00:00:00','Retired as CEO of regional healthcare system after 25-year career. Beginning retirement phase with estate planning focus.','false','Job','Boston','Massachusetts','United States');
INSERT INTO "PersonLifeEvent" VALUES('LifeEvent-3','Contact-3','','Priya Patel Managing Director Promotion','2024-06-01T00:00:00','Promoted to Managing Director at investment bank at age 35. Significant career milestone.','false','Job','Chicago','Illinois','United States');

COMMIT;