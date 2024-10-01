create table items_exp09_csa_35 (
    itemid int primary key,
    itemname varchar(50) not null,
    category varchar(50),
    price decimal(10, 2),
    instock int check (instock >= 0)
);

insert into items_exp09_csa_35 values (1, 'samsung galaxys24', 'electronics', 300.00, 50);
insert into items_exp09_csa_35 values (2, 'iphone 15 pro', 'electronics', 800.00, 30);
insert into items_exp09_csa_35 values (3, 'macbook pro', 'computers', 1400.00, 100);
insert into items_exp09_csa_35 values (4, 'asus vivobook', 'computers', 980.00, 15);
insert into items_exp09_csa_35 values (5, 'boat headphone', 'accessories', 6000.00, 60);
select * from items_exp09_csa_35;

create table customers_exp09_csa_35 (
    custid int primary key,
    custname varchar(50) not null,
    address varchar(100),
    state varchar(50)
);

insert into customers_exp09_csa_35 values (1, 'susan john', '303 spruce street', 'illinois');
insert into customers_exp09_csa_35 values (2, 'george paul', '404 elm street', 'nevada');
insert into customers_exp09_csa_35 values (3, 'hannah mathew', '505 willow street', 'ohio');
insert into customers_exp09_csa_35 values (4, 'elvin joe', '606 chestnut street', 'michigan');
insert into customers_exp09_csa_35 values (5, 'julia george', '707 ash street', 'colorado');
insert into customers_exp09_csa_35 values (6, 'mickey', '808 pine street', 'california');
select * from customers_exp09_csa_35;

create table orders_exp09_csa_35 (
    orderid int primary key,
    itemid int,
    custid int,
    quantity int,
    orderdate date,
    foreign key (itemid) references items_exp09_csa_35 (itemid),
    foreign key (custid) references customers_exp09_csa_35 (custid)
);

insert into orders_exp09_csa_35 values (1, 1, 1, 1, to_date('2023-02-01', 'yyyy-mm-dd'));
insert into orders_exp09_csa_35 values (2, 2, 2, 2, to_date('2023-03-15', 'yyyy-mm-dd'));
insert into orders_exp09_csa_35 values (3, 3, 3, 1, to_date('2023-04-20', 'yyyy-mm-dd'));
insert into orders_exp09_csa_35 values (4, 4, 4, 1, to_date('2023-05-10', 'yyyy-mm-dd'));
insert into orders_exp09_csa_35 values (5, 5, 1, 3, to_date('2023-06-01', 'yyyy-mm-dd'));
insert into orders_exp09_csa_35 values (6, 1, 6, 1, to_date('2023-07-01', 'yyyy-mm-dd'));
select * from orders_exp09_csa_35;

create table delivery_exp09_csa_35 (
    deliveryid int primary key,
    custid int,
    orderid int,
    foreign key (custid) references customers_exp09_csa_35 (custid),
    foreign key (orderid) references orders_exp09_csa_35 (orderid)
);

insert into delivery_exp09_csa_35 values (1, 1, 1);
insert into delivery_exp09_csa_35 values (2, 2, 2);
insert into delivery_exp09_csa_35 values (3, 3, 3);
insert into delivery_exp09_csa_35 values (4, 4, 4);
insert into delivery_exp09_csa_35 values (5, 1, 5);
insert into delivery_exp09_csa_35 values (6, 5, 5);
insert into delivery_exp09_csa_35 values (7, 6, 6);
select * from delivery_exp09_csa_35;

select c.*
from customers_exp09_csa_35 c
join orders_exp09_csa_35 o on c.custid = o.custid;

select c.*
from customers_exp09_csa_35 c
join delivery_exp09_csa_35 d on c.custid = d.custid;

select o.orderdate
from orders_exp09_csa_35 o
inner join customers_exp09_csa_35 c on o.custid = c.custid
where c.custname like 'j%';

select i.itemname, i.price
from items_exp09_csa_35 i
inner join orders_exp09_csa_35 o on i.itemid = o.itemid
inner join customers_exp09_csa_35 c on o.custid = c.custid
where c.custname = 'mickey';

select c.custid, c.custname, c.address, c.state
from customers_exp09_csa_35 c
join orders_exp09_csa_35 o on c.custid = o.custid
left join delivery_exp09_csa_35 d on o.orderid = d.orderid
where o.orderdate > to_date('2013-01-01', 'yyyy-mm-dd')
and d.deliveryid is null;

select distinct o.itemid
from orders_exp09_csa_35 o
union
select distinct o.itemid
from orders_exp09_csa_35 o
left join delivery_exp09_csa_35 d on o.orderid = d.orderid
where d.deliveryid is null;

select c.custname
from customers_exp09_csa_35 c
join orders_exp09_csa_35 o on c.custid = o.custid
join delivery_exp09_csa_35 d on o.orderid = d.orderid;

select c.custname
from customers_exp09_csa_35 c
join orders_exp09_csa_35 o on c.custid = o.custid
select custname from customers_exp09_csa_35 c
join orders_exp09_csa_35 o on c.custid = o.custid
minus
select custname from customers_exp09_csa_35 c
join orders_exp09_csa_35 o on c.custid = o.custid
join delivery_exp09_csa_35 d on o.orderid = d.orderid;

select c.custname
from customers_exp09_csa_35 c
join orders_exp09_csa_35 o on c.custid = o.custid
group by c.custname
order by count(o.orderid) desc
fetch first 1 row only;

select distinct c.*
from customers_exp09_csa_35 c
join orders_exp09_csa_35 o on c.custid = o.custid
join items_exp09_csa_35 i on o.itemid = i.itemid
where i.price > 5000;

select distinct c.custname, c.address
from customers_exp09_csa_35 c
left join orders_exp09_csa_35 o on c.custid = o.custid
left join items_exp09_csa_35 i on o.itemid = i.itemid and i.itemname = 'samsung galaxys24'
where i.itemid is null;

select distinct c.custid, c.custname, c.address, c.state, o.orderid, o.itemid, o.quantity, o.orderdate
from customers_exp09_csa_35 c
left join orders_exp09_csa_35 o on c.custid = o.custid;

select c.custid, c.custname, c.address, c.state, o.orderid, o.itemid, o.quantity, o.orderdate
from customers_exp09_csa_35 c
right join orders_exp09_csa_35 o on c.custid = o.custid;

commit;
