--Drop the table if exists
DROP TABLE IF EXISTS employee2;

--Create a table 
CREATE TABLE IF NOT EXISTS employee2(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	department VARCHAR(50),
	salary NUMERIC(10,2) ,
	joining_date DATE,
	age INT
);

SELECT * FROM employee2;

--Import data in to table 

COPY employee2(employee_id,first_name,last_name,department,salary,joining_date,age
)
FROM 'C:\Users\mohdy\OneDrive\Desktop\S Q L\Postgre SQL\employee_data.CSV'
DELIMITER ','
CSV HEADER;

-- Directly  import data in to sql 

DROP TABLE IF EXISTS employee3;

--Create a table 
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

-- Import file directly 

-- file directly emport with the help of import export data 




