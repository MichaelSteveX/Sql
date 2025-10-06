--------------------------------------SET OPERATOR----------------------------

DROP TABLE IF EXISTS student_2023;

-- Create table 
CREATE TABLE IF NOT EXISTS student_2023(
	student_id INT PRIMARY KEY,
	student_name VARCHAR(50),
	course VARCHAR(50)
);

SELECT * FROM student_2023;

-- Insert data 
INSERT INTO student_2023(student_id,student_name,course)VALUES
(1, 'Amit Sharma', 'Mathematics'),
(2, 'Priya Verma', 'Computer Science'),
(3, 'Rahul Gupta', 'Physics'),
(4, 'Sneha Singh', 'Biology'),
(5, 'Arjun Mehta', 'History');


------------2024---------------------

DROP TABLE IF EXISTS student_2024;

-- Create table 
CREATE TABLE IF NOT EXISTS student_2024(
	student_id INT PRIMARY KEY,
	student_name VARCHAR(50),
	course VARCHAR(50)
);

SELECT * FROM student_2024;

-- Insert data 
INSERT INTO student_2024(student_id,student_name,course)VALUES
(3, 'Rahul Gupta', 'Physics'),
(4, 'Sneha Singh', 'Biology'),
(6, 'Meera Rao','Computer Science'),
(7, 'Vikram Singh','Mathematics'),
(8, 'Sanya Kapoor','Physics');


SELECT * FROM student_2024;

--- UNION -- Combine results remove duplicate

SELECT student_name,course FROM student_2023
UNION
SELECT student_name,course  FROM student_2024;

--UNION ALL --- combine result , keeps duplicates

SELECT student_name,course FROM student_2023
UNION ALL
SELECT student_name,course  FROM student_2024

--INTERSECT--- Returns common result in both table 

SELECT student_name,course FROM student_2023
INTERSECT
SELECT student_name,course  FROM student_2024

--EXCEPT-- Return result in the first table but not in the second 

SELECT student_name,course FROM student_2023
EXCEPT
SELECT student_name,course  FROM student_2024




