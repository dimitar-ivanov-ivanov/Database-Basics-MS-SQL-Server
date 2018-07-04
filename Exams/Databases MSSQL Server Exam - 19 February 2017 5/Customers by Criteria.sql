SELECT cu.FirstName,cu.Age,cu.PhoneNumber 
FROM Customers AS cu
JOIN Countries AS  con ON con.Id = cu.CountryId
WHERE (cu.Age >= 21 AND CHARINDEX('an',cu.FirstName) != 0)
OR (RIGHT(cu.PhoneNumber,2) = '38' AND con.Name != 'Greece')
ORDER BY cu.FirstName,cu.Age