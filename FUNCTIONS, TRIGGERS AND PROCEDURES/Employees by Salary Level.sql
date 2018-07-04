CREATE PROC  usp_EmployeesBySalaryLevel(@LevelSalary varchar(20))
AS
 SELECT FirstName,LastName FROM  Employees
 WHERE @LevelSalary = dbo.ufn_GetSalaryLevel(Salary)

--EXEC dbo.usp_EmployeesBySalaryLevel 'High';