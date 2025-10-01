-- Drrop the tabl if exists
DROP TABLE IF EXISTS users;

-- Create a table 
CREATE TABLE IF NOT EXISTS USERS(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	email_id varchar(50) NOT NULL,
	age INT,
	city VARCHAR(50)
);

-- Insert the value in to the table 
INSERT INTO USERS
(username,email_id,age,city)
values
('rahul_sharma', 'rahul.sharma@example.com', 25, 'Delhi'),
('priya_verma', 'priya.verma@example.com', 28, 'Mumbai'),
('arjun_mehta', 'arjun.mehta@example.com', 32, 'Bengaluru'),
('sneha_kapoor', 'sneha.kapoor@example.com', 22, 'Kolkata'),
('vikas_singh', 'vikas.singh@example.com', 30, 'Hyderabad');

SELECT * FROM users ORDER BY user_id;

---------------------------------------- ALTER COMAAND -----------------------------------

--Rename username column to full name 

ALTER TABLE users
RENAME COLUMN username TO full_name;

-- To change age column data type from INT to SMALLINT

ALTER TABLE users
ALTER COLUMN age TYPE SMALLINT;

--Add constraints on column which column have no constraints

ALTER TABLE users
ALTER COLUMN city SET NOT NULL; 

-- Add constraints on age 

ALTER TABLE users
DROP CONSTRAINT age;

ALTER TABLE userS
ADD CONSTRAINT age CHECK(age>=18);

-- Alter table name 

ALTER TABLE users
RENAME TO cutsomers;

ALTER TABLE cutsomers
RENAME TO users;



