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
