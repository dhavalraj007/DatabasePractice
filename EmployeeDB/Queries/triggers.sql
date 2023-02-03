use payroll_service;
create table employee_Audit(
id int Identity,
auditData text
);

--insert
alter trigger InsertEmployeeAuditTrigger
on Employee
for Insert
as
begin
	declare @id int;
	select @id = id from inserted;
	insert into employee_Audit(auditData) values ('Added employee with id' + (CAST(@id as varchar(10)) + ' at '+ CAST(GETDATE() as varchar(30)) ));
end;

select * from employee_Audit;
insert into employee(name,salary,startDate) values('Manish',20021,'2020-01-08');

--update
create trigger UpdateEmployeeAuditTrigger
on Employee
for update
as
begin
	declare @id int;
	select @id = id from inserted;
	insert into employee_Audit(auditData) values ('updated employee with id' + (CAST(@id as varchar(10)) + ' at '+ CAST(GETDATE() as varchar(30)) ));
end;

select* from employee;
update employee set gender='M' where id=18;
select * from employee_Audit;

--delete
alter trigger DeletedEmployeeAuditTrigger
on Employee
for delete
as
begin
	declare @id int;
	select @id = id from deleted;
	insert into employee_Audit(auditData) values ('deleted employee with id' + (CAST(@id as varchar(10)) + ' at '+ CAST(GETDATE() as varchar(30)) ));
end;

delete from employee where id=18;
select * from employee_Audit;
