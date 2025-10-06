SELECT * FROM product;

--Assign unique row number to each product with in the same category 
SELECT product_name,category , price,
	ROW_NUMBER () OVER (PARTITION BY category ORDER BY price DESC) AS row_number
FROM product;

SELECT product_name,category , price,
	DENSE_RANK() OVER (PARTITION BY category ORDER BY price DESC) AS Ranking
FROM product;

SELECT product_name,category , price,
	SUM(price) OVER (ORDER BY price DESC) AS Runing_total
FROM product;

SELECT product_name,category , price,
	SUM(price) OVER (PARTITION BY category ORDER BY price DESC) AS runing_total
FROM product;