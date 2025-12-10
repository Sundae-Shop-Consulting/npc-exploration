-- ========================================
-- GRANTMAKING SAMPLE DATASET
-- ========================================
-- This dataset demonstrates the complete grantmaking lifecycle in Nonprofit Cloud:
-- 1. Programs and Funding Opportunities
-- 2. Applications and Review Process
-- 3. Awards and Budgets
-- 4. Disbursements and Reporting
-- 5. Outcome Tracking
--
-- Key Scenarios Covered:
-- - Youth Education Program with multiple grant cycles
-- - Community Health Initiative with capacity building grants
-- - Environmental Conservation grants with outcome tracking
-- ========================================

BEGIN TRANSACTION;

-- Account Record Types
CREATE TABLE "Account_rt_mapping" (
    record_type_id VARCHAR(18) NOT NULL,
    developer_name VARCHAR(255),
    is_person_type BOOLEAN,
    PRIMARY KEY (record_type_id)
);

INSERT INTO "Account_rt_mapping" VALUES
    ('RT-BUSINESS','Business_Account',0),
    ('RT-PERSON','PersonAccount',1);

-- ========================================
-- PROGRAMS
-- ========================================
CREATE TABLE "Program" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "Summary" VARCHAR(100),
    "AdditionalContext" TEXT,
    "StartDate" VARCHAR(40),
    "EndDate" VARCHAR(40),
    "Status" VARCHAR(40),
    "UsageType" VARCHAR(255)
);

INSERT INTO "Program" VALUES
    ('Program-1','Youth Education Excellence','Providing educational opportunities to underserved youth','This program supports innovative approaches to K-12 education in underserved communities, focusing on STEM education, literacy programs, and college readiness initiatives.','2024-01-01','2026-12-31','Active','ProgramManagement'),
    ('Program-2','Community Health Initiative','Improving health outcomes in rural communities','A comprehensive program addressing healthcare access, mental health services, and preventive care in rural and underserved urban areas.','2024-01-01','2025-12-31','Active','ProgramManagement'),
    ('Program-3','Environmental Conservation Fund','Protecting natural habitats and promoting sustainability','Supporting grassroots environmental organizations working on habitat restoration, climate change mitigation, and environmental education.','2023-07-01','2026-06-30','Active','ProgramManagement');

-- ========================================
-- APPLICATION TIMELINES
-- ========================================
CREATE TABLE "ApplicationTimeline" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "ApplicationOpenDate" VARCHAR(40),
    "ApplicationCloseDate" VARCHAR(40),
    "DecisionReleaseDate" VARCHAR(40),
    "Type" VARCHAR(255)
);

INSERT INTO "ApplicationTimeline" VALUES
    ('Timeline-1','Fall 2024 Education Grants','2024-08-01','2024-10-15','2024-12-01','Grantmaking'),
    ('Timeline-2','Spring 2025 Health Grants','2024-11-01','2025-02-01','2025-03-15','Grantmaking'),
    ('Timeline-3','Rolling Conservation Grants','2024-01-01','2025-12-31','2025-01-15','Grantmaking');

-- ========================================
-- FUNDING OPPORTUNITIES
-- ========================================
CREATE TABLE "FundingOpportunity" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "ProgramId" VARCHAR(255),
    "Name" VARCHAR(255),
    "Description" TEXT,
    "ApplicationInstructions" TEXT,
    "StartDate" VARCHAR(40),
    "EndDate" VARCHAR(40),
    "MinimumFundingAmount" VARCHAR(255),
    "MaximumFundingAmount" VARCHAR(255),
    "Status" VARCHAR(40),
    "ApplicationTimelineId" VARCHAR(255),
    "BudgetTemplateId" VARCHAR(255)
);

INSERT INTO "FundingOpportunity" VALUES
    ('FundOpp-1','Program-1','STEM Education Innovation Grants','This opportunity supports innovative STEM education programs in Title I schools. Eligible organizations include schools, nonprofits, and community organizations serving students in grades 6-12.','Applications must include: (1) Project narrative (max 5 pages), (2) Detailed budget with justifications, (3) Letters of support from partner schools, (4) Organizational 501(c)(3) determination letter. Review criteria emphasize innovation, sustainability, and measurable student outcomes.','2024-08-01','2024-10-15',25000.00,150000.00,'Active','Timeline-1',NULL),
    ('FundOpp-2','Program-1','College Access & Success Grants','Supporting programs that increase college enrollment, persistence, and completion among first-generation and low-income students.','Required elements: (1) Program description and goals, (2) Target population demographics, (3) Evidence of past success or promising pilot results, (4) Sustainability plan beyond grant period, (5) Evaluation methodology. Preference given to programs serving rural communities.','2024-08-01','2024-10-15',50000.00,200000.00,'Active','Timeline-1',NULL),
    ('FundOpp-3','Program-2','Rural Health Access Grants','Funding to expand healthcare access in rural communities through mobile clinics, telehealth, or community health workers.','Proposals should address: (1) Specific health access barriers, (2) Proposed intervention and service delivery model, (3) Partnership with healthcare providers, (4) Community engagement plan, (5) Sustainability strategy. Priority for mental health and chronic disease management.','2024-11-01','2025-02-01',30000.00,100000.00,'Active','Timeline-2',NULL),
    ('FundOpp-4','Program-3','Habitat Restoration Grants','Supporting projects that restore degraded ecosystems including wetlands, forests, and grasslands.','Application requirements: (1) Project site description and ecological assessment, (2) Restoration methodology and timeline, (3) Community involvement plan, (4) Long-term stewardship strategy, (5) Measurable ecological outcomes. Projects must demonstrate climate resilience benefits.','2024-01-01','2025-12-31',15000.00,75000.00,'Active','Timeline-3',NULL);

-- ========================================
-- GRANTEE ORGANIZATIONS (BUSINESS ACCOUNTS)
-- ========================================
CREATE TABLE "Account" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "FirstName" VARCHAR(255),
    "LastName" VARCHAR(255),
    "Name" VARCHAR(255),
    "RecordTypeId" VARCHAR(255),
    "PersonEmail" VARCHAR(80),
    "PersonMobilePhone" VARCHAR(40),
    "PersonMailingStreet" VARCHAR(255),
    "PersonMailingCity" VARCHAR(40),
    "PersonMailingState" VARCHAR(80),
    "PersonMailingPostalCode" VARCHAR(20),
    "PersonMailingCountry" VARCHAR(80),
    "BillingStreet" VARCHAR(255),
    "BillingCity" VARCHAR(40),
    "BillingState" VARCHAR(80),
    "BillingPostalCode" VARCHAR(20),
    "BillingCountry" VARCHAR(80)
);

-- Grantee Organizations (Business Accounts)
INSERT INTO "Account" VALUES
    ('Org-1',NULL,NULL,'Riverside Community Learning Center','RT-BUSINESS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'245 Oak Street','Springfield','Illinois','62701','United States'),
    ('Org-2',NULL,NULL,'Future Scientists Academy','RT-BUSINESS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'789 Innovation Drive','Champaign','Illinois','61820','United States'),
    ('Org-3',NULL,NULL,'Pathway to College Foundation','RT-BUSINESS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1523 Education Lane','Peoria','Illinois','61602','United States'),
    ('Org-4',NULL,NULL,'Rural Health Partners','RT-BUSINESS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'456 Medical Plaza','Carbondale','Illinois','62901','United States'),
    ('Org-5',NULL,NULL,'Green Valley Conservation Society','RT-BUSINESS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'892 Nature Trail','Galena','Illinois','61036','United States'),
    ('Org-6',NULL,NULL,'Northside Youth Development','RT-BUSINESS',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'334 Community Blvd','Chicago','Illinois','60614','United States');

-- Applicant Persons (Person Accounts) - these are the actual applicants for grants
INSERT INTO "Account" VALUES
    ('Person-1','Maria','Rodriguez','','RT-PERSON','maria.rodriguez@riversidelearning.org','217-555-0101','245 Oak Street','Springfield','Illinois','62701','United States',NULL,NULL,NULL,NULL,NULL),
    ('Person-2','James','Chen','','RT-PERSON','j.chen@futurescientists.org','217-555-0202','789 Innovation Drive','Champaign','Illinois','61820','United States',NULL,NULL,NULL,NULL,NULL),
    ('Person-3','Patricia','Thompson','','RT-PERSON','pthompson@pathwaycollege.org','309-555-0303','1523 Education Lane','Peoria','Illinois','61602','United States',NULL,NULL,NULL,NULL,NULL),
    ('Person-4','Dr. Michael','Okafor','','RT-PERSON','m.okafor@ruralhealthpartners.org','618-555-0404','456 Medical Plaza','Carbondale','Illinois','62901','United States',NULL,NULL,NULL,NULL,NULL),
    ('Person-5','Sarah','Williams','','RT-PERSON','swilliams@greenvalley.org','815-555-0505','892 Nature Trail','Galena','Illinois','61036','United States',NULL,NULL,NULL,NULL,NULL),
    ('Person-6','David','Kim','','RT-PERSON','dkim@northsideyouth.org','312-555-0606','334 Community Blvd','Chicago','Illinois','60614','United States',NULL,NULL,NULL,NULL,NULL);

-- ========================================
-- CONTACTS
-- ========================================
CREATE TABLE "Contact" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "AccountId" VARCHAR(255),
    "FirstName" VARCHAR(40),
    "LastName" VARCHAR(80),
    "Email" VARCHAR(80),
    "MobilePhone" VARCHAR(40),
    "Title" VARCHAR(128)
);

INSERT INTO "Contact" VALUES
    ('Contact-1','Org-1','Maria','Rodriguez','maria.rodriguez@riversidelearning.org','217-555-0101','Executive Director'),
    ('Contact-2','Org-2','James','Chen','j.chen@futurescientists.org','217-555-0202','Program Director'),
    ('Contact-3','Org-3','Patricia','Thompson','pthompson@pathwaycollege.org','309-555-0303','Grants Manager'),
    ('Contact-4','Org-4','Dr. Michael','Okafor','m.okafor@ruralhealthpartners.org','618-555-0404','Executive Director'),
    ('Contact-5','Org-5','Sarah','Williams','swilliams@greenvalley.org','815-555-0505','Conservation Director'),
    ('Contact-6','Org-6','David','Kim','dkim@northsideyouth.org','312-555-0606','Development Director');

-- ========================================
-- BUDGETS (APPLICATION BUDGETS)
-- ========================================
CREATE TABLE "Budget" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "ProgramId" VARCHAR(255),
    "AccountId" VARCHAR(255),
    "PeriodName" VARCHAR(255),
    "PeriodStartDate" VARCHAR(40),
    "PeriodEndDate" VARCHAR(40),
    "Amount" VARCHAR(255),
    "Type" VARCHAR(40),
    "Status" VARCHAR(40),
    "Description" VARCHAR(255),
    "IsSubmitted" VARCHAR(255)
);

INSERT INTO "Budget" VALUES
    ('Budget-1','Riverside STEM Lab Budget','Program-1','Org-1','Year 1: 2025','2025-01-01','2025-12-31',85000.00,'Project','Planned','Budget for establishing mobile STEM lab serving 3 rural middle schools','True'),
    ('Budget-2','Future Scientists Summer Program Budget','Program-1','Org-2','Summer 2025','2025-06-01','2025-08-31',45000.00,'Project','Planned','6-week intensive STEM camp for 60 underserved high school students','True'),
    ('Budget-3','Pathway College Readiness Budget','Program-1','Org-3','Academic Year 2025-26','2025-09-01','2026-06-30',125000.00,'Project','Planned','Comprehensive college prep program serving 150 first-gen students','True'),
    ('Budget-4','Rural Telehealth Expansion Budget','Program-2','Org-4','18 months','2025-04-01','2026-09-30',75000.00,'Project','Planned','Telehealth equipment and training for 5 rural health clinics','True'),
    ('Budget-5','Wetland Restoration Budget','Program-3','Org-5','Year 1','2025-01-01','2025-12-31',35000.00,'Project','Planned','Restore 25 acres of degraded wetland habitat','True');

-- Budget Categories
CREATE TABLE "BudgetCategory" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "BudgetId" VARCHAR(255),
    "Description" VARCHAR(255),
    "SequenceNumber" VARCHAR(255)
);

INSERT INTO "BudgetCategory" VALUES
    ('BudCat-1-1','Personnel','Budget-1','Salaries and wages for project staff',1),
    ('BudCat-1-2','Equipment & Supplies','Budget-1','STEM lab equipment, consumables, and materials',2),
    ('BudCat-1-3','Transportation','Budget-1','Mobile lab vehicle operation and maintenance',3),
    ('BudCat-1-4','Indirect Costs','Budget-1','Administrative overhead (15%)',4),
    ('BudCat-2-1','Personnel','Budget-2','Camp instructors and coordinators',1),
    ('BudCat-2-2','Materials & Supplies','Budget-2','Science kits, textbooks, lab supplies',2),
    ('BudCat-2-3','Student Support','Budget-2','Meals, transportation, field trips',3),
    ('BudCat-3-1','Personnel','Budget-3','College counselors and tutors',1),
    ('BudCat-3-2','Student Services','Budget-3','SAT prep, college visits, application support',2),
    ('BudCat-3-3','Technology','Budget-3','Laptops and software for students',3),
    ('BudCat-4-1','Equipment','Budget-4','Telehealth stations and medical devices',1),
    ('BudCat-4-2','Training','Budget-4','Staff training on telehealth technology',2),
    ('BudCat-4-3','Connectivity','Budget-4','Internet upgrades for clinics',3),
    ('BudCat-5-1','Site Preparation','Budget-5','Invasive species removal, grading',1),
    ('BudCat-5-2','Native Plants','Budget-5','Seeds and seedlings for restoration',2),
    ('BudCat-5-3','Personnel','Budget-5','Project manager and restoration crew',3);

-- Budget Category Values
CREATE TABLE "BudgetCategoryValue" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "BudgetCategoryId" VARCHAR(255),
    "Amount" VARCHAR(255),
    "Quantity" VARCHAR(255),
    "ActualAmount" VARCHAR(255),
    "ActualQuantity" VARCHAR(255),
    "Comments" VARCHAR(255)
);

INSERT INTO "BudgetCategoryValue" VALUES
    ('BudVal-1-1-1','BudCat-1-1',30000.00,0.5,NULL,NULL,'Oversees mobile lab operations'),
    ('BudVal-1-1-2','BudCat-1-1',25000.00,1.0,NULL,NULL,'Delivers hands-on STEM programming'),
    ('BudVal-1-2-1','BudCat-1-2',18000.00,1.0,NULL,NULL,'Microscopes, robotics kits, chemistry supplies'),
    ('BudVal-1-3-1','BudCat-1-3',9000.00,1.0,NULL,NULL,'Fuel, maintenance, insurance'),
    ('BudVal-1-4-1','BudCat-1-4',12750.00,1.0,NULL,NULL,'15% of direct costs'),
    ('BudVal-2-1-1','BudCat-2-1',20000.00,3.0,NULL,NULL,'3 instructors for 6 weeks'),
    ('BudVal-2-2-1','BudCat-2-2',12000.00,60.0,NULL,NULL,'Lab kits for 60 students'),
    ('BudVal-2-3-1','BudCat-2-3',10000.00,60.0,NULL,NULL,'Lunch for 6 weeks'),
    ('BudVal-3-1-1','BudCat-3-1',65000.00,2.0,NULL,NULL,'2 FT counselors'),
    ('BudVal-3-2-1','BudCat-3-2',25000.00,150.0,NULL,NULL,'Includes prep courses and test fees'),
    ('BudVal-3-3-1','BudCat-3-3',30000.00,50.0,NULL,NULL,'50 laptops for loan program'),
    ('BudVal-4-1-1','BudCat-4-1',40000.00,5.0,NULL,NULL,'Complete telehealth stations for 5 clinics'),
    ('BudVal-4-2-1','BudCat-4-2',15000.00,20.0,NULL,NULL,'Training for 20 healthcare providers'),
    ('BudVal-5-1-1','BudCat-5-1',12000.00,25.0,NULL,NULL,'25 acres @ $480/acre'),
    ('BudVal-5-2-1','BudCat-5-2',15000.00,5000.0,NULL,NULL,'5,000 native plant seedlings');

-- ========================================
-- INDIVIDUAL APPLICATIONS
-- ========================================
CREATE TABLE "IndividualApplication" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "FundingOpportunityId" VARCHAR(255),
    "AccountId" VARCHAR(255),
    "ContactId" VARCHAR(255),
    "LicenseTypeId" VARCHAR(255),
    "ApplicationName" VARCHAR(255),
    "RequestedAmount" VARCHAR(255),
    "FundingRequestPurpose" TEXT,
    "ApplicationCategory" VARCHAR(40),
    "Category" VARCHAR(40),
    "Status" VARCHAR(40),
    "InternalStatus" VARCHAR(40),
    "AppliedDate" VARCHAR(40),
    "IsSubmitted" VARCHAR(255),
    "BudgetId" VARCHAR(255)
);

INSERT INTO "IndividualApplication" VALUES
    ('App-1','FundOpp-1','Person-1','Contact-1','RegAuthType-1','Mobile STEM Lab Initiative',85000.00,'We propose to establish a mobile STEM laboratory serving three rural middle schools in Central Illinois. Our mobile lab will visit each school weekly, providing hands-on science experiments and robotics instruction to over 300 students who currently lack access to advanced STEM resources. The program addresses the critical STEM opportunity gap in rural communities and will be sustained through a combination of school district partnerships and community fundraising after the grant period.','Basic','License','Application Accepted','Submitted','2024-09-15T14:23:00','True','Budget-1'),
    ('App-2','FundOpp-1','Person-2','Contact-2','RegAuthType-1','Future Scientists Summer Academy',45000.00,'Future Scientists Academy requests support for an intensive 6-week summer STEM program serving 60 underrepresented high school students. Participants will engage in advanced laboratory work, coding workshops, and mentorship with STEM professionals. The program has shown a 95% college enrollment rate among participants over the past 3 years. This grant will allow us to expand from 40 to 60 students and add a college visit component. Cost per student is $750, significantly below market rate due to our partnerships with university labs.','Basic','License','Approved','Approved','2024-09-28T10:45:00','True','Budget-2'),
    ('App-3','FundOpp-2','Person-3','Contact-3','RegAuthType-1','Comprehensive College Access Program',125000.00,'Pathway to College Foundation seeks funding to serve 150 first-generation college-bound students through comprehensive support including: personalized college counseling, SAT/ACT preparation, college visit trips, financial aid application assistance, and ongoing mentorship. Our 4-year program data shows 89% of participants enroll in 4-year colleges (vs. 34% district average) and 78% persist through sophomore year (vs. 52% statewide). This grant enables expansion from our current 100 students to 150, reaching two additional high schools in underserved communities.','Basic','License','In Review','In Review','2024-10-05T16:10:00','True','Budget-3'),
    ('App-4','FundOpp-3','Person-4','Contact-4','RegAuthType-1','Rural Telehealth Access Network',75000.00,'Rural Health Partners proposes expanding telehealth capabilities across five rural health clinics serving a 6-county region with over 45,000 residents. Current healthcare access barriers include 90-minute travel times to specialists and mental health provider shortages. Our telehealth expansion will provide: behavioral health services (200 monthly visits projected), specialist consultations (150 monthly), and chronic disease management programs. Sustainability plan includes Medicaid/Medicare reimbursements which will cover 80% of operating costs by year 2.','Basic','License','Submitted','Submitted','2024-12-10T09:30:00','True','Budget-4'),
    ('App-5','FundOpp-4','Person-5','Contact-5','RegAuthType-1','Silver Creek Wetland Restoration',35000.00,'Green Valley Conservation Society proposes restoring 25 acres of degraded wetland along Silver Creek, a tributary feeding into the Illinois River. The site currently suffers from invasive species dominance (primarily reed canary grass) and has lost 70% of its native plant diversity. Our restoration will remove invasives, regrade hydrology, and plant 5,000 native wetland species. Expected outcomes include: 50% increase in native plant diversity within 2 years, improved water quality (20% reduction in agricultural runoff nutrients), and enhanced habitat for migratory waterfowl and amphibians. Project includes 5-year stewardship plan with volunteer monitoring.','Basic','License','Approved','Approved','2024-03-22T11:15:00','True','Budget-5'),
    ('App-6','FundOpp-2','Person-6','Contact-6','RegAuthType-1','Urban College Preparatory Initiative',110000.00,'Northside Youth Development requests funding for a college preparatory program serving 120 low-income urban students. Program includes ACT prep, college application workshops, financial literacy, and family engagement events. Our pilot year (40 students) achieved 100% college application completion and $1.2M in scholarships. This expansion will triple our capacity and add a summer bridge program for incoming college freshmen.','Basic','License','Denied','Denied','2024-10-14T13:45:00','True',NULL);

-- ========================================
-- APPLICATION STAGE DEFINITIONS
-- ========================================
CREATE TABLE "ApplicationStageDefinition" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "Description" TEXT,
    "Type" VARCHAR(255)
);

INSERT INTO "ApplicationStageDefinition" VALUES
    ('Stage-1','Initial Screening Review','Staff review for completeness and eligibility requirements','Grantmaking'),
    ('Stage-2','Programmatic Review','Subject matter expert evaluation of program design and feasibility','Grantmaking'),
    ('Stage-3','Financial Review','Budget analysis and organizational capacity assessment','Grantmaking'),
    ('Stage-4','Site Visit Assessment','In-person or virtual site visit to organization (as needed)','Grantmaking'),
    ('Stage-5','Final Review Committee','Panel review and funding recommendations','Grantmaking');

-- ========================================
-- APPLICATION REVIEWS
-- ========================================
CREATE TABLE "ApplicationReview" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "ApplicationId" VARCHAR(255),
    "ApplicationStageDefinitionId" VARCHAR(255),
    "Status" VARCHAR(40),
    "DueDate" VARCHAR(40),
    "StartDate" VARCHAR(40),
    "EndDate" VARCHAR(40),
    "Comment" TEXT,
    "ApplicationRecommendation" VARCHAR(40),
    "IsRequired" VARCHAR(255),
    "DisplayOrder" VARCHAR(255),
    "IsSubmitted" VARCHAR(255)
);

-- Reviews for Riverside (App-1) - Funded
INSERT INTO "ApplicationReview" VALUES
    ('Review-1-1','App-1','Stage-1','Completed','2024-09-18','2024-09-16','2024-09-17','Application is complete with all required attachments. Organization meets eligibility criteria as 501(c)(3) with 15 years operating history. Geographic focus aligns with program priorities.','Award','True',1,'True'),
    ('Review-1-2','App-1','Stage-2','Completed','2024-09-25','2024-09-18','2024-09-23','Strong program design with clear theory of change. Mobile lab model addresses documented access gap in rural schools. Partnerships with school districts are well-established. Work plan is realistic and achievable. Recommend funding at requested amount.','Award','True',2,'True'),
    ('Review-1-3','App-1','Stage-3','Completed','2024-10-02','2024-09-24','2024-09-29','Budget is reasonable and well-justified. Organization has strong financial health (operating reserve = 8 months). Prior grant management has been excellent. Budget narrative clearly explains cost basis. No concerns.','Award','True',3,'True');

-- Reviews for Future Scientists (App-2) - Funded
INSERT INTO "ApplicationReview" VALUES
    ('Review-2-1','App-2','Stage-1','Completed','2024-10-01','2024-09-29','2024-09-30','Complete application with strong letters of support from university partners. Eligibility confirmed.','Award','True',1,'True'),
    ('Review-2-2','App-2','Stage-2','Completed','2024-10-08','2024-10-01','2024-10-06','Excellent track record with 95% college enrollment rate. Strong curriculum design with appropriate rigor. University partnerships provide authentic lab experiences. Expansion plan is well-conceived. Highly recommend funding.','Award','True',2,'True'),
    ('Review-2-3','App-2','Stage-3','Completed','2024-10-15','2024-10-07','2024-10-12','Budget demonstrates excellent cost efficiency at $750 per student. In-kind university support effectively leveraged. Organization financial position is solid. Recommend full funding.','Award','True',3,'True');

-- Reviews for Pathway (App-3) - Still In Review
INSERT INTO "ApplicationReview" VALUES
    ('Review-3-1','App-3','Stage-1','Completed','2024-10-08','2024-10-06','2024-10-07','Complete application meeting all requirements. Strong organizational credentials and track record.','Award','True',1,'True'),
    ('Review-3-2','App-3','Stage-2','Completed','2024-10-18','2024-10-08','2024-10-16','Outstanding outcomes data with 89% college enrollment vs 34% district average. Comprehensive service model addressing multiple barriers to college access. Evidence-based interventions. Expansion plan is aggressive but feasible given organizational capacity. Strong recommendation for funding.','Award','True',2,'True'),
    ('Review-3-3','App-3','Stage-3','In Progress','2024-10-25','2024-10-17',NULL,'Initial review shows appropriate budget allocation. Requesting additional documentation on sustainability plan beyond grant period. Cost per student ($833) is reasonable for comprehensive services.','Ask for Revisions','True',3,'False');

-- Reviews for Rural Health (App-4) - Recently Submitted
INSERT INTO "ApplicationReview" VALUES
    ('Review-4-1','App-4','Stage-1','Completed','2024-12-13','2024-12-11','2024-12-12','Application complete. All required documentation present. Meets eligibility requirements.','Award','True',1,'True'),
    ('Review-4-2','App-4','Stage-2','In Progress','2024-12-20','2024-12-13',NULL,'Preliminary review: Strong needs assessment documenting healthcare access barriers. Telehealth model is evidence-based and appropriate for rural setting. Partnership letters from clinics are strong. Continuation of review in progress.','Award','True',2,'False');

-- Reviews for Green Valley (App-5) - Funded
INSERT INTO "ApplicationReview" VALUES
    ('Review-5-1','App-5','Stage-1','Completed','2024-03-25','2024-03-23','2024-03-24','Complete application with excellent supporting materials including site photos and ecological assessment.','Award','True',1,'True'),
    ('Review-5-2','App-5','Stage-2','Completed','2024-04-05','2024-03-26','2024-04-03','Well-designed restoration plan based on sound ecological principles. Site selection is strategic for water quality improvement. Restoration methodology appropriate for wetland type. 5-year stewardship commitment demonstrates long-term thinking. Recommend funding.','Award','True',2,'True'),
    ('Review-5-3','App-5','Stage-4','Completed','2024-04-15','2024-04-08','2024-04-12','Conducted site visit on 4/10. Site conditions match application description. Organization has appropriate equipment and expertise for restoration work. Strong volunteer base for ongoing stewardship. No concerns identified.','Award','True',3,'True'),
    ('Review-5-4','App-5','Stage-3','Completed','2024-04-18','2024-04-04','2024-04-16','Budget is detailed and cost-effective. Cost per acre for restoration ($1,400) is below regional average. Organization has successfully managed prior grants. Recommend full funding.','Award','True',4,'True');

-- Reviews for Northside (App-6) - Denied
INSERT INTO "ApplicationReview" VALUES
    ('Review-6-1','App-6','Stage-1','Completed','2024-10-16','2024-10-15','2024-10-15','Application complete and meets basic eligibility requirements.','Award','True',1,'True'),
    ('Review-6-2','App-6','Stage-2','Completed','2024-10-23','2024-10-17','2024-10-22','While pilot results are promising (100% college application completion), sample size is very small (n=40). Program design overlaps significantly with existing services provided by school district. Summer bridge component is not well-developed. Geographic area already has strong college access support. Recommend denial.','Deny','True',2,'True'),
    ('Review-6-3','App-6','Stage-5','Completed','2024-10-30','2024-10-24','2024-10-29','Committee concurs with program reviewer assessment. While organization shows promise, this particular proposal does not demonstrate sufficient innovation or unmet need in target area. Applicant encouraged to refine program design and consider underserved geographic areas for future submission.','Deny','True',3,'True');

-- ========================================
-- APPLICATION DECISIONS
-- ========================================
CREATE TABLE "ApplicationDecision" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "ApplicationId" VARCHAR(255),
    "ApplicationDecision" VARCHAR(40),
    "Comment" TEXT
);

INSERT INTO "ApplicationDecision" VALUES
    ('Decision-1','App-1','Award','The review panel recommends funding at the full requested amount of $85,000. The mobile STEM lab model effectively addresses a documented equity gap in rural schools and demonstrates strong potential for sustainability through school district partnerships. Organization has proven track record and capacity to execute the project successfully.'),
    ('Decision-2','App-2','Award','Recommend funding at full requested amount of $45,000. Exceptional program outcomes (95% college enrollment) and cost-effective model ($750 per student). Expansion plan is well-justified and achievable. Strong recommendation for multi-year funding consideration.'),
    ('Decision-5','App-5','Award','Approve funding at full requested amount of $35,000. Well-designed restoration project with clear ecological benefits and strong community stewardship plan. Organization demonstrates appropriate technical expertise and project management capacity.'),
    ('Decision-6','App-6','Deny','After careful review, we are unable to fund this proposal. While your organization''s pilot results are encouraging, the review panel identified concerns about geographic overlap with existing services and limited innovation in program design. We encourage you to consider underserved communities for future proposals and to further differentiate your approach. We welcome a revised proposal in our next funding cycle.');

-- ========================================
-- FUNDING AWARDS
-- ========================================
CREATE TABLE "FundingAward" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "FundingOpportunityId" VARCHAR(255),
    "IndividualApplicationId" VARCHAR(255),
    "AwardeeId" VARCHAR(255),
    "ContactId" VARCHAR(255),
    "ProgramId" VARCHAR(255),
    "DecisionDate" VARCHAR(40),
    "StartDate" VARCHAR(40),
    "EndDate" VARCHAR(40),
    "Amount" VARCHAR(255),
    "Status" VARCHAR(40),
    "BudgetId" VARCHAR(255)
);

INSERT INTO "FundingAward" VALUES
    ('Award-1','2024-YEE-001: Riverside Mobile STEM Lab','FundOpp-1','App-1','Org-1','Contact-1','Program-1','2024-11-20T00:00:00','2025-01-01T00:00:00','2025-12-31T00:00:00',85000.00,'Active','Budget-1'),
    ('Award-2','2024-YEE-002: Future Scientists Summer Academy','FundOpp-1','App-2','Org-2','Contact-2','Program-1','2024-11-20T00:00:00','2025-06-01T00:00:00','2025-08-31T00:00:00',45000.00,'Active','Budget-2'),
    ('Award-3','2024-ENV-001: Silver Creek Wetland Restoration','FundOpp-4','App-5','Org-5','Contact-5','Program-3','2024-05-15T00:00:00','2025-01-01T00:00:00','2025-12-31T00:00:00',35000.00,'Active','Budget-5');

-- ========================================
-- FUNDING DISBURSEMENTS
-- ========================================
CREATE TABLE "FundingDisbursement" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "FundingAwardId" VARCHAR(255),
    "DisbursementName" VARCHAR(255),
    "Amount" VARCHAR(255),
    "Status" VARCHAR(40),
    "ScheduledDate" VARCHAR(40),
    "DisbursementDate" VARCHAR(40),
    "PaymentMethodType" VARCHAR(40)
);

INSERT INTO "FundingDisbursement" VALUES
    ('Disb-1-1','Award-1','Initial disbursement upon executed agreement',42500.00,'Paid','2024-12-15T00:00:00','2024-12-18T00:00:00','EFT'),
    ('Disb-1-2','Award-1','Mid-year payment upon progress report',42500.00,'Scheduled','2025-06-30T00:00:00',NULL,'EFT'),
    ('Disb-2-1','Award-2','Single payment upon executed agreement',45000.00,'Paid','2025-05-15T00:00:00','2025-05-20T00:00:00','EFT'),
    ('Disb-3-1','Award-3','Initial payment',17500.00,'Paid','2024-12-20T00:00:00','2024-12-23T00:00:00','Check'),
    ('Disb-3-2','Award-3','Final payment upon completion',17500.00,'Scheduled','2025-09-30T00:00:00',NULL,'Check');

-- ========================================
-- BUDGET ALLOCATIONS
-- ========================================
CREATE TABLE "BudgetAllocation" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "BudgetId" VARCHAR(255),
    "BudgetCategoryValueId" VARCHAR(255),
    "FundingDisbursementId" VARCHAR(255),
    "Amount" VARCHAR(255),
    "Quantity" VARCHAR(255),
    "Status" VARCHAR(40)
);

INSERT INTO "BudgetAllocation" VALUES
    ('BudAlloc-1-1','Riverside Personnel - Disbursement 1','Budget-1','BudVal-1-1-1','Disb-1-1',30000.00,0.5,'Finalized'),
    ('BudAlloc-1-2','Riverside Equipment - Disbursement 1','Budget-1','BudVal-1-2-1','Disb-1-1',12500.00,1.0,'Finalized'),
    ('BudAlloc-2-1','Future Scientists Personnel','Budget-2','BudVal-2-1-1','Disb-2-1',20000.00,3.0,'Finalized'),
    ('BudAlloc-2-2','Future Scientists Materials','Budget-2','BudVal-2-2-1','Disb-2-1',12000.00,60.0,'Finalized'),
    ('BudAlloc-2-3','Future Scientists Student Support','Budget-2','BudVal-2-3-1','Disb-2-1',10000.00,60.0,'Finalized'),
    ('BudAlloc-3-1','Green Valley Site Prep','Budget-5','BudVal-5-1-1','Disb-3-1',12000.00,25.0,'Finalized'),
    ('BudAlloc-3-2','Green Valley Plants','Budget-5','BudVal-5-2-1','Disb-3-1',5500.00,1833.0,'Finalized');

-- ========================================
-- FUNDING AWARD REQUIREMENTS (REPORTING)
-- ========================================
CREATE TABLE "FundingAwardRequirement" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "FundingAwardId" VARCHAR(255),
    "Type" VARCHAR(40),
    "Description" TEXT,
    "Status" VARCHAR(40),
    "DueDate" VARCHAR(40),
    "AssignedContactId" VARCHAR(255),
    "IsSubmitted" VARCHAR(255)
);

INSERT INTO "FundingAwardRequirement" VALUES
    ('Req-1-1','Riverside Mid-Year Progress Report','Award-1','Narrative Report','Submit narrative progress report covering: (1) Activities completed January-June, (2) Number of students served by school, (3) Challenges encountered and solutions, (4) Photos/examples of student work, (5) Progress toward sustainability plan','Open','2025-06-30T00:00:00','Contact-1','False'),
    ('Req-1-2','Riverside Financial Report','Award-1','Financial Report','Submit financial report with: (1) Budget vs. actual spending by category, (2) Receipts for purchases over $5,000, (3) Brief narrative explaining any budget variances >10%','Open','2025-06-30T00:00:00','Contact-1','False'),
    ('Req-1-3','Riverside Final Report','Award-1','Combined Report','Comprehensive final report including: (1) Complete project narrative with outcomes, (2) Pre/post student assessment data, (3) Teacher feedback, (4) Final financial report, (5) Sustainability plan update, (6) Lessons learned','Open','2026-01-31T00:00:00','Contact-1','False'),
    ('Req-2-1','Future Scientists Program Report','Award-2','Narrative Report','Submit report including: (1) Student participation and demographics, (2) Pre/post STEM interest survey results, (3) Student work samples, (4) College enrollment tracking for participants, (5) Program evaluation summary','Approved','2025-09-30T00:00:00','Contact-2','True'),
    ('Req-2-2','Future Scientists Final Financial Report','Award-2','Financial Report','Final expenditure report with receipts for major purchases','In Review','2025-09-30T00:00:00','Contact-2','True'),
    ('Req-3-1','Green Valley Quarterly Progress Reports','Award-3','Narrative Report','Quarterly progress updates (March, June, September) documenting: restoration activities, volunteer hours, challenges, photo documentation','Submitted','2025-03-31T00:00:00','Contact-5','True'),
    ('Req-3-2','Green Valley Ecological Monitoring','Award-3','Narrative Report','Submit ecological monitoring data: plant species inventory, photo points, water quality test results','Open','2025-10-31T00:00:00','Contact-5','False'),
    ('Req-3-3','Green Valley Final Report','Award-3','Combined Report','Final report with: complete restoration activities, species establishment rates, lessons learned, 5-year stewardship plan, final budget','Open','2026-01-31T00:00:00','Contact-5','False');

-- ========================================
-- OUTCOMES
-- ========================================
CREATE TABLE "Outcome" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "Description" TEXT,
    "Status" VARCHAR(40)
);

INSERT INTO "Outcome" VALUES
    ('Outcome-1','Increased STEM Interest & Skills','Students demonstrate increased interest in STEM careers and improved competency in scientific inquiry and problem-solving','Active'),
    ('Outcome-2','College Enrollment & Persistence','First-generation and low-income students enroll in and persist through college','Active'),
    ('Outcome-3','Improved Healthcare Access','Rural residents have improved access to preventive care, mental health services, and specialist consultations','Active'),
    ('Outcome-4','Restored Ecosystem Function','Degraded habitats demonstrate improved ecological function including increased biodiversity and water quality','Active');

-- ========================================
-- OUTCOME ACTIVITIES (LINKING OUTCOMES TO FUNDING)
-- ========================================
CREATE TABLE "OutcomeActivity" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "OutcomeId" VARCHAR(255),
    "OutcomeActivityType" VARCHAR(40),
    "ProgramId" VARCHAR(255),
    "FundingOpportunityId" VARCHAR(255),
    "FundingAwardId" VARCHAR(255)
);

INSERT INTO "OutcomeActivity" VALUES
    ('OutAct-1','Youth Education Program - STEM Outcome','Outcome-1','Program','Program-1',NULL,NULL),
    ('OutAct-2','STEM Innovation Grants - STEM Outcome','Outcome-1','Funding Opportunity',NULL,'FundOpp-1',NULL),
    ('OutAct-3','Riverside Award - STEM Outcome','Outcome-1','Funding Award',NULL,NULL,'Award-1'),
    ('OutAct-4','Future Scientists Award - STEM Outcome','Outcome-1','Funding Award',NULL,NULL,'Award-2'),
    ('OutAct-5','Youth Education Program - College Outcome','Outcome-2','Program','Program-1',NULL,NULL),
    ('OutAct-6','College Access Grants - College Outcome','Outcome-2','Funding Opportunity',NULL,'FundOpp-2',NULL),
    ('OutAct-7','Community Health Program - Healthcare Access','Outcome-3','Program','Program-2',NULL,NULL),
    ('OutAct-8','Rural Health Grants - Healthcare Access','Outcome-3','Funding Opportunity',NULL,'FundOpp-3',NULL),
    ('OutAct-9','Environmental Program - Ecosystem Restoration','Outcome-4','Program','Program-3',NULL,NULL),
    ('OutAct-10','Habitat Restoration Grants - Ecosystem','Outcome-4','Funding Opportunity',NULL,'FundOpp-4',NULL),
    ('OutAct-11','Green Valley Award - Ecosystem Restoration','Outcome-4','Funding Award',NULL,NULL,'Award-3');

-- ========================================
-- UNIT OF MEASURE
-- ========================================
CREATE TABLE "UnitOfMeasure" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "UnitCode" VARCHAR(255)
);

INSERT INTO "UnitOfMeasure" VALUES
    ('UOM-1','Number','Count'),
    ('UOM-2','Percent','Percent'),
    ('UOM-3','Students','Count'),
    ('UOM-4','Visits','Count'),
    ('UOM-5','Species','Count'),
    ('UOM-6','mg/L','Concentration');

-- ========================================
-- INDICATOR DEFINITIONS
-- ========================================
CREATE TABLE "IndicatorDefinition" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "Description" TEXT,
    "Status" VARCHAR(40),
    "UnitOfMeasureId" VARCHAR(255)
);

INSERT INTO "IndicatorDefinition" VALUES
    ('Indicator-1','Students Served','Number of students receiving STEM programming','Active','UOM-3'),
    ('Indicator-2','STEM Interest Score','Average student score on validated STEM interest inventory (1-5 scale)','Active','UOM-1'),
    ('Indicator-3','College Enrollment Rate','Percentage of participants enrolling in college within 1 year of high school graduation','Active','UOM-2'),
    ('Indicator-4','College Persistence Rate','Percentage of participants persisting in college through sophomore year','Active','UOM-2'),
    ('Indicator-5','Healthcare Visits Completed','Number of healthcare visits completed via telehealth','Active','UOM-4'),
    ('Indicator-6','Native Plant Species Richness','Number of native plant species present at restoration site','Active','UOM-5'),
    ('Indicator-7','Water Quality - Nitrate Levels','Nitrate concentration in water samples','Active','UOM-6');

-- ========================================
-- INDICATOR ASSIGNMENTS
-- ========================================
CREATE TABLE "IndicatorAssignment" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "IndicatorDefinitionId" VARCHAR(255),
    "IndicatorAssignmentType" VARCHAR(40),
    "OutcomeId" VARCHAR(255),
    "ProgramId" VARCHAR(255),
    "FundingOpportunityId" VARCHAR(255),
    "FundingAwardId" VARCHAR(255),
    "IntendedDirection" VARCHAR(255),
    "Status" VARCHAR(40)
);

INSERT INTO "IndicatorAssignment" VALUES
    ('IndAssign-1','Program-level Students Served','Indicator-1','Program',NULL,'Program-1',NULL,NULL,'Increase','Active'),
    ('IndAssign-2','Program-level STEM Interest','Indicator-2','Program',NULL,'Program-1',NULL,NULL,'Increase','Active'),
    ('IndAssign-3','Riverside Award - Students Served','Indicator-1','Outcome','Outcome-1',NULL,NULL,'Award-1','Increase','Active'),
    ('IndAssign-4','Riverside Award - STEM Interest','Indicator-2','Outcome','Outcome-1',NULL,NULL,'Award-1','Increase','Active'),
    ('IndAssign-5','Future Scientists - Students Served','Indicator-1','Outcome','Outcome-1',NULL,NULL,'Award-2','Increase','Active'),
    ('IndAssign-6','Future Scientists - STEM Interest','Indicator-2','Outcome','Outcome-1',NULL,NULL,'Award-2','Increase','Active'),
    ('IndAssign-7','College Enrollment - Program Level','Indicator-3','Program',NULL,'Program-1',NULL,NULL,'Increase','Active'),
    ('IndAssign-8','College Persistence - Program Level','Indicator-4','Program',NULL,'Program-1',NULL,NULL,'Increase','Active'),
    ('IndAssign-9','Green Valley - Plant Species Richness','Indicator-6','Outcome','Outcome-4',NULL,NULL,'Award-3','Increase','Active'),
    ('IndAssign-10','Green Valley - Water Quality','Indicator-7','Outcome','Outcome-4',NULL,NULL,'Award-3','Decrease','Active');

-- ========================================
-- TIME PERIODS
-- ========================================
CREATE TABLE "TimePeriod" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "StartDate" VARCHAR(40),
    "EndDate" VARCHAR(40)
);

INSERT INTO "TimePeriod" VALUES
    ('Period-1','2025 Calendar Year','2025-01-01','2025-12-31'),
    ('Period-2','2025 Q1','2025-01-01','2025-03-31'),
    ('Period-3','2025 Q2','2025-04-01','2025-06-30'),
    ('Period-4','2025 Q3','2025-07-01','2025-09-30'),
    ('Period-5','2025 Q4','2025-10-01','2025-12-31'),
    ('Period-6','Summer 2025','2025-06-01','2025-08-31'),
    ('Period-7','Academic Year 2025-26','2025-09-01','2026-06-30');

-- ========================================
-- INDICATOR PERFORMANCE PERIODS
-- ========================================
CREATE TABLE "IndicatorPerformancePeriod" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255),
    "IndicatorAssignmentId" VARCHAR(255),
    "TimePeriodId" VARCHAR(255),
    "TargetValue" VARCHAR(255),
    "BaselineValue" VARCHAR(255),
    "TargetProgress" VARCHAR(40)
);

INSERT INTO "IndicatorPerformancePeriod" VALUES
    ('Perf-1','Riverside 2025 - Students Served','IndAssign-3','Period-1',300.0,0.0,'On Track'),
    ('Perf-2','Riverside 2025 - STEM Interest','IndAssign-4','Period-1',4.2,2.8,'On Track'),
    ('Perf-3','Future Scientists Summer - Students','IndAssign-5','Period-6',60.0,40.0,'Complete'),
    ('Perf-4','Future Scientists - STEM Interest','IndAssign-6','Period-6',4.5,3.2,'Complete'),
    ('Perf-5','Program College Enrollment 2025','IndAssign-7','Period-1',75.0,68.0,'On Track'),
    ('Perf-6','Green Valley Plant Richness 2025','IndAssign-9','Period-1',30.0,18.0,'On Track'),
    ('Perf-7','Green Valley Water Quality 2025','IndAssign-10','Period-1',3.5,5.2,'On Track');

-- ========================================
-- REGULATORY AUTHORIZATION TYPES
-- ========================================
CREATE TABLE "RegulatoryAuthorizationType" (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    "Name" VARCHAR(255)
);

INSERT INTO "RegulatoryAuthorizationType" VALUES
    ('RegAuthType-1','Grant Application License');

-- End of grantmaking sample dataset

COMMIT;