SELECT c.Id,c.Title,m.Id FROM Messages AS m
JOIN Chats AS c ON c.Id = m.ChatId
WHERE m.SentOn  < '03/26/2012' AND 
c.Title LIKE '%x'
ORDER BY c.Id,m.Id