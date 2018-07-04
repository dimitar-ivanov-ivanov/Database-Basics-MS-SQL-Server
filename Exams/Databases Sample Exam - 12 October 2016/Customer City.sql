SELECT CustomerID,FirstName,LastName,Gender,ci.CityName FROM Customers AS c
JOIN Cities AS ci ON ci.CityID = c.CityID
WHERE (LastName LIKE 'Bu%' OR FirstName LIKE '%a')  
AND LEN(ci.CityName) >= 8
ORDER BY c.CustomerID