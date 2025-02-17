USE titan_ddpc_dev;

## create table for CASE 
DROP TABLE IF EXISTS titan_ddpc_dev.dbo_CASE;
CREATE TABLE IF NOT EXISTS titan_ddpc_dev.dbo_CASE (
  id INT AUTO_INCREMENT PRIMARY KEY,
  case_id INT NOT NULL UNIQUE,
  case_status ENUM('PendingDocument', 'PendingReview') NOT NULL,
  case_type ENUM('Fraud', 'NetNew', 'LOD') NOT NULL,
  created_by VARCHAR(255) NOT NULL,
  create_date TIMESTAMP,
  modified_date TIMESTAMP,
  pending_review_date TIMESTAMP,
  note VARCHAR(1000)
);

## insert random data for table CASE
INSERT INTO titan_ddpc_dev.dbo_CASE (case_id, case_status, case_type, created_by, note)
VALUES
  (1, 'PendingDocument', 'Fraud', 'John Doe', 'Random note for case CASE0001.'),
  (2, 'PendingReview', 'NetNew', 'Jane Smith', 'Some random note for case CASE0002.'),
  (3, 'PendingDocument', 'LOD', 'Michael Johnson', 'Note about case CASE0003 goes here.'),
  (4, 'PendingDocument', 'NetNew', 'Emily Lee', 'A random note for case CASE0004.'),
  (5, 'PendingReview', 'Fraud', 'David Wilson', 'Note about case CASE0005.'),
  (6, 'PendingReview', 'LOD', 'Sophia Brown', 'Random note for case CASE0006.'),
  (7, 'PendingDocument', 'Fraud', 'Matthew Taylor', 'A note for case CASE0007 goes here.'),
  (8, 'PendingDocument', 'LOD', 'Olivia Martin', 'Note about case CASE0008.'),
  (9, 'PendingReview', 'NetNew', 'James Anderson', 'Random note for case CASE0009.'),
  (10, 'PendingDocument', 'LOD', 'Ava Thomas', 'Note for case CASE0010 goes here.'),
  (11, 'PendingDocument', 'Fraud', 'Robert Johnson', 'Random note for case CASE0011.'),
  (12, 'PendingReview', 'NetNew', 'Laura Adams', 'Some random note for case CASE0012.'),
  (13, 'PendingReview', 'LOD', 'Michael Scott', 'Note about case CASE0013 goes here.'),
  (14, 'PendingDocument', 'NetNew', 'Jennifer Davis', 'A random note for case CASE0014.'),
  (15, 'PendingDocument', 'LOD', 'Thomas Wilson', 'Note about case CASE0015.'),
  (16, 'PendingReview', 'Fraud', 'Sophia Thompson', 'Random note for case CASE0016.'),
  (17, 'PendingDocument', 'LOD', 'Christopher Martin', 'A note for case CASE0017 goes here.'),
  (18, 'PendingReview', 'NetNew', 'Emma Roberts', 'Random note for case CASE0018.'),
  (19, 'PendingDocument', 'LOD', 'William Johnson', 'Note for case CASE0019 goes here.'),
  (20, 'PendingDocument', 'Fraud', 'Oliver Davis', 'Random note for case CASE0020.');


-- this script works
INSERT INTO titan_ddpc_dev.dbo_CASE (case_id, case_status, case_type, created_by, create_date, modified_date, pending_review_date, note)
VALUES
  (1, 'PendingDocument', 'Fraud', 'John Doe', NOW(), DATE_ADD(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 2 DAY), 'Random note for case CASE0001.'),
  (2, 'PendingReview', 'NetNew', 'Jane Smith', NOW(), DATE_ADD(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 3 DAY), 'Some random note for case CASE0002.'),
  (3, 'PendingDocument', 'LOD', 'Michael Johnson', NOW(), DATE_ADD(NOW(), INTERVAL 3 DAY), DATE_ADD(NOW(), INTERVAL 4 DAY), 'Note about case CASE0003 goes here.'),
  (4, 'PendingDocument', 'NetNew', 'Emily Lee', NOW(), DATE_ADD(NOW(), INTERVAL 4 DAY), DATE_ADD(NOW(), INTERVAL 5 DAY), 'A random note for case CASE0004.'),
  (5, 'PendingReview', 'Fraud', 'David Wilson', NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY), DATE_ADD(NOW(), INTERVAL 6 DAY), 'Note about case CASE0005.'),
  (6, 'PendingReview', 'LOD', 'Sophia Brown', NOW(), DATE_ADD(NOW(), INTERVAL 6 DAY), DATE_ADD(NOW(), INTERVAL 7 DAY), 'Random note for case CASE0006.'),
  (7, 'PendingDocument', 'Fraud', 'Matthew Taylor', NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY), DATE_ADD(NOW(), INTERVAL 8 DAY), 'A note for case CASE0007 goes here.'),
  (8, 'PendingDocument', 'LOD', 'Olivia Martin', NOW(), DATE_ADD(NOW(), INTERVAL 8 DAY), DATE_ADD(NOW(), INTERVAL 9 DAY), 'Note about case CASE0008.'),
  (9, 'PendingReview', 'NetNew', 'James Anderson', NOW(), DATE_ADD(NOW(), INTERVAL 9 DAY), DATE_ADD(NOW(), INTERVAL 10 DAY), 'Random note for case CASE0009.'),
  (10, 'PendingDocument', 'LOD', 'Ava Thomas', NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY), DATE_ADD(NOW(), INTERVAL 11 DAY), 'Note for case CASE0010 goes here.');

-- Insert 10 random records into the dbo_CASE table with random data and date calculations
-- this script works
INSERT INTO titan_ddpc_dev.dbo_CASE (case_id, case_status, case_type, created_by, create_date, modified_date, pending_review_date, note)
VALUES
  ('CASE0001', 'PendingDocument', 'Fraud', 'John Doe', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL 1 DAY, CURRENT_TIMESTAMP + INTERVAL 2 DAY, 'Random note for case CASE0001.'),
  ('CASE0002', 'PendingReview', 'Net New', 'Jane Smith', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL 2 DAY, CURRENT_TIMESTAMP + INTERVAL 3 DAY, 'Some random note for case CASE0002.'),
  ('CASE0003', 'PendingDocument', 'LOD', 'Michael Johnson', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL 3 DAY, CURRENT_TIMESTAMP + INTERVAL 4 DAY, 'Note about case CASE0003 goes here.'),
  ('CASE0004', 'PendingDocument', 'Net New', 'Emily Lee', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL 4 DAY, CURRENT_TIMESTAMP + INTERVAL 5 DAY, 'A random note for case CASE0004.'),
  ('CASE0005', 'PendingReview', 'Fraud', 'David Wilson', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL 5 DAY, CURRENT_TIMESTAMP + INTERVAL 6 DAY, 'Note about case CASE0005.'),
  ('CASE0006', 'PendingReview', 'LOD', 'Sophia Brown', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL 6 DAY, CURRENT_TIMESTAMP + INTERVAL 7 DAY, 'Random note for case CASE0006.'),
  ('CASE0007', 'PendingDocument', 'Fraud', 'Matthew Taylor', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL 7 DAY, CURRENT_TIMESTAMP + INTERVAL 8 DAY, 'A note for case CASE0007 goes here.'),
  ('CASE0008', 'PendingDocument', 'LOD', 'Olivia Martin', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL 8 DAY, CURRENT_TIMESTAMP + INTERVAL 9 DAY, 'Note about case CASE0008.'),
  ('CASE0009', 'PendingReview', 'Net New', 'James Anderson', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL 9 DAY, CURRENT_TIMESTAMP + INTERVAL 10 DAY, 'Random note for case CASE0009.'),
  ('CASE0010', 'PendingDocument', 'LOD', 'Ava Thomas', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + INTERVAL 10 DAY, CURRENT_TIMESTAMP + INTERVAL 11 DAY, 'Note for case CASE0010 goes here.');





SELECT * FROM dbo_CASE;
SELECT * FROM titan_ddpc_dev.dbo_CASE WHERE id = 1;

## fast remove all data in table but keep table structure
TRUNCATE TABLE dbo_CASE;

## slow way to remove all data in table but keep table structure
DELETE dbo_CASE;

## remove table from db
DROP TABLE dbo_CASE;



-- this is anyother version of CASE, only use string no Enum
## create table for CASE  only use string
DROP TABLE IF EXISTS titan_ddpc_dev.dbo_CASE_STRING;
CREATE TABLE IF NOT EXISTS titan_ddpc_dev.dbo_CASE_STRING (
  id INT AUTO_INCREMENT PRIMARY KEY,
  case_id INT NOT NULL UNIQUE,
  case_status VARCHAR(255) NOT NULL,
  case_type VARCHAR(255) NOT NULL,
  created_by VARCHAR(255) NOT NULL,
  create_date TIMESTAMP,
  modified_date TIMESTAMP,
  pending_review_date TIMESTAMP,
  note VARCHAR(1000)
);

INSERT INTO titan_ddpc_dev.dbo_CASE_STRING (case_id, case_status, case_type, created_by, create_date, modified_date, pending_review_date, note)
VALUES
  (1, 'PendingDocument', 'Fraud', 'John Doe', NOW(), DATE_ADD(NOW(), INTERVAL 1 DAY), DATE_ADD(NOW(), INTERVAL 2 DAY), 'Random note for case CASE0001.'),
  (2, 'PendingReview', 'NetNew', 'Jane Smith', NOW(), DATE_ADD(NOW(), INTERVAL 2 DAY), DATE_ADD(NOW(), INTERVAL 3 DAY), 'Some random note for case CASE0002.'),
  (3, 'PendingDocument', 'LOD', 'Michael Johnson', NOW(), DATE_ADD(NOW(), INTERVAL 3 DAY), DATE_ADD(NOW(), INTERVAL 4 DAY), 'Note about case CASE0003 goes here.'),
  (4, 'PendingDocument', 'NetNew', 'Emily Lee', NOW(), DATE_ADD(NOW(), INTERVAL 4 DAY), DATE_ADD(NOW(), INTERVAL 5 DAY), 'A random note for case CASE0004.'),
  (5, 'PendingReview', 'Fraud', 'David Wilson', NOW(), DATE_ADD(NOW(), INTERVAL 5 DAY), DATE_ADD(NOW(), INTERVAL 6 DAY), 'Note about case CASE0005.'),
  (6, 'PendingReview', 'LOD', 'Sophia Brown', NOW(), DATE_ADD(NOW(), INTERVAL 6 DAY), DATE_ADD(NOW(), INTERVAL 7 DAY), 'Random note for case CASE0006.'),
  (7, 'PendingDocument', 'Fraud', 'Matthew Taylor', NOW(), DATE_ADD(NOW(), INTERVAL 7 DAY), DATE_ADD(NOW(), INTERVAL 8 DAY), 'A note for case CASE0007 goes here.'),
  (8, 'PendingDocument', 'LOD', 'Olivia Martin', NOW(), DATE_ADD(NOW(), INTERVAL 8 DAY), DATE_ADD(NOW(), INTERVAL 9 DAY), 'Note about case CASE0008.'),
  (9, 'PendingReview', 'NetNew', 'James Anderson', NOW(), DATE_ADD(NOW(), INTERVAL 9 DAY), DATE_ADD(NOW(), INTERVAL 10 DAY), 'Random note for case CASE0009.'),
  (10, 'PendingDocument', 'LOD', 'Ava Thomas', NOW(), DATE_ADD(NOW(), INTERVAL 10 DAY), DATE_ADD(NOW(), INTERVAL 11 DAY), 'Note for case CASE0010 goes here.');


SELECT * FROM dbo_CASE_STRING;
SELECT * FROM titan_ddpc_dev.dbo_CASE_STRING WHERE id = 1;

## fast remove all data in table but keep table structure
##TRUNCATE TABLE dbo_CASE_STRING;

## slow way to remove all data in table but keep table structure
##DELETE dbo_CASE_STRING;

## remove table from db
##DROP TABLE dbo_CASE_STRING;

## create table for CASE-this version has no id for internal use for db, only keep case_id as primary key
DROP TABLE IF EXISTS titan_ddpc_dev.dbo_CASE_NEW;
CREATE TABLE IF NOT EXISTS titan_ddpc_dev.dbo_CASE (
  case_id INT AUTO_INCREMENT PRIMARY KEY,
  case_status ENUM('PendingDocument', 'PendingReview') NOT NULL,
  case_type ENUM('Fraud', 'NetNew', 'LOD') NOT NULL,
  created_by VARCHAR(255) NOT NULL,
  create_date TIMESTAMP,
  modified_date TIMESTAMP,
  pending_review_date TIMESTAMP,
  note VARCHAR(1000)
);



