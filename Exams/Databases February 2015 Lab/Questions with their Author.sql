SELECT q.Title AS [Question Title],u.Username AS Author 
FROM Questions AS q
JOIN Users AS u ON  u.Id = q.UserId
ORDER BY q.Id