SELECT FirstName,Age,PhoneNumber FROM Customers AS cu
JOIN Countries AS c ON c.Id = cu.CountryId
WHERE (Age >= 21 AND CHARINDEX('an',FirstName) > 0) OR 
(RIGHT(PhoneNumber,2) = '38' AND c.Name != 'Greece' )
ORDER BY FirstName,Age