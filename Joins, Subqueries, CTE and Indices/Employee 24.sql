SELECT e.EmployeeID,e.FirstName,
IIF(p.StartDate >= '2005/01/01',NULL,p.Name) AS ProjectName
FROM Employees AS e
LEFT JOIN EmployeesProjects AS ep ON ep.EmployeeID = e.EmployeeID
LEFT JOIN Projects  AS p ON p.ProjectID = ep.ProjectID
WHERE  e.EmployeeID = 24