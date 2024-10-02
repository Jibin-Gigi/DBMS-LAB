-- Create Items Table
create table items_exp9_csa_35 (
    itemid int primary key,
    itemname varchar(50) not null,
    category varchar(50),
    price decimal(10, 2),
    instock int check (instock >= 0)
);

-- Describe Items Table
describe items_exp9_csa_35;

-- Insert data into Items table
insert into items_exp9_csa_35 values (1, 'Samsung Galaxy S24', 'Electronics', 300.00, 50);
insert into items_exp9_csa_35 values (2, 'iPhone 15 Pro', 'Electronics', 800.00, 30);
insert into items_exp9_csa_35 values (3, 'MacBook Pro', 'Computers', 1400.00, 100);
insert into items_exp9_csa_35 values (4, 'Asus VivoBook', 'Computers', 980.00, 15);
insert into items_exp9_csa_35 values (5, 'Boat Headphone', 'Accessories', 6000.00, 60);
select * from items_exp9_csa_35;

-- Create Customers Table
create table customers_exp9_csa_35 (
    custid int primary key,
    custname varchar(50) not null,
    address varchar(100),
    state varchar(50)
);

-- Describe Customers Table
describe customers_exp9_csa_35;

-- Insert data into Customers table
insert into customers_exp9_csa_35 values (1, 'Susan John', '303 Spruce Street', 'Illinois');
insert into customers_exp9_csa_35 values (2, 'George Paul', '404 Elm Street', 'Nevada');
insert into customers_exp9_csa_35 values (3, 'Hannah Mathew', '505 Willow Street', 'Ohio');
insert into customers_exp9_csa_35 values (4, 'Elvin Joe', '606 Chestnut Street', 'Michigan');
insert into customers_exp9_csa_35 values (5, 'Julia George', '707 Ash Street', 'Colorado');
insert into customers_exp9_csa_35 values (6, 'Mickey', '808 Pine Street', 'California');
select * from customers_exp9_csa_35;

-- Create Orders Table
create table orders_exp9_csa_35 (
    orderid int primary key,
    itemid int,
    custid int,
    quantity int,
    orderdate date,
    foreign key (itemid) references items_exp9_csa_35 (itemid),
    foreign key (custid) references customers_exp9_csa_35 (custid)
);

-- Describe Orders Table
describe orders_exp9_csa_35;

-- Insert data into Orders table
insert into orders_exp9_csa_35 values (1, 1, 1, 1, to_date('2023-02-01', 'yyyy-mm-dd'));
insert into orders_exp9_csa_35 values (2, 2, 2, 2, to_date('2023-03-15', 'yyyy-mm-dd'));
insert into orders_exp9_csa_35 values (3, 3, 3, 1, to_date('2023-04-20', 'yyyy-mm-dd'));
insert into orders_exp9_csa_35 values (4, 4, 4, 1, to_date('2023-05-10', 'yyyy-mm-dd'));
insert into orders_exp9_csa_35 values (5, 5, 1, 3, to_date('2023-06-01', 'yyyy-mm-dd'));
insert into orders_exp9_csa_35 values (6, 1, 6, 1, to_date('2023-07-01', 'yyyy-mm-dd'));
select * from orders_exp9_csa_35;

-- Create Delivery Table
create table delivery_exp9_csa_35 (
    deliveryid int primary key,
    custid int,
    orderid int,
    foreign key (custid) references customers_exp9_csa_35 (custid),
    foreign key (orderid) references orders_exp9_csa_35 (orderid)
);

-- Describe Delivery Table
describe delivery_exp9_csa_35;

-- Insert data into Delivery table
insert into delivery_exp9_csa_35 values (1, 1, 1);
insert into delivery_exp9_csa_35 values (2, 2, 2);
insert into delivery_exp9_csa_35 values (3, 3, 3);
insert into delivery_exp9_csa_35 values (4, 4, 4);
insert into delivery_exp9_csa_35 values (5, 1, 5);
insert into delivery_exp9_csa_35 values (6, 5, 5);
insert into delivery_exp9_csa_35 values (7, 6, 6);
select * from delivery_exp9_csa_35;

-- List the details of all customers who have placed an order
select c.*
from customers_exp9_csa_35 c
join orders_exp9_csa_35 o on c.custid = o.custid;

-- List the details of all customers whose orders have been delivered
select c.*
from customers_exp9_csa_35 c
join delivery_exp9_csa_35 d on c.custid = d.custid;

-- Find the order date for all customers whose name starts with the letter ‘J’
select o.orderdate
from orders_exp9_csa_35 o
inner join customers_exp9_csa_35 c on o.custid = c.custid
where c.custname like 'J%';

-- Display the name and price of all items bought by the customer ‘Mickey’
select i.itemname, i.price
from items_exp9_csa_35 i
inner join orders_exp9_csa_35 o on i.itemid = o.itemid
inner join customers_exp9_csa_35 c on o.custid = c.custid
where c.custname = 'Mickey';

-- List the details of all customers who have placed an order after January 2013 and not received delivery of items
select c.custid, c.custname, c.address, c.state
from customers_exp9_csa_35 c
join orders_exp9_csa_35 o on c.custid = o.custid
left join delivery_exp9_csa_35 d on o.orderid = d.orderid
where o.orderdate > to_date('2013-01-01', 'yyyy-mm-dd')
and d.deliveryid is null;

-- Find the itemid of items which have either been ordered or not delivered. (Use SET UNION)
select distinct o.itemid
from orders_exp9_csa_35 o
union
select distinct o.itemid
from orders_exp9_csa_35 o
left join delivery_exp9_csa_35 d on o.orderid = d.orderid
where d.deliveryid is null;

-- Find the name of all customers who have placed an order and have their orders delivered. (Use SET INTERSECTION)
select c.custname
from customers_exp9_csa_35 c
join orders_exp9_csa_35 o on c.custid = o.custid
join delivery_exp9_csa_35 d on o.orderid = d.orderid;

-- Find the custname of all customers who have placed an order but not had their orders delivered. (Use SET MINUS)
select custname 
from customers_exp9_csa_35 c
join orders_exp9_csa_35 o on c.custid = o.custid
minus
select custname 
from customers_exp9_csa_35 c
join orders_exp9_csa_35 o on c.custid = o.custid
join delivery_exp9_csa_35 d on o.orderid = d.orderid;

-- Find the name of the customer who has placed the most number of orders
select c.custname
from customers_exp9_csa_35 c
join orders_exp9_csa_35 o on c.custid = o.custid
group by c.custname
order by count(o.orderid) desc
fetch first 1 row only;

-- Find the details of all customers who have purchased items exceeding a price of 5000$
select distinct c.*
from customers_exp9_csa_35 c
join orders_exp9_csa_35 o on c.custid = o.custid
join items_exp9_csa_35 i on o.itemid = i.itemid
where i.price > 5000;

-- Find the name and address of customers who have not ordered a ‘Samsung Galaxy S24’
select distinct c.custname, c.address
from customers_exp9_csa_35 c
left join orders_exp9_csa_35 o on c.custid = o.custid
left join items_exp9_csa_35 i on o.itemid = i.itemid and i.itemname = 'Samsung Galaxy S24'
where i.itemid is null;

-- Perform Left Outer Join on Customers & Orders Table
select distinct c.custid, c.custname, c.address, c.state, o.orderid, o.itemid, o.quantity, o.orderdate
from customers_exp9_csa_35 c
left join orders_exp9_csa_35 o on c.custid = o.custid;

-- Perform Right Outer Join on Customers & Orders Table
select c.custid, c.custname, c.address, c.state, o.orderid, o.itemid, o.quantity, o.orderdate
from customers_exp9_csa_35 c
right join orders_exp9_csa_35 o on c.custid = o.custid;

-- Group customers by state
select c.state, count(*) as customer_count
from customers_exp9_csa_35 c
group by c.state;

-- Display the details of all items grouped by category and having a price greater than the average price of all items
select category, itemname, price
from items_exp9_csa_35
where price > (select avg(price) from items_exp9_csa_35)
group by category, itemname, price;

commit;
