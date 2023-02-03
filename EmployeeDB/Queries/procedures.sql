
create procedure getEmployee
As
Begin
select * from employee;
End;

execute getEmployee;

create procedure addEmployee(
@name varchar(50),
@salary float,
@startDate date,
@gender char(1)
)
as 
Begin
	begin try
	insert into employee(name,salary,startDate,gender) values(@name,@salary,@startDate,@gender);
	end try 
	begin catch
		Select ERROR_LINE() as errorline,
				ERROR_MESSAGE() as errorMessage;
	end catch
End;

exec addEmployee 'Stefeny',2000,'2022-02-23','F';
exec getEmployee;
delete from employee where id=11

exec addEmployee null,202023,'2021-02-21','M';


create procedure updateEmployee(
@id int,
@name varchar(50),
@salary float,
@startDate date,
@gender char(1)
)
as 
Begin
update employee set name=@name,salary=@salary,startDate=@startDate,gender=@gender where id = @id;
End;

exec getEmployee;

exec updateEmployee 10,'Steffeny',200000,'1999-02-02','F';

create procedure deleteEmployee(
@id int
)
as 
Begin
delete from employee where id=@id;
End;

exec deleteEmployee 10

create procedure divide(
@a decimal,
@b decimal,
@c decimal output
)
as
begin
	begin try
		set @c = @a/@b
	end try
	begin catch
		Select ERROR_LINE() as errorline,
				ERROR_MESSAGE() as errorMessage;
	end catch
end;

declare @result decimal;
exec divide 10,2,@result output;
print @result;

declare @result decimal;
exec divide 10,0,@result output;
print @result;


alter procedure addOrUpdateEmployee(
@id int,
@name varchar(50),
@salary float,
@startDate date,
@gender char(1),
@choice varchar(10)
)
as 
Begin
	if @choice='add'
	begin
	insert into employee (name,salary,startDate,gender) values(@name,@salary,@startDate,@gender);
	end
	else
	begin
	update employee set name=@name,salary=@salary,startDate=@startDate,gender=@gender where id = @id;
	end
End;

exec addOrUpdateEmployee 12,'shiv',100000,'1000-12-12','M','add';
exec addOrUpdateEmployee 12,'shambhu',100000,'1000-12-12','M','update';

exec getEmployee;
