CREATE DATABASE ecommerce_project;
USE ecommerce_project;
CREATE TABLE customers (
customer_id INT AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
gender ENUM('MALE','FEMALE','OTHER'),
city VARCHAR(50),
signup_date DATE,
salary DECIMAL(10,2),
created_at TIMESTAMP DEFAULT current_timestamp
);
INSERT INTO customers
(customer_name, email, gender, city, signup_date, salary)
VALUES
('Aisha','aisha@gmail.com','Female','Delhi','2024-01-10',55000),
('Rahul','rahul@gmail.com','Male','Mumbai','2024-02-15',65000),
('Priya','priya@gmail.com','Female','Jaipur','2024-03-01',70000),
('Aman','aman@gmail.com','Male','Delhi','2024-03-05',52000),
('Neha','neha@gmail.com','Female','Pune','2024-03-08',60000),
('Vikas','vikas@gmail.com','Male','Bangalore','2024-03-12',75000),
('Sneha','sneha@gmail.com','Female','Hyderabad','2024-03-15',58000),
('Rohit','rohit@gmail.com','Male','Chennai','2024-03-18',67000),
('Kavya','kavya@gmail.com','Female','Kolkata','2024-03-20',62000),
('Arjun','arjun@gmail.com','Male','Ahmedabad','2024-03-22',71000),
('Meera','meera@gmail.com','Female','Lucknow','2024-03-25',56000),
('Karan','karan@gmail.com','Male','Delhi','2024-03-28',69000),
('Pooja','pooja@gmail.com','Female','Mumbai','2024-04-01',64000),
('Yash','yash@gmail.com','Male','Pune','2024-04-03',55000),
('Ananya','ananya@gmail.com','Female','Bangalore','2024-04-05',72000),
('Rakesh','rakesh@gmail.com','Male','Jaipur','2024-04-08',53000),
('Simran','simran@gmail.com','Female','Chandigarh','2024-04-10',61000),
('Deepak','deepak@gmail.com','Male','Hyderabad','2024-04-12',68000),
('Nisha','nisha@gmail.com','Female','Delhi','2024-04-15',59000),
('Varun','varun@gmail.com','Male','Mumbai','2024-04-18',74000),
('Isha','isha@gmail.com','Female','Ahmedabad','2024-04-20',57000),
('Aditya','aditya@gmail.com','Male','Chennai','2024-04-22',66000),
('Riya','riya@gmail.com','Female','Pune','2024-04-25',63000),
('Manish','manish@gmail.com','Male','Kolkata','2024-04-27',71000),
('Tanya','tanya@gmail.com','Female','Bangalore','2024-05-01',62000),
('Nitin','nitin@gmail.com','Male','Lucknow','2024-05-03',54000),
('Shreya','shreya@gmail.com','Female','Delhi','2024-05-06',68000),
('Harsh','harsh@gmail.com','Male','Jaipur','2024-05-08',60000),
('Payal','payal@gmail.com','Female','Mumbai','2024-05-10',73000),
('Akash','akash@gmail.com','Male','Hyderabad','2024-05-12',65000),
('Divya','divya@gmail.com','Female','Chennai','2024-05-15',56000),
('Saurabh','saurabh@gmail.com','Male','Pune','2024-05-18',70000),
('Komal','komal@gmail.com','Female','Ahmedabad','2024-05-20',61000),
('Mohit','mohit@gmail.com','Male','Delhi','2024-05-22',67000),
('Aarti','aarti@gmail.com','Female','Kolkata','2024-05-25',58000),
('Gaurav','gaurav@gmail.com','Male','Bangalore','2024-05-28',76000),
('Muskan','muskan@gmail.com','Female','Jaipur','2024-06-01',62000),
('Abhishek','abhishek@gmail.com','Male','Mumbai','2024-06-03',69000),
('Sakshi','sakshi@gmail.com','Female','Hyderabad','2024-06-05',64000),
('Raj','raj@gmail.com','Male','Delhi','2024-06-08',72000);
SELECT * FROM customers;
SELECT customer_name,city FROM customers;
SELECT * FROM customers WHERE gender='FEMALE';
SELECT * FROM customers WHERE city='delhi';
SELECT * FROM customers WHERE customer_name LIKE 'A%';
SELECT * FROM customers ORDER BY salary DESC;
SELECT * FROM customers LIMIT 3;
UPDATE customers SET city='Gurugram' WHERE customer_id=1;
DELETE FROM customers WHERE customer_id=2;
CREATE TABLE customer_orders (
order_id INT AUTO_INCREMENT PRIMARY KEY,
amount DECIMAL(10,2),
order_date DATE
);

INSERT INTO customer_orders
(order_id, amount, order_date)
VALUES
(1, 1200.50, '2024-06-10'),
(2, 2500.00, '2024-06-11'),
(3, 1800.75, '2024-06-12'),
(4, 950.00, '2024-06-13'),
(5, 3200.25, '2024-06-14'),
(6, 1450.00, '2024-06-15'),
(7, 2750.50, '2024-06-16'),
(8, 890.00, '2024-06-17'),
(9, 4100.75, '2024-06-18'),
(10, 1650.00, '2024-06-19'),
(11, 2300.50, '2024-06-20'),
(12, 5000.00, '2024-06-21'),
(13, 1100.25, '2024-06-22'),
(14, 2800.00, '2024-06-23'),
(15, 3900.75, '2024-06-24'),
(16, 750.00, '2024-06-25'),
(17, 2100.50, '2024-06-26'),
(18, 3400.00, '2024-06-27'),
(19, 1250.25, '2024-06-28'),
(20, 4700.00, '2024-06-29'),
(21, 980.00, '2024-06-30'),
(22, 3600.50, '2024-07-01'),
(23, 1500.00, '2024-07-02'),
(24, 2200.75, '2024-07-03'),
(25, 4300.00, '2024-07-04'),
(26, 870.25, '2024-07-05'),
(27, 2950.00, '2024-07-06'),
(28, 1350.50, '2024-07-07'),
(29, 5100.00, '2024-07-08'),
(30, 1750.75, '2024-07-09');

ALTER TABLE customer_orders
ADD COLUMN customer_id INT;
ALTER TABLE customer_orders
ADD CONSTRAINT fk_customer_orders
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
SELECT c.customer_name,
o.amount
FROM customers c
INNER JOIN customer_orders o
ON c.customer_id=o.customer_id;
SELECT * FROM customer_orders;
UPDATE customer_orders
SET customer_id = 1 WHERE order_id = 1;
SELECT * FROM customers;
SELECT * FROM customer_orders;
UPDATE customer_orders
SET customer_id = 4 WHERE order_id = 3;
UPDATE customer_orders
SET customer_id = 5 WHERE order_id = 4;
SELECT * FROM customer_orders;
SELECT SUM(amount)
FROM customer_orders;
SELECT AVG(amount)
FROM customer_orders;
SELECT COUNT(amount)
FROM customer_orders;

SELECT city,AVG(salary) FROM customers GROUP BY city;
SELECT city, AVG(salary) FROM customers GROUP BY city HAVING AVG(salary)>60000;
CREATE VIEW high_salary_customers AS 
SELECT customer_name,
salary
FROM customers WHERE salary>60000;
SELECT * FROM high_salary_customers;
SELECT customer_name,salary FROM high_salary_customers WHERE customer_name LIKE 'A%';
CREATE INDEX idx_city ON customers(city);
SET autocommit=0;
UPDATE customers SET salary=80000 WHERE customer_id=4;
SELECT * FROM customers;
COMMIT;
ROLLBACK;
DROP PROCEDURE IF EXISTS Addorder;
DELIMITER $$
CREATE PROCEDURE AddOrder(
IN p_customer_id INT,
IN p_amount DECIMAL(10,2),
IN p_order_date date
)
BEGIN
INSERT INTO customer_orders(
customer_id,
amount,
order_date
)
VALUES 
(
p_customer_id,
p_amount,
p_order_date
);
END$$
DELIMITER ;
CALL AddOrder(
3,
2500,
'2025-06-01'
);
SELECT * FROM customer_orders;
USE ecommerce_project;
CREATE TABLE order_log(
log_id INT AUTO_INCREMENT PRIMARY KEY,
order_id INT,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER $$
CREATE TRIGGER after_order_insert
AFTER INSERT ON customer_orders
FOR EACH ROW
BEGIN
INSERT INTO order_log(order_id)
VALUES(NEW.order_id);
END $$
DELIMITER ;
INSERT INTO customer_orders
(customer_id,amount,order_date)
VALUES
(32,3000,'2025-06-02');
SELECT * FROM order_log;







