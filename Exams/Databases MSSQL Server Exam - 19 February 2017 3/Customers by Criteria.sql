SELECT c.FirstName,c.Age,c.PhoneNumber FROM Customers AS  c
JOIN Countries AS con ON con.Id = c.CountryId
WHERE (c.Age >= 21 AND CHARINDEX('an',c.FirstName) >0)
OR (c.PhoneNumber LIKE '%38' AND con.Name != 'Greece' )
ORDER BY c.FirstName,c.Age DESC