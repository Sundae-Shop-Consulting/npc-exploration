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
-- Person Accounts - Sporadic/One-time Donors (27)
-- =========================================================

INSERT INTO "Account" VALUES('Account-74','Carl','Ross','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-75','Anna','Henderson','','False','False','False','RT-PERSON',NULL);
INSERT INTO "Account" VALUES('Account-76','Arthur','Coleman','','False','False','False','RT-PERSON',NULL);
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
    "ExpectedRevenue" DECIMAL(18,2),
    "IsActive" VARCHAR(255),
    "Name" VARCHAR(255),
    "StartDate" VARCHAR(255),
    "Status" VARCHAR(255),
    "Type" VARCHAR(255),
    "ParentId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Annual Gala (major event)
INSERT INTO "Campaign" VALUES('Campaign-1','Annual fundraising gala with silent auction and dinner','2024-11-15',250000.00,'False','2024 Annual Gala','2024-09-01','Completed','Event',NULL);

-- Year-End Appeal
INSERT INTO "Campaign" VALUES('Campaign-2','Direct mail and email year-end giving campaign','2024-12-31',150000.00,'False','2024 Year-End Appeal','2024-11-15','Completed','Direct Mail',NULL);

-- Spring Email Campaign
INSERT INTO "Campaign" VALUES('Campaign-3','Spring email fundraising drive for program expansion','2025-05-31',75000.00,'True','2025 Spring Campaign','2025-03-01','In Progress','Email',NULL);

-- Monthly Giving Program
INSERT INTO "Campaign" VALUES('Campaign-4','Ongoing monthly giving sustainer program','2025-12-31',180000.00,'True','Sustainer Circle','2024-01-01','In Progress','Other',NULL);

-- Major Gifts Initiative
INSERT INTO "Campaign" VALUES('Campaign-5','Cultivation and solicitation of major gifts $10K+','2025-06-30',500000.00,'True','Major Gifts Initiative 2025','2024-07-01','In Progress','Other',NULL);

-- Corporate Sponsorship
INSERT INTO "Campaign" VALUES('Campaign-6','Corporate partnership and sponsorship program','2025-12-31',200000.00,'True','Corporate Partners Program','2025-01-01','In Progress','Other',NULL);

-- Memorial Giving
INSERT INTO "Campaign" VALUES('Campaign-7','In memory and tribute giving program','2025-12-31',50000.00,'True','Memorial & Tribute Gifts','2024-01-01','In Progress','Other',NULL);

-- =========================================================
-- OutreachSourceCode
-- =========================================================

CREATE TABLE "OutreachSourceCode" (
    id VARCHAR(255) NOT NULL,
    "IsActive" VARCHAR(255),
    "Medium" VARCHAR(255),
    "Name" VARCHAR(255),
    "SourceCode" VARCHAR(255),
    "CampaignId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "OutreachSourceCode" VALUES('OSC-1','True','Email','Gala Email Invitation','GALA2024-EMAIL','Campaign-1');
INSERT INTO "OutreachSourceCode" VALUES('OSC-2','True','Direct Mail','Gala Direct Mail','GALA2024-DM','Campaign-1');
INSERT INTO "OutreachSourceCode" VALUES('OSC-3','True','Email','Year-End Email','YE2024-EMAIL','Campaign-2');
INSERT INTO "OutreachSourceCode" VALUES('OSC-4','True','Direct Mail','Year-End Letter','YE2024-DM','Campaign-2');
INSERT INTO "OutreachSourceCode" VALUES('OSC-5','True','Email','Spring Email 1','SPRING2025-EM1','Campaign-3');
INSERT INTO "OutreachSourceCode" VALUES('OSC-6','True','Web','Monthly Giving Web Form','SUSTAIN-WEB','Campaign-4');
INSERT INTO "OutreachSourceCode" VALUES('OSC-7','True','Phone','Major Gift Phone Outreach','MAJGIFT-PHONE','Campaign-5');

-- =========================================================
-- OutreachSummary (tracking outreach attempts)
-- =========================================================

CREATE TABLE "OutreachSummary" (
    id VARCHAR(255) NOT NULL,
    "CampaignId" VARCHAR(255),
    "OutreachSourceCodeId" VARCHAR(255),
    PRIMARY KEY (id)
);

INSERT INTO "OutreachSummary" VALUES('OS-1','Campaign-1','OSC-1');
INSERT INTO "OutreachSummary" VALUES('OS-2','Campaign-2','OSC-3');
INSERT INTO "OutreachSummary" VALUES('OS-3','Campaign-3','OSC-5');
INSERT INTO "OutreachSummary" VALUES('OS-4','Campaign-4','OSC-6');

-- =========================================================
-- PaymentInstrument
-- =========================================================

CREATE TABLE "PaymentInstrument" (
    id VARCHAR(255) NOT NULL,
    "CardType" VARCHAR(255),
    "ExpirationMonth" VARCHAR(255),
    "ExpirationYear" VARCHAR(255),
    "NickName" VARCHAR(255),
    "PaymentMethodType" VARCHAR(255),
    "Status" VARCHAR(255),
    "AccountId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Recurring donors' payment methods
INSERT INTO "PaymentInstrument" VALUES('PI-1','Visa','12','2026','Amy Monthly Card','Credit Card','Active','Account-19');
INSERT INTO "PaymentInstrument" VALUES('PI-2','MasterCard','06','2027','Steven ACH','ACH','Active','Account-20');
INSERT INTO "PaymentInstrument" VALUES('PI-3','Visa','03','2026','Emily Recurring','Credit Card','Active','Account-21');
INSERT INTO "PaymentInstrument" VALUES('PI-4',NULL,NULL,NULL,'Kevin Bank Account','ACH','Active','Account-22');
INSERT INTO "PaymentInstrument" VALUES('PI-5','American Express','09','2028','Michelle AMEX','Credit Card','Active','Account-23');

-- Major donors
INSERT INTO "PaymentInstrument" VALUES('PI-6','Visa','11','2027','Elizabeth Primary','Credit Card','Active','Account-1');
INSERT INTO "PaymentInstrument" VALUES('PI-7',NULL,NULL,NULL,'Michael Bank Transfer','ACH','Active','Account-2');

-- =========================================================
-- GiftBatch (for processing gift entries)
-- =========================================================

CREATE TABLE "GiftBatch" (
    id VARCHAR(255) NOT NULL,
    "BatchDate" VARCHAR(255),
    "DoesTotalGiftValueMatch" VARCHAR(255),
    "Name" VARCHAR(255),
    "ScreenTemplateName" VARCHAR(255),
    "Status" VARCHAR(255),
    "TotalGiftAmount" DECIMAL(18,2),
    PRIMARY KEY (id)
);

INSERT INTO "GiftBatch" VALUES('GB-1','2024-11-20','True','Gala Event Gifts - Nov 2024','Standard','Closed',125000.00);
INSERT INTO "GiftBatch" VALUES('GB-2','2024-12-31','True','Year-End Mail Gifts - Dec 2024','Standard','Closed',87500.00);
INSERT INTO "GiftBatch" VALUES('GB-3','2025-03-15','False','Spring Campaign Gifts - Mar 2025','Standard','Open',23000.00);

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

INSERT INTO "GiftDesignation" VALUES('GD-1','General operating support for all programs','True','True','General Fund');
INSERT INTO "GiftDesignation" VALUES('GD-2','Youth education and mentoring programs','True','False','Youth Education Fund');
INSERT INTO "GiftDesignation" VALUES('GD-3','Emergency assistance for families in crisis','True','False','Emergency Relief Fund');
INSERT INTO "GiftDesignation" VALUES('GD-4','Building renovation and capital improvements','True','False','Capital Campaign');
INSERT INTO "GiftDesignation" VALUES('GD-5','Scholarship fund for program participants','True','False','Scholarship Fund');

-- =========================================================
-- Opportunity (major gift pipeline)
-- =========================================================

CREATE TABLE "Opportunity" (
    id VARCHAR(255) NOT NULL,
    "Amount" DECIMAL(18,2),
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
    "CommitmentDate" VARCHAR(255),
    "Description" VARCHAR(255),
    "ExpectedEndDate" VARCHAR(255),
    "Frequency" VARCHAR(255),
    "IsAssetTransferExpected" VARCHAR(255),
    "Name" VARCHAR(255),
    "RecordTypeId" VARCHAR(255),
    "Status" VARCHAR(255),
    "TotalAmount" DECIMAL(18,2),
    "CampaignId" VARCHAR(255),
    "DonorId" VARCHAR(255),
    "OpportunityId" VARCHAR(255),
    PRIMARY KEY (id)
);

CREATE TABLE "GiftCommitment_rt_mapping" (
    record_type_id VARCHAR(18) NOT NULL,
    developer_name VARCHAR(255),
    PRIMARY KEY (record_type_id)
);

INSERT INTO "GiftCommitment_rt_mapping" VALUES('RT-PLEDGE','Pledge');
INSERT INTO "GiftCommitment_rt_mapping" VALUES('RT-RECURRING','RecurringDonation');
INSERT INTO "GiftCommitment_rt_mapping" VALUES('RT-PLANNED','PlannedGift');
INSERT INTO "GiftCommitment_rt_mapping" VALUES('RT-GRANT','Grant');

-- Major donor pledges
INSERT INTO "GiftCommitment" VALUES('GC-1','2024-11-15','Capital campaign pledge - 5 year commitment','2029-11-15',NULL,'False','Thompson Capital Pledge','RT-PLEDGE','Active',50000.00,'Campaign-1','Account-1','Opp-1');
INSERT INTO "GiftCommitment" VALUES('GC-2','2025-01-10','Youth programs pledge - quarterly payments','2027-12-31','Quarterly','False','Rodriguez Youth Pledge','RT-PLEDGE','Active',25000.00,'Campaign-5','Account-2','Opp-2');
INSERT INTO "GiftCommitment" VALUES('GC-3','2024-12-15','Year-end major gift pledge','2025-12-31',NULL,'False','Chen Major Gift Pledge','RT-PLEDGE','Active',30000.00,'Campaign-2','Account-3','Opp-4');

-- Monthly recurring donations
INSERT INTO "GiftCommitment" VALUES('GC-4','2024-01-05','Monthly sustainer - general fund','2025-12-31','Monthly','False','Amy Clark Monthly Giving','RT-RECURRING','Active',1200.00,'Campaign-4','Account-19',NULL);
INSERT INTO "GiftCommitment" VALUES('GC-5','2024-02-10','Monthly sustainer - youth programs','2025-12-31','Monthly','False','Steven Lewis Monthly Giving','RT-RECURRING','Active',600.00,'Campaign-4','Account-20',NULL);
INSERT INTO "GiftCommitment" VALUES('GC-6','2024-03-01','Monthly sustainer - general fund','2025-12-31','Monthly','False','Emily Walker Monthly Giving','RT-RECURRING','Active',300.00,'Campaign-4','Account-21',NULL);
INSERT INTO "GiftCommitment" VALUES('GC-7','2024-01-15','Monthly sustainer - emergency fund','2025-12-31','Monthly','False','Kevin Hall Monthly Giving','RT-RECURRING','Active',1500.00,'Campaign-4','Account-22',NULL);
INSERT INTO "GiftCommitment" VALUES('GC-8','2024-04-01','Monthly sustainer - general fund','2025-12-31','Monthly','False','Michelle Allen Monthly Giving','RT-RECURRING','Active',500.00,'Campaign-4','Account-23',NULL);

-- Foundation grant
INSERT INTO "GiftCommitment" VALUES('GC-9','2025-01-15','Multi-year grant for emergency relief programs - 3 years','2027-12-31','Annually','False','Smith Foundation Emergency Relief Grant','RT-GRANT','Active',100000.00,'Campaign-5','Account-Org-1','Opp-3');

-- Planned gift
INSERT INTO "GiftCommitment" VALUES('GC-10','2024-06-01','Bequest intention documented in will','2050-12-31',NULL,'True','Wilson Bequest Intention','RT-PLANNED','Acknowledged',250000.00,NULL,'Account-10',NULL);

-- =========================================================
-- GiftCommitmentSchedule
-- =========================================================

CREATE TABLE "GiftCommitmentSchedule" (
    id VARCHAR(255) NOT NULL,
    "EndDate" VARCHAR(255),
    "InstallmentCount" INTEGER,
    "StartDate" VARCHAR(255),
    "Status" VARCHAR(255),
    "TransactionAmount" DECIMAL(18,2),
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
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-1','2029-11-15',5,'2024-11-15','Active',10000.00,'Annually','Recurring','Campaign-1','GC-1',NULL,NULL,NULL);

-- Rodriguez pledge schedule (quarterly payments)
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-2','2027-12-31',12,'2025-01-10','Active',2083.33,'Quarterly','Recurring','Campaign-5','GC-2',NULL,NULL,NULL);

-- Monthly recurring schedules
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-3','2025-12-31',12,'2024-01-05','Active',100.00,'Monthly','Recurring','Campaign-4','GC-4',NULL,'OSC-6','PI-1');
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-4','2025-12-31',12,'2024-02-10','Active',50.00,'Monthly','Recurring','Campaign-4','GC-5',NULL,'OSC-6','PI-2');
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-5','2025-12-31',12,'2024-03-01','Active',25.00,'Monthly','Recurring','Campaign-4','GC-6',NULL,'OSC-6','PI-3');
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-6','2025-12-31',12,'2024-01-15','Active',125.00,'Monthly','Recurring','Campaign-4','GC-7',NULL,'OSC-6','PI-4');
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-7','2025-12-31',12,'2024-04-01','Active',41.67,'Monthly','Recurring','Campaign-4','GC-8',NULL,'OSC-6','PI-5');

-- Grant schedule (annual installments)
INSERT INTO "GiftCommitmentSchedule" VALUES('GCS-8','2027-12-31',3,'2025-01-15','Active',33333.33,'Annually','Recurring',NULL,'GC-9',NULL,NULL,NULL);

-- =========================================================
-- GiftDefaultDesignation (default allocations for commitments/campaigns)
-- =========================================================

CREATE TABLE "GiftDefaultDesignation" (
    id VARCHAR(255) NOT NULL,
    "AllocatedPercentage" DECIMAL(5,2),
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
    "ChangePerDayAmount" DECIMAL(18,2),
    "ChangeStatus" VARCHAR(255),
    "ChangeType" VARCHAR(255),
    "EffectiveDate" VARCHAR(255),
    "Notes" VARCHAR(255),
    "Reason" VARCHAR(255),
    "CampaignId" VARCHAR(255),
    "GiftCommitmentId" VARCHAR(255),
    "GiftCommitmentScheduleId" VARCHAR(255),
    "OutreachSourceCodeId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Amy increased her monthly gift
INSERT INTO "GiftCmtChangeAttrLog" VALUES('GCAL-1',25.00,'Upgraded','Amount Increase','2024-06-01','Donor increased monthly amount from $75 to $100','Donor requested increase',NULL,'GC-4','GCS-3',NULL);

-- Kevin's payment method changed
INSERT INTO "GiftCmtChangeAttrLog" VALUES('GCAL-2',0.00,'Active','Payment Method','2024-08-15','Updated payment instrument to new bank account','Bank account change',NULL,'GC-7','GCS-6',NULL);

-- =========================================================
-- GiftTransaction (actual donation transactions)
-- =========================================================

CREATE TABLE "GiftTransaction" (
    id VARCHAR(255) NOT NULL,
    "CheckNumber" VARCHAR(255),
    "Description" VARCHAR(255),
    "DonationDate" VARCHAR(255),
    "GiftType" VARCHAR(255),
    "Name" VARCHAR(255),
    "OriginalAmount" DECIMAL(18,2),
    "PaymentMethod" VARCHAR(255),
    "Status" VARCHAR(255),
    "TransactionDate" VARCHAR(255),
    "Type" VARCHAR(255),
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
INSERT INTO "GiftTransaction" VALUES('GT-1',NULL,'Gala table purchase and auction items','2024-11-15','Cash','Thompson Gala Gift',15000.00,'Credit Card','Paid','2024-11-15','One-Time','Campaign-1','Account-1',NULL,NULL,NULL,'OSC-1','PI-6');
INSERT INTO "GiftTransaction" VALUES('GT-2','1234','Gala sponsorship payment','2024-11-15','Cash','Washington Gala Sponsorship',10000.00,'Check','Paid','2024-11-15','One-Time','Campaign-1','Account-4',NULL,NULL,NULL,'OSC-2',NULL);
INSERT INTO "GiftTransaction" VALUES('GT-3',NULL,'Gala auction and donation','2024-11-15','Cash','Garcia Gala Gift',5000.00,'Credit Card','Paid','2024-11-15','One-Time','Campaign-1','Account-9',NULL,NULL,NULL,'OSC-1',NULL);

-- Year-end appeal (Dec 2024)
INSERT INTO "GiftTransaction" VALUES('GT-4','5678','Year-end appeal response','2024-12-20','Cash','Chen Year-End Gift',30000.00,'Check','Paid','2024-12-20','One-Time','Campaign-2','Account-3','GC-3',NULL,NULL,'OSC-3',NULL);
INSERT INTO "GiftTransaction" VALUES('GT-5',NULL,'Online year-end donation','2024-12-31','Cash','Mitchell Year-End Gift',2500.00,'Credit Card','Paid','2024-12-31','One-Time','Campaign-2','Account-11',NULL,NULL,NULL,'OSC-3',NULL);
INSERT INTO "GiftTransaction" VALUES('GT-6',NULL,'Year-end email response','2024-12-28','Cash','Brown Year-End Gift',5000.00,'Credit Card','Paid','2024-12-28','One-Time','Campaign-2','Account-12',NULL,NULL,NULL,'OSC-3',NULL);

-- Thompson pledge payments
INSERT INTO "GiftTransaction" VALUES('GT-7','9012','First annual pledge payment','2024-11-15','Cash','Thompson Pledge Payment 1',10000.00,'Check','Paid','2024-11-15','Pledge Payment','Campaign-1','Account-1','GC-1','GCS-1',NULL,NULL,NULL);
INSERT INTO "GiftTransaction" VALUES('GT-8','9013','Second annual pledge payment','2025-11-15','Cash','Thompson Pledge Payment 2',10000.00,'Check','Unpaid','2025-11-15','Pledge Payment','Campaign-1','Account-1','GC-1','GCS-1',NULL,NULL,NULL);

-- Rodriguez pledge payments (quarterly)
INSERT INTO "GiftTransaction" VALUES('GT-9',NULL,'Q1 2025 pledge payment','2025-01-10','Cash','Rodriguez Pledge Q1-2025',2083.33,'ACH','Paid','2025-01-10','Pledge Payment','Campaign-5','Account-2','GC-2','GCS-2',NULL,NULL,'PI-7');

-- Monthly recurring donations (Amy Clark - Jan-Mar 2024)
INSERT INTO "GiftTransaction" VALUES('GT-10',NULL,'January monthly donation','2024-01-05','Cash','Amy Clark Jan-2024',100.00,'Credit Card','Paid','2024-01-05','Recurring','Campaign-4','Account-19','GC-4','GCS-3',NULL,'OSC-6','PI-1');
INSERT INTO "GiftTransaction" VALUES('GT-11',NULL,'February monthly donation','2024-02-05','Cash','Amy Clark Feb-2024',100.00,'Credit Card','Paid','2024-02-05','Recurring','Campaign-4','Account-19','GC-4','GCS-3',NULL,'OSC-6','PI-1');
INSERT INTO "GiftTransaction" VALUES('GT-12',NULL,'March monthly donation','2024-03-05','Cash','Amy Clark Mar-2024',100.00,'Credit Card','Paid','2024-03-05','Recurring','Campaign-4','Account-19','GC-4','GCS-3',NULL,'OSC-6','PI-1');

-- Monthly recurring donations (Steven Lewis - Jan-Mar 2024)
INSERT INTO "GiftTransaction" VALUES('GT-13',NULL,'January monthly donation','2024-02-10','Cash','Steven Lewis Jan-2024',50.00,'ACH','Paid','2024-02-10','Recurring','Campaign-4','Account-20','GC-5','GCS-4',NULL,'OSC-6','PI-2');
INSERT INTO "GiftTransaction" VALUES('GT-14',NULL,'February monthly donation','2024-03-10','Cash','Steven Lewis Feb-2024',50.00,'ACH','Paid','2024-03-10','Recurring','Campaign-4','Account-20','GC-5','GCS-4',NULL,'OSC-6','PI-2');
INSERT INTO "GiftTransaction" VALUES('GT-15',NULL,'March monthly donation','2024-04-10','Cash','Steven Lewis Mar-2024',50.00,'ACH','Paid','2024-04-10','Recurring','Campaign-4','Account-20','GC-5','GCS-4',NULL,'OSC-6','PI-2');

-- Foundation grant payment
INSERT INTO "GiftTransaction" VALUES('GT-16',NULL,'Year 1 grant installment','2025-01-15','Cash','Smith Foundation Grant Year 1',33333.33,'ACH','Paid','2025-01-15','Grant Payment',NULL,'Account-Org-1','GC-9','GCS-8',NULL,NULL,NULL);

-- One-time donations (sporadic donors)
INSERT INTO "GiftTransaction" VALUES('GT-17','4455','Spring appeal response','2025-03-20','Cash','Ross Spring Gift',500.00,'Check','Paid','2025-03-20','One-Time','Campaign-3','Account-74',NULL,NULL,NULL,'OSC-5',NULL);
INSERT INTO "GiftTransaction" VALUES('GT-18',NULL,'Online spring donation','2025-03-15','Cash','Henderson Spring Gift',250.00,'Credit Card','Paid','2025-03-15','One-Time','Campaign-3','Account-75',NULL,NULL,NULL,'OSC-5',NULL);
INSERT INTO "GiftTransaction" VALUES('GT-19','7788','Spring appeal check','2025-04-01','Cash','Coleman Spring Gift',1000.00,'Check','Paid','2025-04-01','One-Time','Campaign-3','Account-76',NULL,NULL,NULL,'OSC-5',NULL);

-- Stock gift (major donor)
INSERT INTO "GiftTransaction" VALUES('GT-20',NULL,'Appreciated stock donation - 100 shares AAPL','2024-12-15','Stock','Anderson Stock Gift',25000.00,'Stock','Paid','2024-12-15','One-Time','Campaign-2','Account-5',NULL,NULL,NULL,'OSC-3',NULL);

-- In-kind donation
INSERT INTO "GiftTransaction" VALUES('GT-21',NULL,'Donated software licenses for program use','2025-02-01','In-Kind','TechCorp Software Donation',5000.00,'Other','Paid','2025-02-01','One-Time','Campaign-6','Account-Org-6',NULL,NULL,NULL,NULL,NULL);

-- Matching gift
INSERT INTO "GiftTransaction" VALUES('GT-22',NULL,'Employee donation','2024-12-20','Cash','Chen Employee Gift',500.00,'Credit Card','Paid','2024-12-20','One-Time','Campaign-2','Contact-4',NULL,NULL,NULL,'OSC-3',NULL);
INSERT INTO "GiftTransaction" VALUES('GT-23',NULL,'Corporate match of employee gift GT-22','2025-01-15','Cash','TechCorp Matching Gift',500.00,'Check','Paid','2025-01-15','Matching Gift','Campaign-6','Account-Org-6',NULL,NULL,'GT-22',NULL,NULL);

-- =========================================================
-- GiftTransactionDesignation (how gifts are allocated)
-- =========================================================

CREATE TABLE "GiftTransactionDesignation" (
    id VARCHAR(255) NOT NULL,
    "Amount" DECIMAL(18,2),
    "Percentage" DECIMAL(5,2),
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
    "Amount" DECIMAL(18,2),
    "Date" VARCHAR(255),
    "Reason" VARCHAR(255),
    "Status" VARCHAR(255),
    "GiftTransactionId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Duplicate payment refund
INSERT INTO "GiftRefund" VALUES('GR-1',50.00,'2024-03-15','Duplicate transaction - donor was charged twice','Completed','GT-14');

-- =========================================================
-- GiftSoftCredit (recognizing contributors who didn't make direct gift)
-- =========================================================

CREATE TABLE "GiftSoftCredit" (
    id VARCHAR(255) NOT NULL,
    "Amount" DECIMAL(18,2),
    "Percentage" DECIMAL(5,2),
    "Role" VARCHAR(255),
    "GiftTransactionId" VARCHAR(255),
    "RecipientId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Board member gets soft credit for bringing in major donor
INSERT INTO "GiftSoftCredit" VALUES('GSC-1',10000.00,100.00,'Solicitor','GT-2','Account-11'); -- Sarah Mitchell gets credit for Washington gift

-- Foundation contact gets soft credit for grant
INSERT INTO "GiftSoftCredit" VALUES('GSC-2',33333.33,100.00,'Grant Writer','GT-16','Contact-1'); -- Margaret Smith

-- Corporate contact gets credit for company donation
INSERT INTO "GiftSoftCredit" VALUES('GSC-3',5000.00,100.00,'Corporate Liaison','GT-21','Contact-4'); -- Susan Chen

-- Spouse soft credit (household recognition)
INSERT INTO "GiftSoftCredit" VALUES('GSC-4',15000.00,100.00,'Household Member','GT-1','Account-7'); -- Linda Taylor (spouse of Elizabeth Thompson)

-- =========================================================
-- GiftTribute (memorial and honorary gifts)
-- =========================================================

CREATE TABLE "GiftTribute" (
    id VARCHAR(255) NOT NULL,
    "Message" VARCHAR(255),
    "NotificationPreference" VARCHAR(255),
    "TributeType" VARCHAR(255),
    "GiftCommitmentId" VARCHAR(255),
    "GiftTransactionId" VARCHAR(255),
    "HonoreeContactId" VARCHAR(255),
    "NotificationContactId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- In memory of gifts
INSERT INTO "GiftTribute" VALUES('GTRIB-1','In loving memory of John Mitchell, devoted community volunteer','Email','In Memory Of',NULL,'GT-5',NULL,'Account-11');
INSERT INTO "GiftTribute" VALUES('GTRIB-2','In memory of our beloved mother, Mary Ross','Letter','In Memory Of',NULL,'GT-17',NULL,'Account-74');

-- In honor of gifts
INSERT INTO "GiftTribute" VALUES('GTRIB-3','In honor of Sarah Mitchell for her years of board service','Email','In Honor Of',NULL,'GT-6',NULL,'Account-11');
INSERT INTO "GiftTribute" VALUES('GTRIB-4','Celebrating Dr. Garcia''s retirement and 30 years of service','Email','In Honor Of',NULL,'GT-18',NULL,'Account-9');

-- =========================================================
-- GiftEntry (gift processing/data entry records)
-- =========================================================

CREATE TABLE "GiftEntry" (
    id VARCHAR(255) NOT NULL,
    "FirstName" VARCHAR(255),
    "GiftAmount" DECIMAL(18,2),
    "GiftReceivedDate" VARCHAR(255),
    "GiftType" VARCHAR(255),
    "IsNewRecurringGift" VARCHAR(255),
    "IsSetAsDefault" VARCHAR(255),
    "LastName" VARCHAR(255),
    "Notes" VARCHAR(255),
    "PaymentMethod" VARCHAR(255),
    "Status" VARCHAR(255),
    "CampaignId" VARCHAR(255),
    "DonorId" VARCHAR(255),
    "GiftBatchId" VARCHAR(255),
    "GiftCommitmentId" VARCHAR(255),
    "GiftDesignation1Id" VARCHAR(255),
    "GiftDesignation2Id" VARCHAR(255),
    "GiftDesignation3Id" VARCHAR(255),
    "GiftTransactionId" VARCHAR(255),
    "OutreachSourceCodeId" VARCHAR(255),
    PRIMARY KEY (id)
);

-- Batch entry records for year-end campaign
INSERT INTO "GiftEntry" VALUES('GE-1','Jennifer','30000.00','2024-12-20','Cash','False','True','Chen','Large year-end gift - handwritten thank you sent','Check','Processed','Campaign-2','Account-3','GB-2','GC-3','GD-1',NULL,NULL,'GT-4','OSC-3');
INSERT INTO "GiftEntry" VALUES('GE-2','Sarah','2500.00','2024-12-31','Cash','False','True','Mitchell','Board member year-end gift','Credit Card','Processed','Campaign-2','Account-11','GB-2',NULL,'GD-1',NULL,NULL,'GT-5','OSC-3');
INSERT INTO "GiftEntry" VALUES('GE-3','Thomas','5000.00','2024-12-28','Cash','False','True','Brown','Board member gift - memorial for John Mitchell','Credit Card','Processed','Campaign-2','Account-12','GB-2',NULL,'GD-1',NULL,NULL,'GT-6','OSC-3');

-- Spring campaign entries
INSERT INTO "GiftEntry" VALUES('GE-4','Carl','500.00','2025-03-20','Cash','False','True','Ross','Spring appeal check - memorial for Mary Ross','Check','Processed','Campaign-3','Account-74','GB-3',NULL,'GD-1',NULL,NULL,'GT-17','OSC-5');
INSERT INTO "GiftEntry" VALUES('GE-5','Anna','250.00','2025-03-15','Cash','False','True','Henderson','Online spring donation - Dr. Garcia tribute','Credit Card','Processed','Campaign-3','Account-75','GB-3',NULL,'GD-2',NULL,NULL,'GT-18','OSC-5');

-- Pending entry (not yet processed)
INSERT INTO "GiftEntry" VALUES('GE-6','Arthur','1000.00','2025-04-01','Cash','False','True','Coleman','Needs designation verification','Check','Draft','Campaign-3','Account-76','GB-3',NULL,NULL,NULL,NULL,NULL,'OSC-5');

COMMIT;