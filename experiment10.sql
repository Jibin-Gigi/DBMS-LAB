CREATE TABLE Bank ( BankID NUMBER(3) PRIMARY KEY, bankname VARCHAR(100), headoffice VARCHAR(100), branch VARCHAR(100), branchcode NUMBER(5) );
INSERT INTO Bank VALUES (1, 'State Bank of India', 'Mumbai', 'Alappuzha', 101);
INSERT INTO Bank VALUES (2, 'HDFC Bank', 'Trivandrum', 'Kottayam', 102);
INSERT INTO Bank VALUES (3, 'ICICI Bank', 'Mumbai', 'Ernakulam', 103);
select * from Bank;
commit;
savepoint A;
delete from Bank where BankId=2;
select * from Bank;

rollback to savepoint A;
select * from Bank;


INSERT INTO Bank VALUES(4, 'UNION BANK OF INDIA', 'Kochi', 'Kalamassery', 104);
select * from Bank;
savepoint B;

delete from Bank where BankId=3;
select * from Bank;

rollback to savepoint B;
select * from Bank;

rollback;
select * from Bank;
