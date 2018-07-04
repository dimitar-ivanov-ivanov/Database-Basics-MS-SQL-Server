create proc  usp_GetEmployeesSalaryAboveNumber (@minSalary money) as
select FirstName,LastName from Employees
where Salary >= @minSalary
--exec usp_GetEmployeesSalaryAboveNumber 48100;