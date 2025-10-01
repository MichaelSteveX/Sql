-- CREATING A DATABASE AND TABLE

CREATE TABLE employee(
		Employee_id SERIAL primary key, 
		Name VARCHAR(100) NOT NULL,
		Postitions VARCHAR(50),
		Department VARCHAR(50),
		Hire_Date DATE,
		Salary NUMERIC(10,2)
);

-- INSERT DATA IN TO THE TABLE

INSERT INTO employee(name,positions,department,hire_date,salary)
	values('Ajeet Sharma','Data Analyst','Data Science','2022-05-15',65000.00),
	('priya Desai','Software Engineer','IT','2021-09-20',75000.00),
	('Rajesh Kumar','HR Manager','Human Resourses','2019-03-10',82000.00),
	('Sneha Patel','Marketing Specialist','Markiting','2020-11-25',58000.00),
	('Vikram Singh','Sales Executive','Sales','2020-02-12',62000.00);

SELECT * FROM employee;

-- Alter table 

ALTER TABLE employee
RENAME COLUMN Postitions TO Positions;

-- IF WE WANT TO DELETE OVERALL DATA FROM THE TABLE WE USE THIS COMMAND 

TRUNCATE TABLE employee;

-- IF WE WANT TO RESTART WITH 1 ID NUMBER THEN USE THIS 

TRUNCATE TABLE employee RESTART IDENTITY;
