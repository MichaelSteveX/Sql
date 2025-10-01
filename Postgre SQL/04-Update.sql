-- DELETE THE TABLE IF ITS ALREADY EXIST
DROP TABLE IF EXISTS USERS;

-- CREATE TABLE IF ITS NOT EXISTS
CREATE TABLE IF NOT EXISTS users(
	user_id SERIAL PRIMARY KEY,
	username VARCHAR(50) NOT NULL,
	email_id varchar(50) NOT NULL,
	age INT,
	city VARCHAR(50)
);

SELECT * FROM USERS;

-- INSERT DATA IN TO TABLE 
INSERT INTO users (username, email_id, age, city) VALUES
('rahul_sharma', 'rahul.sharma@example.com', 25, 'Delhi'),
('priya_verma', 'priya.verma@example.com', 28, 'Mumbai'),
('arjun_mehta', 'arjun.mehta@example.com', 32, 'Bengaluru'),
('sneha_kapoor', 'sneha.kapoor@example.com', 22, 'Kolkata'),
('vikas_singh', 'vikas.singh@example.com', 30, 'Hyderabad');

-- IF WE WANT TO SEE ONLY SINGLE COLUMN THEN USE THIS 
SELECT user_id,username FROM users;

        ------------------------ UPDATE-----------------------------------

-- IF WE WANT TO UPDATE  RAHUL_SHARMA AGE THEN USE THIS COMMAND
UPDATE users
SET age = 27
WHERE username = 'rahul_sharma';


-- IF USER ID IS MISMATCH THEN USE THIS COMMAND TO ARRANGE IN PROPER FORMATE
SELECT * FROM users ORDER BY user_id;


-- UPDATE CITY BASED ON AGE 
UPDATE users
SET city = 'CHENNAI'
WHERE age>=30;

-- UPDATE 2 COLUMN VALUE AT A SINGLE TIME 
UPDATE users 
SET age = 31 , city = 'Kolkota'
WHERE username = 'rahul_sharma';

-- UPDATE COLUMN WITH LIKE 
UPDATE users
SET age = age+1
WHERE username LIKE '%sharma';



