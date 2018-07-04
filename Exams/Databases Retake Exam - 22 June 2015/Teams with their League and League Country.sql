SELECT t.TeamName AS [Team Name],l.LeagueName AS League,
ISNULL(c.CountryName,'International') AS [League Country]
FROM Teams AS t
JOIN Leagues_Teams AS lg ON lg.TeamId = t.Id
JOIN Leagues  AS l ON l.Id = lg.LeagueId
JOIN Countries AS c ON  c.CountryCode = t.CountryCode
GROUP BY t.TeamName,l.LeagueName,c.CountryName
ORDER BY [Team Name]