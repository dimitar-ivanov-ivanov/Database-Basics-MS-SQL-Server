SELECT e.EmployeeID,e.FirstName,
IIF(p.StartDate >= '2005/01/01',NULL,p.Name) AS ProjectName
FROM Employees as e
JOIN EmployeesProjects as ep ON ep.EmployeeID = e.EmployeeID
JOIN Projects as p ON p.ProjectID = ep.ProjectID
WHERE e.EmployeeID = 24