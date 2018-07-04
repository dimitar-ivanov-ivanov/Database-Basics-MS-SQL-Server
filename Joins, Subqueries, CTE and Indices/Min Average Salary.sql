SELECT TOP 1 AVG(e.Salary) AS MinAverageSalary 
FROM Departments AS d
JOIN Employees AS e ON e.DepartmentID = d.DepartmentID
GROUP BY d.Name
ORDER BY  MinAverageSalary