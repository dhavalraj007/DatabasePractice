--uc3
insert into employee(name,salary,startDate) values('John',10000,GETDATE());
insert into employee(name,salary,startDate) values('James',20000,'2022-08-08');
insert into employee(name,salary,startDate) values('Kate',20000,'2019-04-08');
--uc4
select * from employee;
--uc5
select * from employee where employee.name='John';
select Name,salary 
	from employee 
		where employee.startDate between cast('2022-07-07' as date) and GETDATE();
--uc6
alter table employee add gender char(1);
update employee set gender='M' where id=1 or id=2;
update employee set gender='F' where id=3;

--
insert into employee(name,salary,startDate,gender) values('MrBeast',999999,'2019-04-08','M');
insert into employee(name,salary,startDate,gender) values('Messi',50000,'2021-02-01','M');
--

--uc7
select sum(salary) as totalSalary from employee;
select avg(salary) as AverageSalary from employee;
select max(salary) as MaxSalary from employee;
select min(salary) as minSalary from employee;
select count(id) as numberOfEmployee from employee;
select count(gender) as numberOfMales from employee where gender='M';
select count(gender) as numberOfFemales from employee where gender='F';

