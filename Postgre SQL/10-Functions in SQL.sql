---------------------------- FUNCTIONS IN SQL -----------------------------------
DROP TABLE IF EXISTS Product;

CREATE TABLE IF NOT EXISTS Product
(product_id SERIAL primary key ,
Product_name VARCHAR(50),
category VARCHAR(50),
price NUMERIC(10,2),
quantity INT,
added_date DATE,
discount_rate NUMERIC(5,2)
);

SELECT * FROM product ORDER BY product_id;

---- Insert values 

INSERT INTO product(
	product_name,category,price,quantity,added_date,discount_rate)
	values
	('Smartphone', 'Electronics', 75000.00, 20, '2025-02-10', 10.50),
	('Laptop', 'Electronics', 45000.00, 8, '2025-06-15', 12.75),
	('Headphones', 'Electronics', 1500.00, 35, '2025-04-22', 5.20),
	('Jeans', 'Clothing', 5500.00, 50, '2025-05-18', 7.40),
	('Jacket', 'Clothing', 8000.00, 25, '2025-01-12', 9.60),
	('Rice Bag', 'Groceries', 12000.00, 70, '2025-03-08', 3.50),
	('Cooking Oil', 'Groceries', 9500.00, 60, '2025-07-20', 4.25),
	('Novel', 'Books', 499.00, 750, '2025-02-05', 2.10),
	('Notebook', 'Books', 120.00, 1250, '2025-04-01', 1.80),
	('Chair', 'Furniture', 5499.00, 30000.00, '2025-06-09', 15.00);


-----------------------AGGREGATE FUNCTION----------------------------------

--Total quantity avalible of all products 

SELECT SUM(quantity) AS Totalo_Quantity
FROM product;

SELECT SUM(quantity) 
FROM product
WHERE category = 'Electronics' AND price >=2999;

--- Total number of product 
SELECT COUNT(*) 
FROM product;


--Average price of the product 
SELECT AVG(price)
FROM product;


--Average price of the product with condition  	
SELECT AVG(price)
FROM product
WHERE category = 'Clothing'

-- Maximum and Minimum Price 

SELECT MAX(price)
FROM product;

SELECT MIN (price)
FROM product;

-----------------------------STRING FUNCTION -----------------------------------

-- Get all the categories in upper case 
SELECT UPPER(category)
FROM product;

--Get all the categories in lower case 
SELECT LOWER(category)
FROM product;

--Now concat two column 
SELECT CONCAT(product_name,category) AS product_details
FROM product;

--Extract first 5 Character
SELECT SUBSTRING (product_name,1,4)
FROM product;

--Count length 
SELECT product_name, LENGTH (product_name) AS count_of_characters
FROM product;

--Remove leading and trailing spaces 
SELECT LENGTH('    product_name'    ) AS Trim_function;
SELECT LENGTH (TRIM('    product_name'    )) AS Trim_function;

--Replace the word phone with device 
SELECT REPLACE (product_name,'phone','device')
FROM product;

--Get the first 3 alphabet
SELECT LEFT (product_name,3)
FROM product;

--Get the last 3 alphabet
SELECT RIGHT (product_name,3)
FROM product;


---------------------------------DATE AND TIME FUNCTION PART(1 & 2) ------------------------------

--NOW() Get current date and time 

SELECT NOW() AS current_date_time;

--CURRENT DATE() Get current date

SELECT CURRENT_DATE AS Today_date;

--EXTRACT() Extract parts of dates
--Extract the year , months and day fro the added_date column 

SELECT product_name ,
		EXTRACT(YEAR FROM added_date) AS year_added,
		EXTRACT(MONTH FROM added_date) AS moyhs_added,
		EXTRACT(DAY FROM added_date) AS day_added
FROM product;

---AGE() Calculate age between Dates
-- Calculate the time difference between added_date and today's date

SELECT product_name,
	AGE(CURRENT_DATE,added_date)AS Age_since_added
FROM product

--TO_CHAR() --- Format dates as strings
--formate added_date in a custom format (DD-Mon-YYYY)

SELECT product_name,
	TO_CHAR(added_date,'DD-Mon-YYYY')AS Age_since_added
FROM product

--DATE_PART()-- Get specific Date Part
--Extract the day , month , year from the date column 

SELECT product_name,added_date,
	DATE_PART('month',added_date) AS day_of_week
FROM product;

--DATE_TRUNC()--Truncate date to precision
--truncae added_added to the start of the month 

SELECT product_name,added_date,
	DATE_TRUNC('MONTH',added_date) AS months
FROM product;

--INTERVAL -- Add or substract time intervals
--Add 6 months to the added_date.

SELECT product_name,added_date,
	added_date + INTERVAL '6 days' AS new_date
FROM product;

--CURRENT_TIME-- Get current time
--Retrieve only the current time

SELECT CURRENT_TIME AS Current_time;

--TO_DATE() --Convert string to date
--Convert a string to a date format.

SELECT TO_DATE ('28-11-2024','DD-MM-YYYY') AS Convert_Date;

--------------------------------------CONDITIONAL FUNCTION------------------------------------
/* 1 CASE FUNCTION - Categorizing based on conditions we will
categorize is between in to price range ;

Expensive if the price is greater then or equal to 50,000.
moderate if the price is between 10,000 and 49,999.
affordable if the price is less then 10,000.
*/

SELECT product_name,price,
	CASE
		WHEN price>=50000 THEN 'Expensive'
		WHEN price>=10000 AND price<=49999 THEN 'Moderate'
		ELSE 'Affordable'
	END AS price_categories
FROM product;


--ASSIGNMENT 
/* we will classify product based on quantity available 
1 in stock if quantity is 10 or more 
2 limited stock if quantity is between 5 and 9
3 out 0f stock soon if quantity is less then 5 
*/

SELECT product_name,quantity,
	CASE
		WHEN quantity>=10 THEN 'IN Stock'
		WHEN  quantity<=9 AND quantity>=5 THEN 'Limited Stock'
		ELSE 'Out Of Stock'
	END AS quantity_categories
FROM product;

/* CASE with like operator - category classififcation
check if the category name contain 'electronics' or 'furniture' using like 
*/

SELECT product_name,quantity,
	CASE
		WHEN category LIKE 'Electronics' THEN 'Electronic item'
		WHEN category LIKE 'Furniture' THEN 'Furniture item'
		ELSE 'Accessories item'
	END AS Categories_status
FROM product;

SELECT product_name,quantity,
	CASE
		WHEN category LIKE 'Electronics%' THEN 'Electronic item'
		WHEN category LIKE 'Furniture%' THEN 'Furniture item'
		ELSE 'Accessories item'
	END AS Categories_status
FROM product;

-----------------------COALESCE FUNCTION--------------------------------
/* COALESCE FUNCTION is used to handel the null value in sql 
*/

ALTER TABLE product
ADD COLUMN discount_price NUMERIC(10,2);

UPDATE product
SET discount_price = Null
WHERE product_name IN ('Laptop', 'Smartphone');

UPDATE product
SET discount_price = price*0.9  -- 10% discount
WHERE product_name NOT IN ('Laptop', 'Smartphone');

SELECT * FROM product;

SELECT product_name,
	COALESCE(discount_price,price) AS final_price	
FROM product;

