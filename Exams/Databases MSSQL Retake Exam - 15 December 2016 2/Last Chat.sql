SELECT TOP 1  WITH TIES c.Title,m.Content FROM Chats AS c
FULL JOIN Messages AS m ON c.Id = m.ChatId
WHERE c.Id IN(
SELECT TOP 1 Id FROM Chats
ORDER BY StartDate DESC
)
ORDER BY m.SentOn