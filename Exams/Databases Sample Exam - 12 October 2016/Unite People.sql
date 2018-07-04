SELECT TOP 3 FirstName,c.CityName FROM Employees AS e
JOIN Branches AS b ON e.BranchID = b.BranchID
JOIN Cities AS c On c.CityID = b.CityID
UNION ALL 
SELECT TOP 3 cu.FirstName,c.CityName FROM Customers  AS cu
JOIN Cities AS c ON c.CityID = cu.CityID