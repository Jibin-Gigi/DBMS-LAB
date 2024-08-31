select ceil(35.9) from dual;
select ceil(-35.9) from dual;
select ceil(35/3) from dual;
select floor(35.76) from dual;
select floor(-35.3) from dual;
select floor(35/4) from dual;
select sqrt(625) from dual;
select sqrt(2) from dual;
select abs(35.29) from dual;
select abs(-35.14) from dual;
select abs(-35) from dual;
select sysdate as NOW from dual;
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') as Format1, to_char(sysdate, 'DD-MM-YY HH12:MI:SS') as Format2 from dual;
select systimestamp from dual;
select least('Jeswin', 'Kutty', 'Laya') from dual;
select greatest('Jeswin', 'Kutty', 'Laya') from dual;
select ltrim('  Trim me') from dual;
select rtrim('I love India       ') from dual;
select rpad('Jibin', 15, 'X') from dual;
select lpad(123, 6, 0) from dual;
select reverse('uoy evol I') from dual;
select reverse('uoy evol I') from dual;
select  
    case 
        when 'racecar' = reverse('racecar') then 'Palindrome'
        else 'Not Palindrome'
    end as Result
from dual;
select length('Oracle Database') from dual;
select 'Oracle' || ' SQL ' || 'is ' || 'powerful ' || 'and ' || 'flexible' as concatenated_string
from dual;
select concat('Jibin ','Gigi') as Full_Name from dual;
select substr('India is my country', 7, 2) from dual;
select substr('Jibin', 2, 3) from dual;
select substr('Substring', 1, 3) from dual;

commit;
