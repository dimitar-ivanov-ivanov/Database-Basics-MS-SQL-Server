SELECT FirstName,Age,PhoneNumber FROM Customers as c
JOIN Countries as cn ON cn.Id = c.CountryId
WHERE (Age >= 21 AND FirstName LIKE '%an%') 
OR (cn.Name != 'Greece' AND PhoneNumber LIKE '%38')
ORDER BY c.FirstName,c.Age DESC