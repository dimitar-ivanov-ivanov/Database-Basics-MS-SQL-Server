SELECT u.Username,g.Name,COUNT(i.Id) AS [Items Count],
SUM(i.Price) AS [Items Price] 
FROM Users AS u
JOIN UsersGames AS ug ON ug.UserId = u.Id
JOIN Games AS g ON g.Id = ug.GameId
JOIN UserGameItems AS ugi ON ugi.UserGameId = ug.Id
JOIN Items AS i ON i.Id = ugi.ItemId
GROUP BY u.Username,g.Name
HAVING COUNT(i.Id) >= 10
ORDER BY [Items Count] DESC,[Items Price] DESC,u.Username