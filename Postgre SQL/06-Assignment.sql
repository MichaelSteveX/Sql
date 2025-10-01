--------------------------------ASSIGNMENT------------------------------------------\

--Drop the table if exists
DROP TABLE IF EXISTS employee;

--Create a table 
CREATE TABLE IF NOT EXISTS employee(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	department VARCHAR(50),
	salary DECIMAL(10,2) CHECK(salary>0),
	joining_date DATE NOT NULL,
	age INT CHECK(age>=18)
);

--Insert data in to table 

INSERT INTO employee (first_name,last_name,department,salary,joining_date,age)
values
('Rahul', 'Sharma', 'IT', 55000.00, '2022-05-12', 28),
('Anita', 'Verma', 'HR', 48000.00, '2021-09-01', 32),
('Vikram', 'Singh', 'Finance', 60000.00, '2023-01-15', 30),
('Priya', 'Mehta', 'Marketing', 52000.00, '2020-07-20', 27),
('Arjun', 'Patel', 'Sales', 45000, '2022-11-05', 29);


SELECT * FROM employee ORDER BY employee_id

--- Q1 Retreive all employee first name and their departments

SELECT first_name , department FROM employee;

-- Q2 Update the salary of all employee in 'it' department by increasong it by 10%

UPDATE employee
SET salary = salary+(salary*0.1)
WHERE department = 'IT';

-- Q3 Delete all employee who are older than 34 years

DELETE FROM employee
WHERE age <=27;

-- Q4 Add a new column 'email' to the 'employee' table 

ALTER TABLE employee
ADD COLUMN email VARCHAR(50);

-- Q5 Rename the' department 'column to 'dept_name'

ALTER TABLE employee
RENAME COLUMN department TO dept_name;

-- Q6 Retreive the name of employee who joined after january 1 ,2021

SELECT first_name,last_name,joining_date FROM employee
WHERE joining_date >'2021-01-01';

-- Q7 Change the data type of the 'salary' column to INTEGER

ALTER TABLE employee
ALTER COLUMN salary TYPE INTEGER USING salary::INTEGER; 

-- Q8 List all the employee with their age and salary in desending order of salary 

SELECT first_name, age , salary FROM employee 
ORDER BY salary DESC;

-- Q9 insert a new employee with the following details;
       --('Raj','singh','marketing',60000,'2023-09-15')

INSERT INTO employee
(first_name,last_name,dept_name,salary,joining_date)
VALUES
('Raj','Singh','Marketing',60000.00,'2023-09-15');

-- Q10 Update the age of employee +1 to every employee

UPDATE employee
SET age = age+1;
