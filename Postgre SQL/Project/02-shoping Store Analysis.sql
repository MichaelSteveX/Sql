--Create table 
DROP TABLE IF EXISTS products;

CREATE TABLE products(
	transactions_id SERIAL PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender VARCHAR(50),
	age INT,
	category VARCHAR(50),
	quantity INT,
	price_per_unit FLOAT,
	cogs NUMERIC(10,2),
	total_sale NUMERIC(10,2)
);


--------------------------------------------DATA CLEANING-------------------------------------------------
--Now see only 10 data 
SELECT * FROM products
LIMIT 10 ;

--Count all number of rows in the data set 
SELECT COUNT(*) FROM products;

--Cont number of columns 
SELECT COUNT(*) 
FROM information_schema.columns 
WHERE table_name = 'products';

--Check null value in the transactions_id column 
SELECT * FROM products
WHERE transactions_id  IS NULL;

--Now check null value in over all data 
SELECT * FROM products
WHERE 
	transactions_id  IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR 
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR 
	total_sale IS NULL;

--Delete all the null rows 

DELETE FROM products
WHERE
	transactions_id  IS NULL
	OR
	sale_date IS NULL
	OR
	sale_time IS NULL
	OR 
	customer_id IS NULL
	OR
	gender IS NULL
	OR
	age IS NULL
	OR
	category IS NULL
	OR
	quantity IS NULL
	OR
	price_per_unit IS NULL
	OR
	cogs IS NULL
	OR 
	total_sale IS NULL;

------------------------------------------DATA EXPLORATION-----------------------------------------------

--How many sales we have 
SELECT  COUNT(quantity) AS totala_sales
FROM products;

--How many customers we have 
SELECT COUNT(DISTINCT customer_id)
FROM products;

--How many categories we have 
SELECT COUNT( DISTINCT category)
FROM products;

--See the category 
SELECT DISTINCT category
FROM products;

--Data analysis and Business Key Problems and Answers

--Q1) Write a sql query to retrieve all columns for sale made on '2022-11-05'
SELECT * FROM products
WHERE sale_date = '2022-11-05';

--Q2) Write a sql query to retrieve all transcations where the category is 'Clothing' and the quantity sold is more than 10 in the month of NOV-2022
SELECT
	*
FROM products
WHERE category = 'Clothing'
	AND
	TO_CHAR(sale_date , 'YYYY-MM') = '2022-11'
	AND 
	quantity>=4;

--Q3) write a sql query to calculate the total sales (total_sales) for each category 
SELECT category,SUM(total_sale) AS total_sum,
	COUNT(*) AS net_sale
FROM products
GROUP BY category;

--Q4) write a sql query to find the average age of customer who purchesed item for the beauty category 
SELECT
	ROUND (AVG(age),2)
FROM products
WHERE category = 'Beauty';

--Q5) Write a sql query to find all transaction where the total_sale is greater then 1000
SELECT * FROM products
WHERE total_sale > 1000;

--Q6) Write the sql quaries to find the total number of transaction (transaction_id) made by each gender
SELECT category,gender ,
	COUNT(*) AS total_trans
FROM products
GROUP BY 
	Category,
	gender
ORDER BY 1;

--Q7) write a sql query to calculate the average sale for each month .find out best selling month in each year 
SELECT * FROM 
(
SELECT
	EXTRACT (YEAR FROM sale_date) AS YEAR,
	EXTRACT (MONTH FROM sale_date) AS MONTH,
	AVG(total_sale) AS avg_sale,
	RANK () OVER(PARTITION BY EXTRACT (YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC)
FROM products
GROUP BY 1,2
) AS t1
WHERE RANK = 1

--Q8) Write a sql query to find the top 5 customers based on the highest total sales 
SELECT 
	customer_id,SUM(total_sale)
	FROM products
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

--Q9) write a sql query to find the number of unique customers who purchased items from each category
SELECT category,
	COUNT(DISTINCT customer_id)
FROM products
GROUP BY category;

--10) Write a sql quesry to create each shift and number of orders(Example Morning<=12,Afternoon Between 12 and 17 , Evening >17)
WITH hourly_sale
AS
(
SELECT *,
	CASE 
		WHEN EXTRACT(HOUR FROM sale_time)<12 THEN 'Morning'
		WHEN EXTRACT (HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
		ELSE 'Evening'
	END AS shift
FROM products
)
SELECT 
	shift,
	count(*) AS total_order
	FROM hourly_sale
GROUP BY shift;















