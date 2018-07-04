SELECT u.Username,g.Name AS Game,MAX(c.Name) AS  Character,
MAX(cs.Strength) + MAX(gts.Strength) + SUM(gis.Strength) AS [Strength], 
MAX(cs.Defence) + MAX(gts.Defence) + SUM(gis.Defence) AS [Defence], 
MAX(cs.Speed) + MAX(gts.Speed) + SUM(gis.Speed) AS [Speed],
MAX(cs.Mind) + MAX(gts.Mind) + SUM(gis.Mind) AS [Mind],
MAX(cs.Luck) + MAX(gts.Luck) + SUM(gis.Luck) AS [Luck]
FROM Users AS  u
JOIN UsersGames AS ug ON ug.UserId =u.Id
JOIN Games AS g ON g.Id = ug.GameId
JOIN GameTypes AS gt ON gt.Id = g.GameTypeId
JOIN Characters AS c ON c.Id = ug.CharacterId
JOIN UserGameItems AS ugi ON ugi.UserGameId = ug.Id
JOIN Items AS i ON i.Id = ugi.ItemId
JOIN [Statistics] AS cs ON cs.Id = c.StatisticId
JOIN [Statistics] AS gts ON gts.Id = gt.BonusStatsId
JOIN [Statistics] AS gis ON gis.Id = i.StatisticId
GROUP BY u.Username,g.Name
ORDER BY Strength DESC,Defence DESC,Speed DESC,Mind DESC,Luck DESC