WITH EmployeesReportsCount_CTE(EmployeeId,Name,ReportCount)
AS
(
 SELECT e.Id,
 CONCAT(e.FirstName,' ',e.LastName),
 COUNT(r.Id) 
 FROM Employees AS e
 JOIN Reports AS  r ON r.EmployeeId = e.Id
 GROUP BY e.Id,e.FirstName,e.LastName
)

SELECT er.Name, 
FROM EmployeesReportsCount_CTE AS er
JOIN Reports AS r ON r.EmployeeId= er.EmployeeId
GROUP BY er.Name