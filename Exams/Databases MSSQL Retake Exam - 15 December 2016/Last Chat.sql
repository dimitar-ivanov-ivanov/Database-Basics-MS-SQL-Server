SELECT TOP 1 WITH TIES c.Title, m.Content FROM Messages AS m
LEFT JOIN Chats AS c ON c.Id = m.ChatId
ORDER BY c.StartDate DESC,SentOn