create table Customer_Exp8_csa_35(customer_id int primary key, customer_name varchar(25), contact_no int, address varchar(50), city varchar(20), postal_code int, country varchar(20) );
insert into Customer_Exp8_csa_35 values(1, 'Kutty', 1111111111, 'Address1', 'Kuttanadu', 111111, 'India');
insert into Customer_Exp8_csa_35 values (2, 'Sabu', 2111111112, 'Address2', 'Swodhesam', 211112, 'USA');
insert into Customer_Exp8_csa_35 values (3, 'Kevin', 3111111113, 'Address3', 'Kuttanadu', 311113, 'India');
insert into Customer_Exp8_csa_35 values (4, 'Jose', 4111111114, 'Address4', 'Swodhesam', 411114, 'USA');
insert into Customer_Exp8_csa_35 values (5, 'Jismi', 5111111115, 'Address5', 'Kottayam', 511115, 'India');
select * from Customer_Exp8_csa_35;

create table Employees_Exp8_csa_35(employee_id int primary key, first_name varchar(20), last_name varchar(20), birthdate date, photo blob );
insert into Employees_Exp8_csa_35 values (1, 'Jeswin', 'Jose', '02-02-2004', NULL);
insert into Employees_Exp8_csa_35 values (2, 'Peter', 'Parker', '05-05-2004', NULL);
insert into Employees_Exp8_csa_35 values (3, 'Mary', 'Jane', '02-06-2004', NULL);
insert into Employees_Exp8_csa_35 values (4, 'Harry', 'Potter', '02-09-2004', NULL);
insert into Employees_Exp8_csa_35 values (5, 'Howard', 'Stark', '15-02-1954', NULL);
select * from Employees_Exp8_csa_35;

create table Orders_Exp8_csa_35(order_id int primary key, customer_id int, employee_id int, order_date date, shipper_id int, foreign key (customer_id) references Customer_Exp8_csa_35(customer_id), foreign key(employee_id) references Employees_Exp8_csa_35(employee_id));
insert into Orders_Exp8_csa_35 values(1, 1, 1, '08-08-2024', 1);
insert into Orders_Exp8_csa_35 values(2, 2, 2, '09-08-2024', 2);
insert into Orders_Exp8_csa_35 values(3, 2, 2, '09-08-2024', 3);
insert into Orders_Exp8_csa_35 values(4, 3, 3, '18-08-2024', 4);
insert into Orders_Exp8_csa_35 values(5, 4, 4, '28-08-2024', 5);
insert into Orders_Exp8_csa_35 values(6, 5, 5, '29-08-2024', 6);
select * from Orders_Exp8_csa_35;




SELECT * FROM Customer_Exp8_csa_35 ORDER BY customer_name ASC;


SELECT * FROM Orders_Exp8_csa_35 ORDER BY order_date ASC;


SELECT * FROM Employees_Exp8_csa_35 WHERE birthdate > '01-01-1980' ORDER BY birthdate DESC;


SELECT o.* FROM Orders_Exp8_csa_35 o JOIN Customer_Exp8_csa_35 c ON o.customer_id = c.customer_id WHERE c.country = 'USA' ORDER BY o.order_date DESC;


SELECT customer_id, COUNT(*) AS total_orders FROM Orders_Exp8_csa_35 GROUP BY customer_id;


SELECT city, COUNT(*) AS total_customers FROM Customer_Exp8_csa_35 GROUP BY city;

insert into Orders_Exp8_csa_35 values(7, 2, 2, '09-09-2024', 7);
select * from Orders_Exp8_csa_35;
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders FROM Customer_Exp8_csa_35 c JOIN Orders_Exp8_csa_35 o ON c.customer_id = o.customer_id GROUP BY c.customer_id, c.customer_name HAVING COUNT(o.order_id) > 2;


insert into Customer_Exp8_csa_35 values (6, 'Raj', 6111111116, 'Address3', 'Kuttanadu', 611116, 'India');
insert into Customer_Exp8_csa_35 values (7, 'Manikam', 7111111117, 'Address7', 'Kuttanadu', 711117, 'India');
select * from Customer_Exp8_csa_35;
SELECT city, COUNT(*) AS total_customers FROM Customer_Exp8_csa_35 GROUP BY city HAVING COUNT(*) > 3;
commit;
