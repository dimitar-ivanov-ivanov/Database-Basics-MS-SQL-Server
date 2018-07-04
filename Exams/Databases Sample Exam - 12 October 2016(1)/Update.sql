UPDATE Employees
SET ManagerID = 1
WHERE EmployeeID >= 2 AND EmployeeID <=10

UPDATE Employees
SET ManagerID = 11
WHERE EmployeeID >= 12 AND EmployeeID <= 20

UPDATE Employees
SET ManagerID = 21
WHERE EmployeeID >= 22 AND EmployeeID <= 30

UPDATE Employees
SET ManagerID = 1
WHERE EmployeeID IN (11,21)