set serveroutput on;
show serveroutput;

create or replace function factorial(n int)
return int as fact INT;
begin
fact:=1;
for i IN 1..n loop
fact:=fact * i;
end loop;
return fact;
end;
/

DECLARE
c integer;
result integer;
begin
c:=&c;
result:=factorial(c);
dbms_output.put_line('The factorial is '||result);
end;
/


CREATE OR REPLACE FUNCTION totalCustomers
RETURN number IS
   total number(2) := 0;
BEGIN
   SELECT count(*) into total
   FROM customers_exp9_csa_35;
   RETURN total;
END;
/

DECLARE 
   c number(2); 
BEGIN 
   c := totalCustomers(); 
   dbms_output.put_line('Total no. of Customers: ' || c); 
END; 
/

select * from customers_exp9_csa_35;
