-- Create table Customer
CREATE TABLE Customer_Exp8_csa_35 (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(25),
  contact_no BIGINT,
  address VARCHAR(50),
  city VARCHAR(20),
  postal_code INT,
  country VARCHAR(20)
);

-- Create table Employees
CREATE TABLE Employees_Exp8_csa_35 (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  birthdate DATE,
  photo BLOB
);

-- Create table Orders
CREATE TABLE Orders_Exp8_csa_35 (
  order_id INT PRIMARY KEY,
  customer_id INT,
  employee_id INT,
  order_date DATE,
  shipper_id INT,
  FOREIGN KEY (customer_id) REFERENCES Customer_Exp8_csa_35(customer_id),
  FOREIGN KEY (employee_id) REFERENCES Employees_Exp8_csa_35(employee_id)
);

-- Insert records into Customer table
INSERT INTO Customer_Exp8_csa_35 VALUES
(1, 'Kutty', 1111111111, 'Address1', 'Kuttanadu', 111111, 'India'),
(2, 'Sabu', 2111111112, 'Address2', 'Swodhesam', 211112, 'USA'),
(3, 'Kevin', 3111111113, 'Address3', 'Kuttanadu', 311113, 'India'),
(4, 'Jose', 4111111114, 'Address4', 'Swodhesam', 411114, 'USA'),
(5, 'Jismi', 5111111115, 'Address5', 'Kottayam', 511115, 'India');

-- Insert records into Employees table
INSERT INTO Employees_Exp8_csa_35 VALUES
(1, 'Jeswin', 'Jose', '2004-02-02', NULL),
(2, 'Peter', 'Parker', '2004-05-05', NULL),
(3, 'Mary', 'Jane', '2004-06-02', NULL),
(4, 'Harry', 'Potter', '2004-09-02', NULL),
(5, 'Howard', 'Stark', '1954-02-15', NULL);

-- Insert records into Orders table
INSERT INTO Orders_Exp8_csa_35 VALUES
(1, 1, 1, '2024-08-08', 1),
(2, 2, 2, '2024-08-09', 2),
(3, 2, 2, '2024-08-09', 3),
(4, 3, 3, '2024-08-18', 4),
(5, 4, 4, '2024-08-28', 5),
(6, 5, 5, '2024-08-29', 6);

-- Queries for the task
-- 1. List all customers in ascending order by their names
SELECT * FROM Customer_Exp8_csa_35 
ORDER BY customer_name ASC;

-- 2. Retrieve a list of orders with the oldest ones appearing first, sorted by order date in ascending order
SELECT * FROM Orders_Exp8_csa_35 
ORDER BY order_date ASC;

-- 3. Find the employees who were born after 1980 and list them in descending order of their birthdates
SELECT * FROM Employees_Exp8_csa_35 
WHERE birthdate > '1980-01-01' 
ORDER BY birthdate DESC;

-- 4. List orders placed by customers from 'USA' in descending order of the order date
SELECT o.* 
FROM Orders_Exp8_csa_35 o 
JOIN Customer_Exp8_csa_35 c ON o.customer_id = c.customer_id 
WHERE c.country = 'USA' 
ORDER BY o.order_date DESC;

-- 5. Calculate the total number of orders placed by each customer
SELECT customer_id, COUNT(*) AS total_orders 
FROM Orders_Exp8_csa_35 
GROUP BY customer_id;

-- 6. List the cities with the total number of customers
SELECT city, COUNT(*) AS total_customers 
FROM Customer_Exp8_csa_35 
GROUP BY city;

-- 7. List customers who have placed more than 2 orders
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders 
FROM Customer_Exp8_csa_35 c 
JOIN Orders_Exp8_csa_35 o ON c.customer_id = o.customer_id 
GROUP BY c.customer_id, c.customer_name 
HAVING COUNT(o.order_id) > 2;

-- 8. Display cities with more than 3 customers
SELECT city, COUNT(*) AS total_customers 
FROM Customer_Exp8_csa_35 
GROUP BY city 
HAVING COUNT(*) > 3;

-- Commit changes
COMMIT;
