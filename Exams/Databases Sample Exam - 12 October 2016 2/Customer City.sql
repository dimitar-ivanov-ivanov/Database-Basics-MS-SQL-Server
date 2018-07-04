SELECT cu.CustomerID,cu.FirstName,cu.LastName,cu.Gender,c.CityName
FROM  Customers AS cu
JOIN Cities  AS c ON c.CityID = cu.CityID
WHERE LEN(c.CityName) = 8 AND (cu.LastName LIKE 'Bu%' OR cu.FirstName LIKE '%a')
ORDER BY cu.CustomerID