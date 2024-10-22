set serveroutput on;
show serveroutput;

create or replace package pk1 as 
procedure proc1(a int, b int);
procedure proc2(a int);
function fn11(a int) return varchar;
function fn22(a int, b int, c int) return int;
end pk1;

create or replace package body pk1 as 
procedure proc1(a int, b int) is 
begin
dbms_output.put_line('Sum: ' ||(a+b) );
dbms_output.put_line('Average: ' ||(a+b)/2 );
dbms_output.put_line('Product: ' ||(a*b) );
end proc1;

procedure proc2(a int) is
begin
dbms_output.put_line('Square root : '||sqrt(a));
end proc2;

function fn11(a int) return varchar is
begin
if(mod(a, 2) =0) then
return 'Even';
else 
return 'Odd';
end if;
end fn11;

function fn22(a int, b int, c int) return int is
begin
return (a+b+c);
end fn22;

end pk1;

declare
p int;
q int;
s int;
even_odd int;
sum_of_three_numbers int;
result varchar2(4);

begin
p:=&p;
q:=&q;
pk1.proc1(p,q);

s:=&s;
pk1.proc2(s);

even_odd:=&even_odd;
result := pk1.fn11(even_odd);
dbms_output.put_line('The number is '||result);

p:=&p;
q:=&q;
s:=&s;
sum_of_three_numbers:=pk1.fn22(p, q, s);
dbms_output.put_line('Sum of three numbers is: '||sum_of_three_numbers);

end;
