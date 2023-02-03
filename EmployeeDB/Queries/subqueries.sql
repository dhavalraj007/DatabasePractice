

select max(salary) from employee;
--find max salary employee
select * from employee where salary = (select max(salary) from employee);

-- find top 2 max salary employees
select * from employee where salary in  (select Top(2) salary from employee order by salary desc);


create table maleEmployeeTable
(
id int Identity(1,1),
name varchar(20),
salary float,
startDate date
);

select * from maleEmployeeTable;

insert into maleEmployeeTable
select name,salary,startDate from employee where gender='M';


