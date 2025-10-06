drop table if exists employee3;

-- create table 
CREATE TABLE IF NOT EXISTS employee3(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	department VARCHAR(50),
	salary NUMERIC(10,2) ,
	joining_date DATE,
	age INT
);


SELECT * FROM employee3;

------------------------------- Arithematic operator 

--Q1 Retrive the first_name , salary, and calculate a 10% bonus on the salary

SELECT first_name,salary,(salary*0.10) AS Bonus
FROM employee3;

--Q2 Calculate the anual salary and salary increment by 5% show the monthly new salary as well 

SELECT first_name,salary, 
(salary*12) AS Anual_salary,
(salary*0.05) AS Increment_salary,
(salary+salary*0.05) New_salary
FROM employee3;

-----------------------------------Comparision Operatore 

--Q3 show the employee data who age is above the 30 

SELECT first_name , age FROM employee3 where age>=30;

--Q4 matches all except 30 

SELECT * FROM employee3 WHERE age<> 30;

--Q5 salary grater then 50 thousand

SELECT first_name,last_name,salary FROM employee3 
WHERE salary >=50000;

----------------------------------Logical Operator 

--Q6 sow me the data whoes salary is grater then 50k and their age is above 40

SELECT first_name,last_name,age,salary FROM employee3
WHERE salary >50000 AND age>40;

--Q7 sow me the data whoes salary is grater then 50k or their age is above 40

SELECT first_name,last_name,age,salary FROM employee3
WHERE salary >50000 OR age>40;

--Q8 using not (exclude IT with the help of NOT)
SELECT first_name,last_name,age,salary ,department FROM employee3
WHERE NOT (department = 'IT');

--------------------------------------------Bitwise Operator 

--Q10 Retrive employee whoes salary is between 40000 and 60000    use BETWEEN
SELECT * FROM employee3 
WHERE salary  BETWEEN 40000 AND 60000;

--Q11 find employees whoes emial address end with gmail.com      use LIKE 
SELECT * FROM employee3 
WHERE emial LIKE '%@gmail.com'

--Q12 find the employee whoes department is it
SELECT * FROM employee3 
WHERE department LIKE 'IT'

--Q13 Retrive employee who belong to either the 'Finance' or 'Marketing' department   use IN operator 
SELECT * FROM employee3
WHERE department IN ('Fnance','Marketing' );

--Q14 find the employee where the email column in null (if applicable)
SELECT first_name,last_name,email
FROM employee3
WHERE email IS NULL;

--Q15 List employee stored by salary in Descending order
SELECT first_name,last_name,salary
FROM employee3
ORDER BY salary DESC;

--Q16 Retrive the top 5 highest paid employee
SELECT first_name,last_name,salary
FROM employee3
ORDER BY salary DESC LIMIT 5;

--Q17 Retrive a list of unique department (this is use to find unique value)
SELECT DISTINCT department
FROM employee3
;


