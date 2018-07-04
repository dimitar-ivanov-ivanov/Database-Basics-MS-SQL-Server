CREATE PROC usp_DeleteEmployeesFromDepartment (@departmentId int) AS
BEGIN

DELETE FROM EmployeesProjects
WHERE EmployeeID IN (
  SELECT e.EmployeeID FROM Employees AS e 
    WHERE e.DepartmentID = @departmentId
)

ALTER TABLE Departments
ALTER COLUMN ManagerID int NULL

UPDATE Departments
SET ManagerID = NULL
WHERE DepartmentID = @departmentId

UPDATE Employees
SET ManagerID = NULL
WHERE DepartmentID  = @departmentId

--ALTER TABLE Departments
--DROP COLUMN ManagerID

--ALTER TABLE Employees
--DROP COLUMN ManagerID

DELETE FROM Employees
WHERE DepartmentID = @departmentId

DELETE FROM Departments
WHERE DepartmentID = @departmentId
END

