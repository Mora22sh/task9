create table Employees (
	EmployeeID int primary key,
	FirstName varchar(50),
	LastName varchar(50),
	Salary decimal(18, 2)
);
-- Create a stored procedure named GetAllEmployees that selects all rows from Employees.
create procedure spGetAllEmployees
as 
begin
	select *
	from Employees
	end;



-- Create a stored procedure GetHighSalaryEmployees with one input parameter @MinSalary which Select all employees with Salary > @MinSalary

create procedure spGetEmployeesBySalary
	@MinSalary decimal(18, 2)
	as 
	begin
	select *
	from Employees
	where Salary >= @MinSalary
	end;

	-- Create AddEmployee SP with @FirstName, @LastName, @Salary which Insert a new row into Employees. 
	create procedure spAddEmployee
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Salary DECIMAL(18,2)
AS
BEGIN
    insert into  Employees (FirstName, LastName, Salary)
    values (@FirstName, @LastName, @Salary);
END;
 
 
 
 --part2 

 create table EmployeeLog
 (
 id int primary key ,
 EmployeeID int,
 Action varchar(50),
ActionDate datetime
);
 

 CREATE TRIGGER AFTER_INSERT
 ON TABLE Employees
 AFTER INSERT 
 AS
BEGIN
	INSERT INTO EmployeeLog (EmployeeID, Action, ActionDate)
	SELECT ID, 'EMployee added', GETDATE()
	FROM inserted;
END;