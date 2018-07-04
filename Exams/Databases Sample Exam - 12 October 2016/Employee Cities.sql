SELECT c.CityName,b.Name,COUNT(e.EmployeeID) AS EmployeeCount FROM  Cities AS c
JOIN Branches AS b ON b.CityID  = c.CityID
JOIN Employees AS e ON e.BranchID = b.BranchID
WHERE c.CityID !=3 AND c.CityID != 5
GROUP BY c.CityName,b.Name
HAVING COUNT(e.EmployeeID) >= 3