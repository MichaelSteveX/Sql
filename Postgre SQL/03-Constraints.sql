-- create a table 
-- we are going to use constraints like(primary key , not null , unique , default)

CREATE TABLE users(
	user_id INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	email_id varchar(50) UNIQUE,
	age INTEGER CHECK (age>=18),
	reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM USERS;

INSERT INTO users (user_id,name,email_id,age) values
(1,'John Deo','Johndeo@gmail.com',25),
(2,'John khan','Johnkhan@gmail.com',35);


