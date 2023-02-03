
-- scaler valued functions

create function eastOrWest
(@direction decimal(9,6))
returns char(4) 
as
begin
	declare @ret char(4);
	set @ret = 'same';
	if(@direction>0.0) set @ret = 'east';
	if(@direction<0.0) set @ret = 'west';
	return @ret;
end;

select dbo.eastOrWest(1);

create function grossFunction(@id int)
returns money
as
begin
	declare @basic money,@hra money,@da money,@pf money,@gross money;
	select @basic=salary from employee where id=@id
	set @hra = @basic*0.1;
	set @da = @basic*0.2;
	set @pf = @basic*0.1;
	set @gross = @basic+@hra+@da+@pf;
	return @gross;
end;

select dbo.grossFunction(1);

-- table valued functions

create function getEmployeeById(@id int)
returns table
as
	return (select * from employee where id=@id);

select * from getEmployeeById(1)
