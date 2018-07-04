SELECT DISTINCT u.Username FROM Users AS u
JOIN Reports AS r ON r.UserId = u.Id
WHERE(u.Username LIKE '[0-9]%' 
AND CAST(r.CategoryId AS VARCHAR) = LEFT(u.Username,1)) OR
(u.Username LIKE '%[0-9]' 
AND CAST(r.CategoryId AS VARCHAR) = RIGHT(u.Username,1))
ORDER BY u.Username