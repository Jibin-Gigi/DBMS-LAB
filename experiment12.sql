create table bank_exp12(bankcode varchar(3) primary key, bankname varchar(50) not null, headoffice varchar(20), branches int check(branches > 0));
insert into bank_exp12 values('SBT','State Bank of Travancor','TVM',10);
insert into bank_exp12 values('SBI','State Bank of INDIA','KVLD',15);
insert into bank_exp12 values('UBI','Union Bank of India','ERNAKULAM',15);
select * from bank_exp12;

create table branch_exp_12(branchid varchar(6) primary key , branchname varchar(25) default 'NEW DELHI',bankid  varchar(8), foreign key(bankid) references bank_exp12(bankcode) on delete cascade);
insert into branch_exp_12 values(1,'KOTTAYAM','SBI');
insert into branch_exp_12 values('2','IDUKKI','UBI');
insert into branch_exp_12 values('3','KASARGODU','SBT');
insert into branch_exp_12 values('4',DEFAULT,'SBT');
select * from branch_exp_12;


delete from bank_exp12 where bankcode='SBT';
select * from bank_exp12;
select * from branch_exp_12;

alter table branch_exp_12 drop primary key;
describe branch_exp_12;

create view bank_Headoffice as select * from bank_exp12 where headoffice='ERNAKULAM';
select * from bank_Headoffice;

create view bank_branch as select * from branch_exp_12 where  Branchname='KOTTAYAM';
select * from bank_branch;

commit;
