SELECT e.FirstName,e.LastName,r.Description, 
REPLACE(Convert(varchar(20), r.OpenDate,102), '.', '-') AS OpenDate
FROM Employees AS e
JOIN Reports AS  r ON e.Id = r.EmployeeId
GROUP BY e.FirstName,e.LastName,r.Description,r.OpenDate,e.Id,r.Id
ORDER BY e.Id,r.OpenDate,r.Id