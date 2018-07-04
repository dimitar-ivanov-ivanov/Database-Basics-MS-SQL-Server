SELECT Username,LastName,
CASE 
 WHEN PhoneNumber IS NULL THEN 0
 ELSE 1
END AS [Has Phone]
FROM Users
GROUP BY Username,LastName,PhoneNumber,Id
ORDER BY LastName,Id