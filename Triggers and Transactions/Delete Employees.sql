--CREATE TABLE Deleted_Employees(
--  EmployeeID int NOT NULL,
--  FirstName VARCHAR(50) NOT NULL,
--  LastName VARCHAR(50) NOT NULL,
--  MiddleName VARCHAR(50) NULL,
--  JobTitle VARCHAR(50) NOT NULL,
--  DepartmentID int NOT NULL,
--  Salary money NOT NULL,
--  CONSTRAINT PK_Deleted_Employees PRIMARY KEY(EmployeeID)
--)

CREATE TRIGGER tr_DeletedEmployee ON Employees FOR DELETE AS
BEGIN
 INSERT INTO Deleted_Employees(EmployeeID,FirstName,LastName,
 MiddleName,JobTitle,DepartmentID,Salary)
 (
  SELECT EmployeeID,FirstName,LastName,MiddleName,JobTitle,DepartmentID,Salary
  FROM deleted
 )
END

--DELETE FROM Employees  WHERE  EmployeeID = 2