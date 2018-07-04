SELECT TOP 5 e.EmployeeID,e.FirstName,p.Name AS ProjectName 
FROM Employees AS e
JOIN EmployeesProjects AS ep ON e.EmployeeID = ep.EmployeeID
JOIN Projects AS p ON p.ProjectID = ep.ProjectID
WHERE p.StartDate > '08/13/2002' AND  p.EndDate IS NULL
ORDER BY e.EmployeeID