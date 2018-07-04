SELECT FirstName,LastName,HireDate,d.Name FROM Employees as e
JOIN Departments as d ON e.DepartmentID = d.DepartmentID
WHERE HireDate > '1/1/1999' AND d.Name IN ('Sales','Finance')
ORDER BY HireDate
