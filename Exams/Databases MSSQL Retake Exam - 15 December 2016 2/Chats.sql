SELECT Title,IsActive FROM Chats
WHERE (LEN(Title) < 5 AND IsActive = 0)  OR
 SUBSTRING(Title,3,2) = 'tl'
ORDER BY Title DESC