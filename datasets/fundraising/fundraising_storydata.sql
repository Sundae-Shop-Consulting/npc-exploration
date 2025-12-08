BEGIN TRANSACTION;

-- =========================================================
-- Accounts (Donors - mix of Person Accounts and Organizations)
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

-- =========================================================
-- Organization Accounts (Foundations, Corporations, Board Member Companies)
-- =========================================================

-- Major Foundations
INSERT INTO "Account" VALUES('Account-Org-1','','','Smith Family Foundation','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-Org-2','','','Johnson Charitable Trust','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-Org-3','','','Williams Community Fund','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-Org-4','','','Davis Foundation for Children','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-Org-5','','','Martinez Education Fund','False','False','False','RT-BUSINESS',NULL);

-- Corporate Sponsors
INSERT INTO "Account" VALUES('Account-Org-6','','','TechCorp Global','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-Org-7','','','Pacific Bank & Trust','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-Org-8','','','Anderson Manufacturing','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-Org-9','','','Summit Healthcare Systems','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-Org-10','','','Rivera & Associates Law Firm','False','False','False','RT-BUSINESS',NULL);

-- Board Member Companies (smaller businesses)
INSERT INTO "Account" VALUES('Account-Org-11','','','Green Valley Real Estate','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-Org-12','','','Sunset Consulting Group','False','False','False','RT-BUSINESS',NULL);
INSERT INTO "Account" VALUES('Account-Org-13','','','Mountain View Architecture','False','False','False','RT-BUSINESS',NULL);

-- =========================================================
-- Person Accounts - Major Donors (10)
-- =========================================================

INSERT INTO "Account" VALUES('Account-1','Elizabeth','Thompson','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-2','Michael','Rodriguez','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-3','Jennifer','Chen','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-4','Robert','Washington','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-5','Patricia','Anderson','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-6','James','Martinez','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-7','Linda','Taylor','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-8','David','Lee','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-9','Barbara','Garcia','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-10','Richard','Wilson','','False','False','False','RT-PERSON',NULL);

-- =========================================================
-- Person Accounts - Board Members (8)
-- =========================================================

INSERT INTO "Account" VALUES('Account-11','Sarah','Mitchell','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-12','Thomas','Brown','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-13','Margaret','Davis','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-14','Christopher','Miller','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-15','Nancy','Moore','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-16','Daniel','Jackson','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-17','Lisa','White','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-18','Paul','Harris','','False','False','False','RT-PERSON',NULL);

-- =========================================================
-- Person Accounts - Monthly Recurring Donors (25)
-- =========================================================

INSERT INTO "Account" VALUES('Account-19','Amy','Clark','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-20','Steven','Lewis','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-21','Emily','Walker','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-22','Kevin','Hall','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-23','Michelle','Allen','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-24','Brian','Young','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-25','Jessica','King','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-26','Jason','Wright','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-27','Amanda','Lopez','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-28','Ryan','Hill','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-29','Ashley','Scott','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-30','Justin','Green','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-31','Stephanie','Adams','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-32','Brandon','Baker','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-33','Nicole','Nelson','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-34','Andrew','Carter','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-35','Rachel','Mitchell','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-36','Tyler','Perez','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-37','Lauren','Roberts','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-38','Jordan','Turner','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-39','Megan','Phillips','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-40','Eric','Campbell','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-41','Rebecca','Parker','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-42','Nathan','Evans','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-43','Samantha','Edwards','','False','False','False','RT-PERSON',NULL);

-- =========================================================
-- Person Accounts - Regular Annual Donors (30)
-- =========================================================

INSERT INTO "Account" VALUES('Account-44','Gregory','Collins','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-45','Angela','Stewart','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-46','Kenneth','Sanchez','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-47','Melissa','Morris','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-48','Timothy','Rogers','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-49','Deborah','Reed','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-50','Ronald','Cook','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-51','Cynthia','Morgan','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-52','George','Bell','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-53','Donna','Murphy','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-54','Jeffrey','Bailey','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-55','Carol','Rivera','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-56','Scott','Cooper','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-57','Sharon','Richardson','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-58','Larry','Cox','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-59','Sandra','Howard','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-60','Dennis','Ward','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-61','Kimberly','Torres','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-62','Frank','Peterson','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-63','Helen','Gray','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-64','Raymond','Ramirez','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-65','Diane','James','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-66','Jerry','Watson','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-67','Katherine','Brooks','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-68','Walter','Kelly','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-69','Teresa','Sanders','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-70','Harold','Price','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-71','Christine','Bennett','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-72','Henry','Wood','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-73','Julie','Barnes','','False','False','False','RT-PERSON',NULL);

-- =========================================================
-- Person Accounts - Sporadic/One-time Donors (29 - includes Susan Chen & Margaret Smith)
-- =========================================================

INSERT INTO "Account" VALUES('Account-74','Carl','Ross','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-75','Anna','Henderson','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-76','Arthur','Coleman','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-103','Michael','Roberts','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-104','Patricia','Davis','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-105','Christopher','Wilson','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-106','Elizabeth','Taylor','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-107','Daniel','Martinez','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-108','Michelle','Anderson','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-77','Frances','Jenkins','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-78','Douglas','Perry','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-79','Marie','Powell','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-80','Roger','Long','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-81','Joyce','Patterson','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-82','Peter','Hughes','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-83','Evelyn','Flores','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-84','Albert','Washington','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-85','Ruby','Butler','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-86','Roy','Simmons','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-87','Phyllis','Foster','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-88','Eugene','Gonzales','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-89','Gloria','Bryant','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-90','Ralph','Alexander','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-91','Norma','Russell','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-92','Philip','Griffin','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-93','Irene','Diaz','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-94','Billy','Hayes','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-95','Janice','Myers','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-96','Jack','Ford','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-97','Kathryn','Hamilton','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-98','Howard','Graham','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-99','Virginia','Sullivan','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-100','Russell','Wallace','','False','False','False','RT-PERSON',NULL);

-- Employee donor (for matching gift scenario)
INSERT INTO "Account" VALUES('Account-101','Susan','Chen','','False','False','False','RT-PERSON',NULL);

-- Foundation contact (for soft credit scenario)
INSERT INTO "Account" VALUES('Account-102','Margaret','Smith','','False','False','False','RT-PERSON',NULL);

-- =========================================================
-- Contacts (for business account relationships and soft credits)
-- =========================================================

CREATE TABLE "Contact" (
    id VARCHAR(255) NOT NULL,
    "CanAllowPortalSelfReg" VARCHAR(255),
    "DoNotCall" VARCHAR(255),
    "FirstName" VARCHAR(255),
    "HasOptedOutOfEmail" VARCHAR(255),
    "HasOptedOutOfFax" VARCHAR(255),
    "LastName" VARCHAR(255),
    "AccountId" VARCHAR(255),
    "ReportsToId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Foundation contacts
INSERT INTO "Contact" VALUES('Contact-1','False','False','Margaret','False','False','Smith','Account-Org-1',NULL);
INSERT INTO "Contact" VALUES('Contact-2','False','False','William','False','False','Johnson','Account-Org-2',NULL);
INSERT INTO "Contact" VALUES('Contact-3','False','False','Eleanor','False','False','Williams','Account-Org-3',NULL);

-- Corporate contacts
INSERT INTO "Contact" VALUES('Contact-4','False','False','Susan','False','False','Chen','Account-Org-6',NULL);
INSERT INTO "Contact" VALUES('Contact-5','False','False','Michael','False','False','Patel','Account-Org-7',NULL);
INSERT INTO "Contact" VALUES('Contact-6','False','False','Jennifer','False','False','Anderson','Account-Org-8',NULL);

-- =========================================================
-- AccountContactRelation (connecting board members to their companies)
-- =========================================================

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

-- Board members connected to their companies
INSERT INTO "AccountContactRelation" VALUES('ACR-1','True','False','False','True','Account-Org-11','Contact-1');
INSERT INTO "AccountContactRelation" VALUES('ACR-2','True','False','False','True','Account-Org-12','Contact-2');
INSERT INTO "AccountContactRelation" VALUES('ACR-3','True','False','False','True','Account-Org-13','Contact-3');

-- =========================================================
-- Campaigns
-- =========================================================

CREATE TABLE "Campaign" (
    id VARCHAR(255) NOT NULL,
    "Description" VARCHAR(255),
    "EndDate" VARCHAR(255),
    "ExpectedRevenue" INTEGER,
    "IsActive" VARCHAR(255),
    "Name" VARCHAR(255),
    "StartDate" VARCHAR(255),
    "Status" VARCHAR(255),
    "Type" VARCHAR(255),
    "ParentId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Annual Gala (major event)
INSERT INTO "Campaign" VALUES('Campaign-1','Annual fundraising gala with silent auction and dinner','2024-11-15',250000,'False','2024 Annual Gala','2024-09-01','Completed','Event',NULL);

-- Year-End Appeal
INSERT INTO "Campaign" VALUES('Campaign-2','Direct mail and email year-end giving campaign','2024-12-31',150000,'False','2024 Year-End Appeal','2024-11-15','Completed','Direct Mail',NULL);

-- Spring Email Campaign
INSERT INTO "Campaign" VALUES('Campaign-3','Spring email fundraising drive for program expansion','2025-05-31',75000,'True','2025 Spring Campaign','2025-03-01','In Progress','Email',NULL);

-- Monthly Giving Program
INSERT INTO "Campaign" VALUES('Campaign-4','Ongoing monthly giving sustainer program','2025-12-31',180000,'True','Sustainer Circle','2024-01-01','In Progress','Other',NULL);

-- Major Gifts Initiative
INSERT INTO "Campaign" VALUES('Campaign-5','Cultivation and solicitation of major gifts $10K+','2025-06-30',500000,'True','Major Gifts Initiative 2025','2024-07-01','In Progress','Other',NULL);

-- Corporate Sponsorship
INSERT INTO "Campaign" VALUES('Campaign-6','Corporate partnership and sponsorship program','2025-12-31',200000,'True','Corporate Partners Program','2025-01-01','In Progress','Other',NULL);

-- Memorial Giving
INSERT INTO "Campaign" VALUES('Campaign-7','In memory and tribute giving program','2025-12-31',50000,'True','Memorial & Tribute Gifts','2024-01-01','In Progress','Other',NULL);

-- =========================================================
-- OutreachSourceCode
-- =========================================================

CREATE TABLE "OutreachSourceCode" (
    id VARCHAR(255) NOT NULL,
    "Name" VARCHAR(255),
    "SourceCode" VARCHAR(255),
    "CampaignId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "OutreachSourceCode" VALUES('OSC-1','Gala Email Invitation','GALA2024-EMAIL','Campaign-1');
INSERT INTO "OutreachSourceCode" VALUES('OSC-2','Gala Direct Mail','GALA2024-DM','Campaign-1');
INSERT INTO "OutreachSourceCode" VALUES('OSC-3','Year-End Email','YE2024-EMAIL','Campaign-2');
INSERT INTO "OutreachSourceCode" VALUES('OSC-4','Year-End Letter','YE2024-DM','Campaign-2');
INSERT INTO "OutreachSourceCode" VALUES('OSC-5','Spring Email 1','SPRING2025-EM1','Campaign-3');
INSERT INTO "OutreachSourceCode" VALUES('OSC-6','Monthly Giving Web Form','SUSTAIN-WEB','Campaign-4');
INSERT INTO "OutreachSourceCode" VALUES('OSC-7','Major Gift Phone Outreach','MAJGIFT-PHONE','Campaign-5');

-- =========================================================
-- PaymentInstrument
-- =========================================================

CREATE TABLE "PaymentInstrument" (
    id VARCHAR(255) NOT NULL,
    "AccountId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Recurring donors' payment methods
INSERT INTO "PaymentInstrument" VALUES('PI-1','Account-19');
INSERT INTO "PaymentInstrument" VALUES('PI-2','Account-20');
INSERT INTO "PaymentInstrument" VALUES('PI-3','Account-21');
INSERT INTO "PaymentInstrument" VALUES('PI-4','Account-22');
INSERT INTO "PaymentInstrument" VALUES('PI-5','Account-23');

-- Major donors
INSERT INTO "PaymentInstrument" VALUES('PI-6','Account-1');
INSERT INTO "PaymentInstrument" VALUES('PI-7','Account-2');

-- =========================================================
-- GiftBatch (for processing gift entries)
-- =========================================================

CREATE TABLE "GiftBatch" (
    id VARCHAR(255) NOT NULL,
    "DoesTotalGiftValueMatch" VARCHAR(255),
    "EstimatedGiftCount" INTEGER,
    "ExpectedValueofGiftsinBatch" VARCHAR(255),
    "ScreenTemplateName" VARCHAR(255),
    "Status" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Open batch from Spring Gala event - awaiting processing
INSERT INTO "GiftBatch" VALUES('GB-1','False',6,'8500','Standard','Unprocessed');

-- =========================================================
-- GiftDesignation (funds/programs donors can designate to)
-- =========================================================

CREATE TABLE "GiftDesignation" (
    id VARCHAR(255) NOT NULL,
    "Description" VARCHAR(255),
    "IsActive" VARCHAR(255),
    "IsDefault" VARCHAR(255),
    "Name" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "GiftDesignation" VALUES('GD-1','General operating support for all programs','True','False','General Fund');
INSERT INTO "GiftDesignation" VALUES('GD-2','Youth education and mentoring programs','True','False','Youth Education Fund');
INSERT INTO "GiftDesignation" VALUES('GD-3','Emergency assistance for families in crisis','True','False','Emergency Relief Fund');
INSERT INTO "GiftDesignation" VALUES('GD-4','Building renovation and capital improvements','True','False','Capital Campaign');
INSERT INTO "GiftDesignation" VALUES('GD-5','Scholarship fund for program participants','True','False','Scholarship Fund');

-- =========================================================
-- Opportunity (major gift pipeline)
-- =========================================================

CREATE TABLE "Opportunity" (
    id VARCHAR(255) NOT NULL,
    "Amount" VARCHAR(255),
    "CloseDate" VARCHAR(255),
    "Description" VARCHAR(255),
    "IsPrivate" VARCHAR(255),
    "Name" VARCHAR(255),
    "Probability" INTEGER,
    "StageName" VARCHAR(255),
    "Type" VARCHAR(255),
    "AccountId" VARCHAR(255),
    "CampaignId" VARCHAR(255),
    "ContactId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Major donor opportunities
INSERT INTO "Opportunity" VALUES('Opp-1',50000.00,'2024-11-15','Capital campaign lead gift from long-time supporter','False','Thompson - Capital Gift',100,'Closed Won','Major Gift','Account-1','Campaign-1',NULL);
INSERT INTO "Opportunity" VALUES('Opp-2',25000.00,'2025-04-30','Multi-year pledge for youth programs','False','Rodriguez - Youth Programs Pledge',75,'Negotiation/Review','Major Gift','Account-2','Campaign-5',NULL);
INSERT INTO "Opportunity" VALUES('Opp-3',100000.00,'2025-06-30','Foundation grant proposal for emergency relief','False','Smith Foundation - Emergency Relief Grant',60,'Proposal/Price Quote','Grant','Account-Org-1','Campaign-5','Contact-1');
INSERT INTO "Opportunity" VALUES('Opp-4',30000.00,'2024-12-31','Year-end major gift solicitation','False','Chen - Year End Major Gift',100,'Closed Won','Major Gift','Account-3','Campaign-2',NULL);

-- Corporate sponsorships
INSERT INTO "Opportunity" VALUES('Opp-5',15000.00,'2025-11-01','Annual gala sponsorship - platinum level','False','TechCorp - Gala Sponsorship',90,'Verbal Commitment','Sponsorship','Account-Org-6','Campaign-6','Contact-4');
INSERT INTO "Opportunity" VALUES('Opp-6',10000.00,'2025-12-31','Corporate matching gift program setup','False','Pacific Bank - Matching Gifts',50,'Qualification','Corporate Partnership','Account-Org-7','Campaign-6','Contact-5');

-- =========================================================
-- GiftCommitment (pledges, recurring donations, planned gifts)
-- Record Types: handled via RT- prefix placeholders
-- =========================================================

CREATE TABLE "GiftCommitment" (
    id VARCHAR(255) NOT NULL,
    "Description" VARCHAR(255),
    "ExpectedEndDate" VARCHAR(255),
    "IsAssetTransferExpected" VARCHAR(255),
    "Name" VARCHAR(255),
    "ScheduleType" VARCHAR(255),
    "Status" VARCHAR(255),
    "CampaignId" VARCHAR(255),
    "DonorId" VARCHAR(255),
    "OpportunityId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Major donor pledges
INSERT INTO "GiftCommitment" VALUES('GC-1','Capital campaign pledge - 5 year commitment','2029-11-15','False','Thompson Capital Pledge','Recurring','Active','Campaign-1','Account-1','Opp-1');
INSERT INTO "GiftCommitment" VALUES('GC-2','Youth programs pledge - quarterly payments','2027-12-31','False','Rodriguez Youth Pledge','Custom','Active','Campaign-5','Account-2','Opp-2');
INSERT INTO "GiftCommitment" VALUES('GC-3','Year-end major gift pledge','2025-12-31','False','Chen Major Gift Pledge','Recurring','Active','Campaign-2','Account-3','Opp-4');

-- Monthly recurring donations
INSERT INTO "GiftCommitment" VALUES('GC-4','Monthly sustainer - general fund','2025-12-31','False','Amy Clark Monthly Giving','Recurring','Active','Campaign-4','Account-19',NULL);
INSERT INTO "GiftCommitment" VALUES('GC-5','Monthly sustainer - youth programs','2025-12-31','False','Steven Lewis Monthly Giving','Recurring','Active','Campaign-4','Account-20',NULL);
INSERT INTO "GiftCommitment" VALUES('GC-6','Monthly sustainer - general fund','2025-12-31','False','Emily Walker Monthly Giving','Recurring','Active','Campaign-4','Account-21',NULL);
INSERT INTO "GiftCommitment" VALUES('GC-7','Monthly sustainer - emergency fund','2025-12-31','False','Kevin Hall Monthly Giving','Recurring','Active','Campaign-4','Account-22',NULL);
INSERT INTO "GiftCommitment" VALUES('GC-8','Monthly sustainer - general fund','2025-12-31','False','Michelle Allen Monthly Giving','Recurring','Active','Campaign-4','Account-23',NULL);

-- Foundation grant
INSERT INTO "GiftCommitment" VALUES('GC-9','Multi-year grant for emergency relief programs - 3 years','2027-12-31','False','Smith Foundation Emergency Relief Grant','Recurring','Active','Campaign-5','Account-Org-1','Opp-3');

-- Planned gift
INSERT INTO "GiftCommitment" VALUES('GC-10','Bequest intention documented in will','2050-12-31','True','Wilson Bequest Intention','Custom','Acknowledged',NULL,'Account-10',NULL);

-- =========================================================
-- GiftCommitmentSchedule
-- =========================================================

CREATE TABLE "GiftCommitmentSchedule" (
    id VARCHAR(255) NOT NULL,
    "EndDate" VARCHAR(255),
    "StartDate" VARCHAR(255),
    "TransactionAmount" VARCHAR(255),
    "TransactionPeriod" VARCHAR(255),
    "Type" VARCHAR(255),
    "CampaignId" VARCHAR(255),
    "GiftCommitmentId" VARCHAR(255),
    "GiftCommitmentSchdBefEditId" VARCHAR(255),
    "OutreachSourceCodeId" VARCHAR(255),
    "PaymentInstrumentId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Thompson pledge schedule (annual payments)
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-1','2029-11-15','2024-11-15',10000.00,'Yearly','CreateTransactions','Campaign-1','GC-1',NULL,NULL,NULL);

-- Rodriguez pledge schedule (quarterly payments)
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-2','2027-12-31','2025-01-10',2083.33,'Custom','CreateTransactions','Campaign-5','GC-2',NULL,NULL,NULL);

-- Monthly recurring schedules
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-3','2025-12-31','2024-01-05',100.00,'Monthly','CreateTransactions','Campaign-4','GC-4',NULL,'OSC-6','PI-1');
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-4','2025-12-31','2024-02-10',50.00,'Monthly','CreateTransactions','Campaign-4','GC-5',NULL,'OSC-6','PI-2');
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-5','2025-12-31','2024-03-01',25.00,'Monthly','CreateTransactions','Campaign-4','GC-6',NULL,'OSC-6','PI-3');
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-6','2025-12-31','2024-01-15',125.00,'Monthly','CreateTransactions','Campaign-4','GC-7',NULL,'OSC-6','PI-4');
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-7','2025-12-31','2024-04-01',41.67,'Monthly','CreateTransactions','Campaign-4','GC-8',NULL,'OSC-6','PI-5');

-- Grant schedule (annual installments)
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-8','2027-12-31','2025-01-15',33333.33,'Yearly','CreateTransactions',NULL,'GC-9',NULL,NULL,NULL);

-- =========================================================
-- GiftDefaultDesignation (default allocations for commitments/campaigns)
-- =========================================================

CREATE TABLE "GiftDefaultDesignation" (
    id VARCHAR(255) NOT NULL,
    "AllocatedPercentage" VARCHAR(255),
    "GiftDesignationId" VARCHAR(255),
    "ParentRecordId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Campaign default designations
INSERT INTO "GiftDefaultDesignation" VALUES('GDD-1',100.00,'GD-4','Campaign-1'); -- Gala -> Capital Campaign
INSERT INTO "GiftDefaultDesignation" VALUES('GDD-2',100.00,'GD-1','Campaign-2'); -- Year-End -> General Fund
INSERT INTO "GiftDefaultDesignation" VALUES('GDD-3',100.00,'GD-1','Campaign-4'); -- Monthly Giving -> General Fund

-- Gift Commitment default designations
INSERT INTO "GiftDefaultDesignation" VALUES('GDD-4',100.00,'GD-2','GC-2'); -- Rodriguez pledge -> Youth Programs
INSERT INTO "GiftDefaultDesignation" VALUES('GDD-5',100.00,'GD-3','GC-7'); -- Kevin Hall monthly -> Emergency Fund
INSERT INTO "GiftDefaultDesignation" VALUES('GDD-6',100.00,'GD-3','GC-9'); -- Smith Foundation grant -> Emergency Relief

-- =========================================================
-- GiftCmtChangeAttrLog (tracking changes to commitments)
-- =========================================================

CREATE TABLE "GiftCmtChangeAttrLog" (
    id VARCHAR(255) NOT NULL,
    "ChangePerDayAmount" VARCHAR(255),
    "ChangeStatus" VARCHAR(255),
    "ChangeType" VARCHAR(255),
    "EffectiveDate" VARCHAR(255),
    "CampaignId" VARCHAR(255),
    "GiftCommitmentId" VARCHAR(255),
    "GiftCommitmentScheduleId" VARCHAR(255),
    "OutreachSourceCodeId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Amy increased her monthly gift
INSERT INTO "GiftCmtChangeAttrLog" VALUES('GCAL-1',25.00,'Upgrade','Amount','2024-06-01',NULL,'GC-4','GCS-3',NULL);

-- Kevin's payment method changed
INSERT INTO "GiftCmtChangeAttrLog" VALUES('GCAL-2',0.00,'Neutral','Amount','2024-08-15',NULL,'GC-7','GCS-6',NULL);

-- =========================================================
-- GiftTransaction (actual donation transactions)
-- =========================================================

CREATE TABLE "GiftTransaction" (
    id VARCHAR(255) NOT NULL,
    "Description" VARCHAR(255),
    "GiftType" VARCHAR(255),
    "Name" VARCHAR(255),
    "OriginalAmount" VARCHAR(255),
    "PaymentMethod" VARCHAR(255),
    "Status" VARCHAR(255),
    "TransactionDate" VARCHAR(255),
    "TransactionDueDate" VARCHAR(255),
    "CampaignId" VARCHAR(255),
    "DonorId" VARCHAR(255),
    "GiftCommitmentId" VARCHAR(255),
    "GiftCommitmentScheduleId" VARCHAR(255),
    "MatchingEmployerTransactionId" VARCHAR(255),
    "OutreachSourceCodeId" VARCHAR(255),
    "PaymentInstrumentId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Gala event gifts (Nov 2024)
INSERT INTO "GiftTransaction" VALUES('GT-1','Gala table purchase and auction items','Individual','Thompson Gala Gift',15000.00,'Credit Card','Paid','2024-11-15','2024-11-15','Campaign-1','Account-1',NULL,NULL,NULL,'OSC-1','PI-6');
INSERT INTO "GiftTransaction" VALUES('GT-2','Gala sponsorship payment','Individual','Washington Gala Sponsorship',10000.00,'Check','Paid','2024-11-15','2024-11-15','Campaign-1','Account-4',NULL,NULL,NULL,'OSC-2',NULL);
INSERT INTO "GiftTransaction" VALUES('GT-3','Gala auction and donation','Individual','Garcia Gala Gift',5000.00,'Credit Card','Paid','2024-11-15','2024-11-15','Campaign-1','Account-9',NULL,NULL,NULL,'OSC-1',NULL);

-- Year-end appeal (Dec 2024)
INSERT INTO "GiftTransaction" VALUES('GT-4','Year-end appeal response','Individual','Chen Year-End Gift',30000.00,'Check','Paid','2024-12-20','2024-12-20','Campaign-2','Account-3','GC-3',NULL,NULL,'OSC-3',NULL);
INSERT INTO "GiftTransaction" VALUES('GT-5','Online year-end donation','Individual','Mitchell Year-End Gift',2500.00,'Credit Card','Paid','2024-12-31','2024-12-31','Campaign-2','Account-11',NULL,NULL,NULL,'OSC-3',NULL);
INSERT INTO "GiftTransaction" VALUES('GT-6','Year-end email response','Individual','Brown Year-End Gift',5000.00,'Credit Card','Paid','2024-12-28','2024-12-28','Campaign-2','Account-12',NULL,NULL,NULL,'OSC-3',NULL);

-- Thompson pledge payments
INSERT INTO "GiftTransaction" VALUES('GT-7','First annual pledge payment','Individual','Thompson Pledge Payment 1',10000.00,'Check','Paid','2024-11-15','2024-11-15','Campaign-1','Account-1','GC-1','GCS-1',NULL,NULL,NULL);
INSERT INTO "GiftTransaction" VALUES('GT-8','Second annual pledge payment','Individual','Thompson Pledge Payment 2',10000.00,'Check','Unpaid','2025-11-15','2025-11-15','Campaign-1','Account-1','GC-1','GCS-1',NULL,NULL,NULL);

-- Rodriguez pledge payments (quarterly)
INSERT INTO "GiftTransaction" VALUES('GT-9','Q1 2025 pledge payment','Individual','Rodriguez Pledge Q1-2025',2083.33,'ACH','Paid','2025-01-10','2025-01-10','Campaign-5','Account-2','GC-2','GCS-2',NULL,NULL,'PI-7');

-- Monthly recurring donations (Amy Clark - Jan-Mar 2024)
INSERT INTO "GiftTransaction" VALUES('GT-10','January monthly donation','Individual','Amy Clark Jan-2024',100.00,'Credit Card','Paid','2024-01-05','2024-01-05','Campaign-4','Account-19','GC-4','GCS-3',NULL,'OSC-6','PI-1');
INSERT INTO "GiftTransaction" VALUES('GT-11','February monthly donation','Individual','Amy Clark Feb-2024',100.00,'Credit Card','Paid','2024-02-05','2024-02-05','Campaign-4','Account-19','GC-4','GCS-3',NULL,'OSC-6','PI-1');
INSERT INTO "GiftTransaction" VALUES('GT-12','March monthly donation','Individual','Amy Clark Mar-2024',100.00,'Credit Card','Paid','2024-03-05','2024-03-05','Campaign-4','Account-19','GC-4','GCS-3',NULL,'OSC-6','PI-1');

-- Monthly recurring donations (Steven Lewis - Jan-Mar 2024)
INSERT INTO "GiftTransaction" VALUES('GT-13','January monthly donation','Individual','Steven Lewis Jan-2024',50.00,'ACH','Paid','2024-02-10','2024-02-10','Campaign-4','Account-20','GC-5','GCS-4',NULL,'OSC-6','PI-2');
INSERT INTO "GiftTransaction" VALUES('GT-14','February monthly donation','Individual','Steven Lewis Feb-2024',50.00,'ACH','Paid','2024-03-10','2024-03-10','Campaign-4','Account-20','GC-5','GCS-4',NULL,'OSC-6','PI-2');
INSERT INTO "GiftTransaction" VALUES('GT-15','March monthly donation','Individual','Steven Lewis Mar-2024',50.00,'ACH','Paid','2024-04-10','2024-04-10','Campaign-4','Account-20','GC-5','GCS-4',NULL,'OSC-6','PI-2');

-- Foundation grant payment
INSERT INTO "GiftTransaction" VALUES('GT-16','Year 1 grant installment','Individual','Smith Foundation Grant Year 1',33333.33,'ACH','Paid','2025-01-15','2025-01-15',NULL,'Account-Org-1','GC-9','GCS-8',NULL,NULL,NULL);

-- One-time donations (sporadic donors)
INSERT INTO "GiftTransaction" VALUES('GT-17','Spring appeal response','Individual','Ross Spring Gift',500.00,'Check','Paid','2025-03-20','2025-03-20','Campaign-3','Account-74',NULL,NULL,NULL,'OSC-5',NULL);
INSERT INTO "GiftTransaction" VALUES('GT-18','Online spring donation','Individual','Henderson Spring Gift',250.00,'Credit Card','Paid','2025-03-15','2025-03-15','Campaign-3','Account-75',NULL,NULL,NULL,'OSC-5',NULL);
INSERT INTO "GiftTransaction" VALUES('GT-19','Spring appeal check','Individual','Coleman Spring Gift',1000.00,'Check','Paid','2025-04-01','2025-04-01','Campaign-3','Account-76',NULL,NULL,NULL,'OSC-5',NULL);

-- Stock gift (major donor)
INSERT INTO "GiftTransaction" VALUES('GT-20','Appreciated stock donation - 100 shares AAPL','Individual','Anderson Stock Gift',25000.00,'Stock','Paid','2024-12-15','2024-12-15','Campaign-2','Account-5',NULL,NULL,NULL,'OSC-3',NULL);

-- In-kind donation
INSERT INTO "GiftTransaction" VALUES('GT-21','Donated software licenses for program use','Organizational','TechCorp Software Donation',5000.00,'In-Kind','Paid','2025-02-01','2025-02-01','Campaign-6','Account-Org-6',NULL,NULL,NULL,NULL,NULL);

-- Matching gift
INSERT INTO "GiftTransaction" VALUES('GT-22','Employee donation','Individual','Chen Employee Gift',500.00,'Credit Card','Paid','2024-12-20','2024-12-20','Campaign-2','Account-101',NULL,NULL,NULL,'OSC-3',NULL);
INSERT INTO "GiftTransaction" VALUES('GT-23','Corporate match of employee gift GT-22','Individual','TechCorp Matching Gift',500.00,'Check','Paid','2025-01-15','2025-01-15','Campaign-6','Account-Org-6',NULL,NULL,'GT-22',NULL,NULL);

-- =========================================================
-- GiftTransactionDesignation (how gifts are allocated)
-- =========================================================

CREATE TABLE "GiftTransactionDesignation" (
    id VARCHAR(255) NOT NULL,
    "Amount" VARCHAR(255),
    "Percent" VARCHAR(255),
    "GiftDesignationId" VARCHAR(255),
    "GiftTransactionId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Split designations
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-1',7500.00,50.00,'GD-4','GT-1'); -- Thompson gala gift - 50% to Capital
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-2',7500.00,50.00,'GD-1','GT-1'); -- Thompson gala gift - 50% to General

-- Single designations
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-3',10000.00,100.00,'GD-4','GT-2'); -- Washington -> Capital
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-4',30000.00,100.00,'GD-1','GT-4'); -- Chen -> General
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-5',2083.33,100.00,'GD-2','GT-9'); -- Rodriguez -> Youth Programs
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-6',33333.33,100.00,'GD-3','GT-16'); -- Smith Foundation -> Emergency Relief

-- Monthly recurring designations
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-7',100.00,100.00,'GD-1','GT-10');
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-8',100.00,100.00,'GD-1','GT-11');
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-9',100.00,100.00,'GD-1','GT-12');
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-10',50.00,100.00,'GD-2','GT-13');
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-11',50.00,100.00,'GD-2','GT-14');
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-12',50.00,100.00,'GD-2','GT-15');

-- Stock gift split three ways
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-13',10000.00,40.00,'GD-1','GT-20'); -- Anderson stock - 40% General
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-14',10000.00,40.00,'GD-2','GT-20'); -- Anderson stock - 40% Youth
INSERT INTO "GiftTransactionDesignation" VALUES('GTD-15',5000.00,20.00,'GD-5','GT-20'); -- Anderson stock - 20% Scholarship

-- =========================================================
-- GiftRefund
-- =========================================================

CREATE TABLE "GiftRefund" (
    id VARCHAR(255) NOT NULL,
    "Amount" VARCHAR(255),
    "Date" VARCHAR(255),
    "Reason" VARCHAR(255),
    "Status" VARCHAR(255),
    "GiftTransactionId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Duplicate payment refund
INSERT INTO "GiftRefund" VALUES('GR-1',50.00,'2024-03-15','Donor Request','Completed','GT-14');

-- =========================================================
-- GiftSoftCredit (recognizing contributors who didn't make direct gift)
-- =========================================================

CREATE TABLE "GiftSoftCredit" (
    id VARCHAR(255) NOT NULL,
    "Role" VARCHAR(255),
    "GiftTransactionId" VARCHAR(255),
    "RecipientId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Board member gets soft credit for bringing in major donor
INSERT INTO "GiftSoftCredit" VALUES('GSC-1','Solicitor','GT-2','Account-11'); -- Sarah Mitchell gets credit for Washington gift

-- Foundation contact gets soft credit for grant
INSERT INTO "GiftSoftCredit" VALUES('GSC-2','Influencer','GT-16','Account-102'); -- Margaret Smith

-- Corporate contact gets credit for company donation
INSERT INTO "GiftSoftCredit" VALUES('GSC-3','Influencer','GT-21','Account-101'); -- Susan Chen

-- Spouse soft credit (household recognition)
INSERT INTO "GiftSoftCredit" VALUES('GSC-4','Household Member','GT-1','Account-7'); -- Linda Taylor (spouse of Elizabeth Thompson)

-- =========================================================
-- GiftTribute (memorial and honorary gifts)
-- =========================================================

CREATE TABLE "GiftTribute" (
    id VARCHAR(255) NOT NULL,
    "TributeType" VARCHAR(255),
    "GiftCommitmentId" VARCHAR(255),
    "GiftTransactionId" VARCHAR(255),
    "HonoreeContactId" VARCHAR(255),
    "HonoreeName" VARCHAR(255),
    "NotificationContactId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- In memory of gifts
INSERT INTO "GiftTribute" VALUES('GTRIB-1','Memorial',NULL,'GT-5',NULL,'John Mitchell','Account-11');
INSERT INTO "GiftTribute" VALUES('GTRIB-2','Memorial',NULL,'GT-17',NULL,'Robert Henderson','Account-74');

-- In honor of gifts
INSERT INTO "GiftTribute" VALUES('GTRIB-3','Honor',NULL,'GT-6',NULL,'Sarah Mitchell','Account-11');
INSERT INTO "GiftTribute" VALUES('GTRIB-4','Honor',NULL,'GT-18',NULL,'Barbara Garcia','Account-9');

-- =========================================================
-- GiftEntry (gift processing/data entry records)
-- =========================================================

CREATE TABLE "GiftEntry" (
    id VARCHAR(255) NOT NULL,
    "FirstName" VARCHAR(255),
    "GiftAmount" VARCHAR(255),
    "GiftReceivedDate" VARCHAR(255),
    "GiftType" VARCHAR(255),
    "IsNewRecurringGift" VARCHAR(255),
    "IsSetAsDefault" VARCHAR(255),
    "LastName" VARCHAR(255),
    "PaymentMethod" VARCHAR(255),
    "CampaignId" VARCHAR(255),
    "DonorId" VARCHAR(255),
    "GiftBatchId" VARCHAR(255),
    "GiftCommitmentId" VARCHAR(255),
    "GiftDesignation1Id" VARCHAR(255),
    "GiftDesignation2Id" VARCHAR(255),
    "GiftDesignation3Id" VARCHAR(255),
    "OutreachSourceCodeId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Pending entries from Spring Gala (March 2025) - collected at event, not yet processed
INSERT INTO "GiftEntry" VALUES('GE-1','Michael','2500.00','2025-03-15','Individual','False','True','Roberts','Credit Card','Campaign-3','Account-103','GB-1',NULL,'GD-1',NULL,NULL,'OSC-5');
INSERT INTO "GiftEntry" VALUES('GE-2','Patricia','1500.00','2025-03-15','Individual','False','True','Davis','Check','Campaign-3','Account-104','GB-1',NULL,'GD-2',NULL,NULL,'OSC-5');
INSERT INTO "GiftEntry" VALUES('GE-3','Christopher','1000.00','2025-03-15','Individual','False','True','Wilson','Credit Card','Campaign-3','Account-105','GB-1',NULL,'GD-1',NULL,NULL,'OSC-5');
INSERT INTO "GiftEntry" VALUES('GE-4','Elizabeth','750.00','2025-03-15','Individual','False','True','Taylor','Cash','Campaign-3','Account-106','GB-1',NULL,'GD-3',NULL,NULL,'OSC-5');
INSERT INTO "GiftEntry" VALUES('GE-5','Daniel','1250.00','2025-03-15','Individual','False','True','Martinez','Credit Card','Campaign-3','Account-107','GB-1',NULL,'GD-1',NULL,NULL,'OSC-5');
INSERT INTO "GiftEntry" VALUES('GE-6','Michelle','1500.00','2025-03-15','Individual','False','True','Anderson','Check','Campaign-3','Account-108','GB-1',NULL,'GD-2',NULL,NULL,'OSC-5');

-- =========================================================
-- Task (open tasks for fundraising operations)
-- =========================================================

CREATE TABLE "Task" (
    id VARCHAR(255) NOT NULL,
    "Subject" VARCHAR(255),
    "Status" VARCHAR(255),
    "Priority" VARCHAR(255),
    "ActivityDate" VARCHAR(255),
    "Description" VARCHAR(2000),
    "WhatId" VARCHAR(255),
    "WhoId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Tasks related to gift batch processing
INSERT INTO "Task" VALUES('Task-1','Process Spring Gala gift batch (GB-1)','Not Started','High','2025-03-18','Review and process the 6 gift entries from the Spring Gala event. Verify batch total matches expected value of $8,500.','GB-1',NULL);

-- Tasks related to gift commitments
INSERT INTO "Task" VALUES('Task-2','Follow up on Rodriguez quarterly pledge','In Progress','Normal','2025-12-15','Check in with Maria Rodriguez about her Q1 2025 pledge payment. Last payment was on time in December.','Account-2',NULL);

INSERT INTO "Task" VALUES('Task-3','Send thank you letter for Thompson major gift','Not Started','High','2025-12-10','Send personalized thank you to John Thompson for $50,000 commitment. Include information about capital campaign impact.','Account-1',NULL);

-- Tasks related to upcoming transactions
INSERT INTO "Task" VALUES('Task-4','Prepare receipt for Chen year-end gift','Not Started','Normal','2025-12-22','Generate tax receipt for Jennifer Chen''s $30,000 year-end donation. Ensure proper designation coding for general fund.','Account-3',NULL);

-- Tasks related to donor stewardship (using Contact for institutional relationships)
INSERT INTO "Task" VALUES('Task-5','Update Smith Foundation grant reporting','In Progress','Normal','2025-12-20','Prepare quarterly report for Smith Foundation grant showing program outcomes and budget spend.','Account-100','Contact-1');

INSERT INTO "Task" VALUES('Task-6','Schedule meeting with Anderson about stock gift','Not Started','Normal','2025-12-12','Meet with William Anderson to discuss additional stock gift opportunities for 2025 tax year.','Account-4',NULL);

-- Task related to payment instruments
INSERT INTO "Task" VALUES('Task-7','Update expiring credit cards for recurring donors','Not Started','High','2025-12-31','Contact 3 monthly sustainers whose credit cards expire in December. Accounts: Thompson, Williams, Taylor.','Campaign-1',NULL);

COMMIT;