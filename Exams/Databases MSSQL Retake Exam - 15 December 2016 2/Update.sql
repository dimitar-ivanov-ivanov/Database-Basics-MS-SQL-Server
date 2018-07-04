UPDATE Chats
SET StartDate = (
 SELECT MIN(m.SentOn) FROM Chats AS c
 JOIN  Messages AS m ON m.ChatId = c.Id
 WHERE c.Id = Chats.Id
)
WHERE Chats.Id IN(
 SELECT c.Id FROM Chats AS c
 JOIN  Messages AS m ON m.ChatId = c.Id
 WHERE c.StartDate > m.SentOn
)