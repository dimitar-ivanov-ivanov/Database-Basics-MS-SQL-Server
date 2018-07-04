SELECT TOP 50 e.EmployeeID,CONCAT(e.FirstName,' ',e.LastName) AS EmployeeName,
 CONCAT(e1.FirstName,' ',e1.LastName) AS ManagerName,
 d.Name AS DepartmentName
 FROM Employees AS e
JOIN Employees AS e1 ON e1.EmployeeID = e.ManagerID
JOIN  Departments AS d ON d.DepartmentID = e.DepartmentID
ORDER BY e.EmployeeID