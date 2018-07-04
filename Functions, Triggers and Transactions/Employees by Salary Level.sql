create proc usp_EmployeesBySalaryLevel(@levelSalary varchar(max)) as 
select FirstName,LastName from Employees
where dbo.ufn_GetSalaryLevel(Salary) =  @levelSalary