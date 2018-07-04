SELECT TOP 50 e1.EmployeeID,
CONCAT(e1.FirstName,' ',e1.LastName) as EmployeeName,
CONCAT(e2.FirstName,' ',e2.LastName) as  ManagerName,
d.Name as DepartmentName
FROM Employees as e1
JOIN Employees as e2 ON e1.ManagerID= e2.EmployeeID
JOIN Departments as d ON e1.DepartmentID = d.DepartmentID
ORDER By e1.EmployeeID