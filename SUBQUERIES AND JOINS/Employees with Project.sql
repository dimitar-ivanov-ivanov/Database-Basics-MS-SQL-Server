SELECT TOP 5 e.EmployeeID,e.FirstName,p.Name FROM Employees as e
JOIN EmployeesProjects as ep ON ep.EmployeeID = e.EmployeeID
JOIN Projects as p ON p.ProjectID = ep.ProjectID
WHERE p.StartDate > '2002/08/13' AND p.EndDate IS NULL
ORDER BY e.EmployeeID