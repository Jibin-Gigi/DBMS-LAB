

CREATE TABLE Items_Exp09_CSA_35  (
itemid INT PRIMARY KEY,
Itemname VARCHAR(50) NOT NULL,
category VARCHAR(50),
Price DECIMAL(10, 2),
Instock INT CHECK (Instock >= 0)
);


Insert into Items_Exp09_CSA_35  values (1, 'Samsung GalaxyS24', 'Electronics', 300.00, 
50);
Insert into Items_Exp09_CSA_35  values (2, 'Iphone 15 pro', 'Electronics', 800.00, 30);
Insert into Items_Exp09_CSA_35  values (3, 'MacBook Pro', 'Computers', 1400.00, 100);
Insert into Items_Exp09_CSA_35  values (4, 'Asus Vivobook', 'Computers', 
980.00, 15);
Insert into Items_Exp09_CSA_35  values (5, 'Boat Headphone ', 'Accessories', 6000.00, 
60);



CREATE TABLE Customers_Exp09_CSA_35  (
custid INT PRIMARY KEY,
Custname VARCHAR(50) NOT NULL,
Address VARCHAR(100),
state VARCHAR(50)
);



INSERT INTO Customers_Exp09_CSA_35  VALUES (1, 'Susan John', '303 Spruce Street', 'Illinois');
INSERT INTO Customers_Exp09_CSA_35  VALUES (2, 'George Paul', '404 Elm Street', 
'Nevada');
INSERT INTO Customers_Exp09_CSA_35  VALUES (3, 'Hannah Mathew', '505 Willow Street', 
'Ohio');
INSERT INTO Customers_Exp09_CSA_35  VALUES (4, 'Elvin Joe', '606 
Chestnut Street', 'Michigan');
INSERT INTO Customers_Exp09_CSA_35  VALUES (5, 'Julia George', '707 Ash Street', 
'Colorado');


CREATE TABLE Orders_Exp09_CSA_35  (
orderid INT PRIMARY KEY,
Itemid INT,
Custid INT,
Quantity INT ,
Orderdate DATE,
FOREIGN KEY (Itemid) REFERENCES Items_Exp09_CSA_35 (itemid),
FOREIGN KEY (Custid) REFERENCES Customers_Exp09_CSA_35 (custid)
);


INSERT INTO Orders_Exp09_CSA_35 
VALUES (1, 1, 1, 1, TO_DATE('2023-02-01', 'YYYY-MM-DD'));
INSERT INTO Orders_Exp09_CSA_35 
VALUES (2, 2, 2, 2, TO_DATE('2023-03-15', 'YYYY-MM-DD'));
INSERT INTO Orders_Exp09_CSA_35 
VALUES (3, 3, 3, 1, TO_DATE('2023-04-20', 'YYYY-MM-DD'));
INSERT INTO Orders_Exp09_CSA_35 
VALUES (4, 4, 4, 1, TO_DATE('2023-05-10', 'YYYY-MM-DD'));
INSERT INTO Orders_Exp09_CSA_35 
VALUES (5, 5, 1, 3, TO_DATE('2023-06-01', 'YYYY-MM-DD'));



CREATE TABLE Delivery_Exp09_CSA_35  (
deliveryid INT PRIMARY KEY,
Custid INT,
Orderid INT,
FOREIGN KEY (Custid) REFERENCES Customers_Exp09_CSA_35 (custid),
FOREIGN KEY (Orderid) REFERENCES Orders_Exp09_CSA_35 (orderid)
);



INSERT INTO Delivery_Exp09_CSA_35 
VALUES (1, 1, 1);
INSERT INTO Delivery_Exp09_CSA_35 
VALUES (2, 2, 2);
INSERT INTO Delivery_Exp09_CSA_35 
VALUES (3, 3, 3);
INSERT INTO Delivery_Exp09_CSA_35 
VALUES (4, 4, 4); 
INSERT INTO Delivery_Exp09_CSA_35 
VALUES (5, 1, 5);
INSERT INTO Delivery_Exp09_CSA_35 
VALUES (6, 5, 5);


SELECT c.*
FROM Customers_Exp09_CSA_35  c
JOIN Orders_Exp09_CSA_35  o ON c.custid = o.Custid;

SELECT c.*
FROM Customers_Exp09_CSA_35  c
JOIN Delivery_Exp09_CSA_35  d ON c.custid = d.Custid;

SELECT o.Orderdate
FROM Orders_Exp09_CSA_35  o
INNER JOIN Customers_Exp09_CSA_35  c ON o.Custid = c.custid
WHERE c.Custname LIKE 'S%';

SELECT i.Itemname, i.Price
FROM Items_Exp09_CSA_35  i
INNER JOIN Orders_Exp09_CSA_35  o ON i.itemid = o.Itemid
INNER JOIN Customers_Exp09_CSA_35  c ON o.Custid = c.custid
WHERE c.Custname = 'Elvin Joe';

SELECT DISTINCT c.custname
FROM Customers_Exp09_CSA_35  c
JOIN Orders_Exp09_CSA_35  o ON c.custid = o.custid
JOIN Delivery_Exp09_CSA_35  d ON o.orderid = d.orderid
INTERSECT
SELECT DISTINCT c.custname
FROM Customers_Exp09_CSA_35  c
JOIN Orders_Exp09_CSA_35  o ON c.custid = o.custid;

SELECT c.Custid, c.Custname, c.Address, c.state
FROM Customers_Exp09_CSA_35  c
JOIN Orders_Exp09_CSA_35  o ON c.Custid = o.Custid
LEFT JOIN Delivery_Exp09_CSA_35  d ON o.Orderid = d.Orderid
WHERE o.Orderdate > TO_DATE('2013-01-01', 'YYYY-MM-DD')
AND d.Deliveryid IS NULL;


SELECT DISTINCT o.Itemid
FROM Orders_Exp09_CSA_35  o
UNION
SELECT DISTINCT o.Itemid
FROM Orders_Exp09_CSA_35  o
LEFT JOIN Delivery_Exp09_CSA_35  d ON o.Orderid = d.Orderid
WHERE d.Deliveryid IS NULL;


SELECT c.custname
FROM Customers_Exp09_CSA_35  c
LEFT JOIN Orders_Exp09_CSA_35  o ON c.custid = o.custid
LEFT JOIN Delivery_Exp09_CSA_35  d ON o.orderid = d.orderid
WHERE d.deliveryid IS NULL
GROUP BY c.custname;


SELECT c.custname
FROM Customers_Exp09_CSA_35  c
JOIN Orders_Exp09_CSA_35  o ON c.custid = o.custid
GROUP BY c.custname
ORDER BY COUNT(o.orderid) DESC
FETCH FIRST 1 ROW ONLY;

SELECT DISTINCT c.*
FROM Customers_Exp09_CSA_35  c
JOIN Orders_Exp09_CSA_35  o ON c.custid = o.custid
JOIN Items_Exp09_CSA_35  i ON o.itemid = i.itemid
WHERE i.price > 5000;

SELECT DISTINCT c.custname, c.address
FROM Customers_Exp09_CSA_35  c
LEFT JOIN Orders_Exp09_CSA_35  o ON c.custid = o.custid
LEFT JOIN Items_Exp09_CSA_35  i ON o.itemid = i.itemid AND i.itemname = 
'Samsung Galaxy S24'
WHERE i.itemid IS NULL;

SELECT DISTINCT c.Custid, c.Custname, c.Address, c.state, o.Orderid, o.Itemid, 
o.Quantity, o.Orderdate
FROM Customers_Exp09_CSA_35  c
LEFT JOIN Orders_Exp09_CSA_35  o ON c.Custid = o.Custid;

SELECT c.Custid, c.Custname, c.Address, c.state, o.Orderid, o.Itemid, 
o.Quantity, o.Orderdate
FROM Customers_Exp09_CSA_35  c
RIGHT JOIN Orders_Exp09_CSA_35  o ON c.Custid = o.Custid;
