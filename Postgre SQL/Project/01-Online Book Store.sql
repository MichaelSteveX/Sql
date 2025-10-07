--Create DataBase 
CREATE DATABASE onlineBookStore;

--Create Table 1
DROP TABLE IF EXISTS Books;

CREATE TABLE Books(
	Book_ID SERIAL PRIMARY KEY,
	Title VARCHAR(100),
	Author VARCHAR(50),
	Genre VARCHAR(50),
	Published_Year INT,
	Price NUMERIC(10,2),
	Stock INT
);

SELECT * FROM Books;

--Create Table 2
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers(
	Customer_ID SERIAL PRIMARY KEY,
	Name VARCHAR(100),
	Email VARCHAR(100),
	Phone VARCHAR(50),
	City VARCHAR(50),
	Country VARCHAR(150)
);

SELECT * FROM Customers;

--Create Table 3
DROP TABLE IF EXISTS Orders;

CREATE TABLE Orders(
	Order_ID SERIAL PRIMARY KEY,
	Customer_ID INT REFERENCES Customers(Customer_id),
	Book_ID INT REFERENCES Books(Book_ID),
	Order_Date DATE,
	Quantity INT,
	Total_Amount NUMERIC(10,2)
);


--Import Data in to Books Table 

COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock)
FROM 'C:\Program Files\PostgreSQL\18\Books.csv'
CSV HEADER;

--Import Data in to Customers Table

COPY Customers(Customer_ID,Name,Email,Phone	,City,Country)
FROM 'C:\Program Files\PostgreSQL\18\Customers.csv'
CSV HEADER;

--Import Data in to Order Table

COPY Orders(Order_ID,Customer_ID,Book_ID,Order_Date,Quantity,Total_Amount)
FROM 'C:\Program Files\PostgreSQL\18\Orders.csv'
CSV HEADER;

SELECT * FROM Books
LIMIT 10;

SELECT * FROM Customers
LIMIT 50;

SELECT * FROM Orders
LIMIT 10;


--1) Retrive all books in the 'Fiction' genre:
SELECT * FROM Books
WHERE genre = 'Fiction';

--2) Find books published after the year 1950:
SELECT * FROM Books
WHERE published_year >= 1950;

--3) List all the customers from canada:
SELECT * FROM Customers 
WHERE country ='Canada';

--4) Show order placed in November 2023:
SELECT * FROM Orders 
WHERE order_date BETWEEN '2023-11-01'AND '2023-11-30';

--5) Retrive the total stock of books available:
SELECT SUM(stock) AS Total_Stock
FROM Books;

--6) Find the details of most expensive books :
SELECT * FROM Books
ORDER BY price DESC
LIMIT 5;

--7) show all customers who order more than 1 quantity of a book :
SELECT * FROM Orders
WHERE quantity>2
LIMIT 5;

--8) Retrive all the orders where total amount is exceed $20:
SELECT * FROM Orders
WHERE total_amount>20
LIMIT 10;

--9) List all the genre available in books table :
SELECT DISTINCT genre FROM Books;  -- distinct is use for to remove duplicate value 

--10) Find the book with lowest stock 
SELECT * FROM Books
ORDER BY stock ASC
LIMIT 5;

--11) Calculated the total revenue generated from all orders:
SELECT SUM(total_amount) AS Total_revenue
FROM Orders;

--1) Retrive the total number of books sold for each genre:
SELECT b.genre,SUM(o.quantity) AS total_booksold
FROM Orders o 
JOIN Books b ON o.book_id = b.book_id
GROUP BY b.genre;

--2) Find the average price of book in the Fantasy genre:

SELECT genre,AVG(price)
FROM Books
WHERE genre = 'Fantasy'
GROUP BY genre;

--3) List Customers who have placed at least 2 orders 
SELECT o.customer_id,c.name,COUNT(o.order_id)
FROM Orders o
JOIN customers c ON o.customer_id = c.customer_id                     
GROUP BY o.customer_id,c.name
HAVING COUNT(order_id)>=2;

--4) Find the most frequent orderd book :
SELECT o.book_id,b.title,COUNT(o.order_id) AS order_count
FROM Orders o
JOIN Books b ON o.book_id = b.book_id
GROUP BY o.book_id ,b.title
ORDER BY order_count DESC
LIMIT 1;

--5) Show the top 3 most expensive books 'Fantasy' Genre
SELECT * FROM Books
WHERE genre = 'Fantasy'
ORDER BY price DESC
LIMIT 3;

--6) Retrive the total quantity of books sold by each author :
SELECT b.author,SUM(quantity)
FROM Orders o
JOIN Books b ON b.book_id = o.book_id
GROUP BY b.author ;

--7) Select the cities where customers who spent over $30 are located
SELECT DISTINCT c.city AS spentmoney,total_amount
FROM Orders o
JOIN Customers c ON c.customer_id = o.customer_id
WHERE total_amount>300;

--8) Find the customer who spent the most on orders:
SELECT c.customer_id,c.name,SUM(o.total_amount) AS Total_Spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
GROUP BY c.customer_id,c.name
ORDER BY Total_spent DESC;

--9) Calculate the stock remaining fulfilling all orders;
SELECT b.book_id,b.title,b.stock,COALESCE (SUM(quantity),0)
FROM Books b
LEFT JOIN Orders o ON b.book_id = o.book_id
GROUP BY b.book_id;
