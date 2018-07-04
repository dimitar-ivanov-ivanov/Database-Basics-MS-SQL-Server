SELECT u.Username,u.FullName,u.BirthDate,ISNULL(p.Title,'No photos') AS Photo FROM Users AS u
LEFT JOIN Photographs AS p ON p.UserId = u.Id
WHERE MONTH(u.Birthdate) = 1
ORDER BY u.FullName