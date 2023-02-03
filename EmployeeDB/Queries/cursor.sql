
declare @id int;
declare @name varchar(50);
declare @salary float;
declare @startDate date;
declare @gender char(1);

declare employeeCursor cursor
for select * from employee;

open employeeCursor;
fetch next from employeeCursor into @id,@name,@salary,@startDate,@gender;
while @@FETCH_STATUS=0
begin
	print 'id: '+cast(@id as varchar(20)) + ' salary: '+cast(@salary as varchar(20)) + ' startDate: '+cast(@startDate as varchar(20)) + ' gender: '+cast(@gender as varchar(20))
	fetch next from employeeCursor into @id,@name,@salary,@startDate,@gender;
end;
close employeeCursor;
deallocate employeeCursor;


--dynamic cursor


-- increase salary to 100.99 of every even Id employee 
select * from employee;
declare @id int;
declare @name varchar(50);
declare @salary float;
declare @startDate date;
declare @gender char(1);

declare employeeCursor cursor
dynamic for select * from employee;

open employeeCursor;
fetch next from employeeCursor into @id,@name,@salary,@startDate,@gender;
while @@FETCH_STATUS=0
begin
	if @id%2=0
	begin 
	update employee set salary = @salary + 100.99 where current of employeeCursor;
	print 'id: '+cast(@id as varchar(20)) + ' salary: '+cast(@salary as varchar(20)) + ' startDate: '+cast(@startDate as varchar(20)) + ' gender: '+cast(@gender as varchar(20))
	end
	fetch next from employeeCursor into @id,@name,@salary,@startDate,@gender;
end;
close employeeCursor;
deallocate employeeCursor;