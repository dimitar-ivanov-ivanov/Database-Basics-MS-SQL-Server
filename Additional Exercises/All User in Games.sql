SELECT g.Name,gt.Name AS [Game Type],
u.Username,ug.Level,ug.Cash,c.Name AS Character 
FROM Users AS u
JOIN UsersGames  AS ug ON ug.UserId = u.Id
JOIN Characters AS c ON c.Id = ug.CharacterId
JOIN Games AS g ON g.Id = ug.GameId
JOIN GameTypes AS gt ON gt.Id = g.GameTypeId
ORDER BY ug.Level DESC,u.Username,g.Name