CREATE TABLE employee2(
		Employee_id INT primary key, 
		Name VARCHAR(100) NOT NULL,
		Postitions VARCHAR(50),
		Department VARCHAR(50),
		Hire_Date DATE,
		Salary NUMERIC(10,2)
);

-- INSERT DATA IN TO THE TABLE

INSERT INTO employee2(Employee_ID,name,postitions,department,hire_date,salary)
	values('101','Ajeet Sharma','Data Analyst','Data Science','2022-05-15',65000.00),
	('102','priya Desai','Software Engineer','IT','2021-09-20',75000.00),
	('103','Rajesh Kumar','HR Manager','Human Resourses','2019-03-10',82000.00),
	('104','Sneha Patel','Marketing Specialist','Markiting','2020-11-25',58000.00),
	('105','Vikram Singh','Sales Executive','Sales','2020-02-12',62000.00);

SELECT * FROM employee2;


-- DELETE PARTICULAR ROW FROM THE TABLE 
DELETE FROM Employee2 
where Department = 'Data Science';

-- DELETE COLUMN FROM THE TABLE 
ALTER TABLE employee2
DROP COLUMN Salary;

-- IF WE WANT TO DEROP OVER ALL TABLE THE WE USE THIS COMMAND 
DROP TABLE  IF EXISTS employee2;

-- IF WE WANT TO DEOP DATABASE THEN WE HAVE TO USE THIS COMMAND 
DROP DATABASE IF EXISTS Companny;