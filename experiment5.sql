create table employee_exp5_csa_35(Emp_id int primary key, Emp_name varchar(20), Dept varchar(20), Salary float);

insert into employee_exp5_csa_35 values(1, 'David Smith', 'HR', 5000.00);
insert into employee_exp5_csa_35 values(2, 'Doney Siby', 'HR', 5000.00);
insert into employee_exp5_csa_35 values(3, 'Charles Brown', 'Sales', 6000.00);
insert into employee_exp5_csa_35 values(4, 'Allen Nolan', 'Production', 9000.00);
insert into employee_exp5_csa_35 values(5, 'Olivia', 'Marketing', 7500.00);
select * from employee_exp5_csa_35;

select * from employee_exp5_csa_35 where salary > 7000;
update employee_exp5_csa_35 set salary = 8200.00 where Emp_name = 'David Smith';
select * from employee_exp5_csa_35 where emp_name = 'David Smith';
insert into employee_exp5_csa_35 values(6, 'Daniel Harris', 'Production', 6700.00);
select * from employee_exp5_csa_35;
delete from employee_exp5_csa_35 where Emp_id = 3; 
select * from employee_exp5_csa_35;
select * from employee_exp5_csa_35 where Emp_name not like 'D%' and Emp_name not like 'O%';
select Dept,sum(salary) as Total_Salary_Expense from employee_exp5_csa_35 group by Dept;
update employee_exp5_csa_35 set Salary = Salary * 1.05 where Dept = 'Production';
select * from employee_exp5_csa_35;
delete from employee_exp5_csa_35 where Salary < 7000;
select * from employee_exp5_csa_35;
select Emp_name, Salary from employee_exp5_csa_35 where Salary = (select min(salary) from employee_exp5_csa_35);
update employee_exp5_csa_35 set Salary = 8200.00 where Dept = 'Marketing';
select * from employee_exp5_csa_35;
select Emp_name from employee_exp5_csa_35 where Emp_name like 'A%';
select Emp_name from employee_exp5_csa_35 where Emp_name like '%it%';
select distinct(upper(dept)) from employee_exp5_csa_35;
select * from employee_exp5_csa_35 where Dept like 'M_r%' and Dept like '%ket%';
select distinct reverse((upper(dept))) from employee_exp5_csa_35;

commit;
