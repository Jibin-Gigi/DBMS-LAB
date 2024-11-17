create table employee_data(empid int primary key, name varchar(50), deptid int, salary decimal);
insert into employee_data values(1, 'j', 1, 50000.0);
insert into employee_data values(2, 'n', 1, 40000.0);
insert into employee_data values(3, 'm', 1, 50000.0);

create table fake(empid int primary key, name varchar(50), deptid int, salary decimal);
truncate table fake;
declare cursor high_salary is select * from employee_data;
temp high_salary%rowtype;
begin
open high_salary;
loop
fetch high_salary into temp;
exit when high_salary%notfound;

if temp.salary >= 50000 then
	insert into fake values(temp.empid, temp.name,temp.deptid, temp.salary);
end if;
end loop;
close high_salary;
end;
/


select * from fake;


BEGIN
    FOR employee_record IN (
        SELECT empid, name, deptid, salary
        FROM employee_data
        WHERE salary > 50000
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || employee_record.empid ||
                             ', Name: ' || employee_record.name || ' ' || employee_record.deptid ||
                             ', Salary: ' || employee_record.salary);
    END LOOP;
END;
/

alter table employee_data rename to employees_data;
desc employee_data;

alter table employees_data rename column deptid to dept_id;
alter table employees_data rename to employee_data;

alter table employee_data drop column dept_id;
alter table employee_data add  dept_id int;

alter table employee_data modify dept_id varchar(50);
alter table employee_data drop constraints PATTERN;

alter table employee_data add constraint pattern1 check(regexp_like(dept_id, '^[A-Za-z]{3}[0-9]{3}'));
insert into employee_data(empid, name, salary, dept_id) values(5, 'p', 50000.0, 'sjc132');
select * from employee_data;
