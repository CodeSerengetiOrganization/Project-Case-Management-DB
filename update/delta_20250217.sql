USE titan_ddpc_dev;

## --------- can not find the script for case_new table, using the following to reverse engineer the script
USE titan_ddpc_dev;
SHOW CREATE TABLE dbo_case_new;
## the  reverse engineered  script
CREATE TABLE `dbo_case_new` (
  `case_id` INT NOT NULL AUTO_INCREMENT,
  `case_status` ENUM('PendingDocument','PendingReview') NOT NULL,
  `case_type` ENUM('Fraud','NetNew','LOD') NOT NULL,
  `created_by` VARCHAR(255) NOT NULL,
  `create_date` TIMESTAMP NULL DEFAULT NULL,
  `modified_date` TIMESTAMP NULL DEFAULT NULL,
  `pending_review_date` TIMESTAMP NULL DEFAULT NULL,
  `note` VARCHAR(1000) DEFAULT NULL,
  PRIMARY KEY (`case_id`)
) ENGINE=INNODB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8

## for personal information epic, we wil use case table to add the case attributes
## but the case table has both id and case_id, so we want to make it same as case_new, then add case attributes
## so, we wnat to drop the case table and create it again
DROP TABLE IF EXISTS dbo_case;
CREATE TABLE `dbo_case`(
  `case_id` INT NOT NULL AUTO_INCREMENT,
  `case_status` ENUM('PendingDocument','PendingReview') NOT NULL,
  `case_type` ENUM('Fraud','NetNew','LOD') NOT NULL,
  `case_attributes` JSON,
  `created_by` VARCHAR(255) NOT NULL,
  `create_date` TIMESTAMP NULL DEFAULT NULL,
  `modified_date` TIMESTAMP NULL DEFAULT NULL,
  `pending_review_date` TIMESTAMP NULL DEFAULT NULL,
  `note` VARCHAR(1000) DEFAULT NULL,
  PRIMARY KEY (`case_id`)
)ENGINE=INNODB DEFAULT CHARSET=utf8

SELECT * FROM dbo_case;
## insert example data
INSERT INTO `dbo_case` (`case_status`, `case_type`, `case_attributes`, `created_by`, `create_date`, `modified_date`, `pending_review_date`, `note`) VALUES
('PendingDocument', 'Fraud', '{"caseAttributes": [{"category": "Personal Information", "attributes": [{"attributeName": "FirstName", "value": "John"}]}]}', 'Jonathan', '2024-02-14 12:30:00', '2024-02-14 14:00:00', '2024-02-20 12:00:00', 'Urgent case, requires further investigation.'),
('PendingReview', 'NetNew', '{"caseAttributes": [{"category": "Business Information", "attributes": [{"attributeName": "BusinessName", "value": "Doe Enterprises Ltd."}]}]}', 'Jonathan', '2024-02-15 10:00:00', '2024-02-15 11:00:00', '2024-02-22 10:00:00', 'Needs review for approval.'),
('PendingDocument', 'LOD', '{"caseAttributes": [{"category": "Personal Information", "attributes": [{"attributeName": "SSN", "value": "123-45-6789"}]}]}', 'Sarah', '2024-02-16 09:00:00', '2024-02-16 10:00:00', '2024-02-23 09:30:00', 'Awaiting document submission.'),
('PendingReview', 'Fraud', '{"caseAttributes": [{"category": "Personal Information", "attributes": [{"attributeName": "PhoneNumber", "value": "+1-555-1234"}]}]}', 'Michael', '2024-02-17 11:30:00', '2024-02-17 12:30:00', '2024-02-24 10:30:00', 'Potential fraudulent activity.'),
('PendingDocument', 'NetNew', '{"caseAttributes": [{"category": "Business Information", "attributes": [{"attributeName": "AnnualRevenue", "value": 1500000}]}]}', 'Emily', '2024-02-18 08:15:00', '2024-02-18 09:00:00', '2024-02-25 09:00:00', 'New case for a business entity.'),
('PendingReview', 'LOD', '{"caseAttributes": [{"category": "Personal Information", "attributes": [{"attributeName": "Email", "value": "john.doe@example.com"}]}]}', 'Jonathan', '2024-02-19 10:20:00', '2024-02-19 11:20:00', '2024-02-26 11:30:00', 'Reviewing user information.'),
('PendingDocument', 'Fraud', '{"caseAttributes": [{"category": "Business Information", "attributes": [{"attributeName": "TaxID", "value": "TAX-789654321"}]}]}', 'Alice', '2024-02-20 07:45:00', '2024-02-20 08:30:00', '2024-02-27 08:00:00', 'Suspicious business tax info.'),
('PendingReview', 'NetNew', '{"caseAttributes": [{"category": "Personal Information", "attributes": [{"attributeName": "Address", "value": "123 Main St, Toronto, ON, Canada"}]}]}', 'Sarah', '2024-02-21 15:00:00', '2024-02-21 16:00:00', '2024-02-28 15:30:00', 'Case pending user verification.'),
('PendingDocument', 'LOD', '{"caseAttributes": [{"category": "Business Information", "attributes": [{"attributeName": "RegistrationNumber", "value": "CA987654321"}]}]}', 'Michael', '2024-02-22 14:30:00', '2024-02-22 15:15:00', '2024-03-01 16:00:00', 'Awaiting registration verification.'),
('PendingReview', 'Fraud', '{"caseAttributes": [{"category": "Personal Information", "attributes": [{"attributeName": "DateOfBirth", "value": "1985-06-15"}]}]}', 'Jonathan', '2024-02-23 16:20:00', '2024-02-23 17:00:00', '2024-03-02 16:30:00', 'Potential fraud case involving age discrepancy.'),
('PendingDocument', 'NetNew', '{"caseAttributes": [{"category": "Business Information", "attributes": [{"attributeName": "NumberOfEmployees", "value": 50}]}]}', 'Alice', '2024-02-24 12:10:00', '2024-02-24 13:00:00', '2024-03-03 13:00:00', 'New case, awaiting further details.'),
('PendingReview', 'LOD', '{"caseAttributes": [{"category": "Personal Information", "attributes": [{"attributeName": "FirstName", "value": "Jane"}]}]}', 'Michael', '2024-02-25 14:50:00', '2024-02-25 15:30:00', '2024-03-04 14:30:00', 'Review case involving a name discrepancy.');

##