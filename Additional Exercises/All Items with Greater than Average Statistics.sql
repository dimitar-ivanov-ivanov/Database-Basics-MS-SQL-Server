SELECT i.Name,i.Price,i.MinLevel,s.Strength,s.Defence,s.Speed,s.Luck,s.Mind 
FROM Items AS i
JOIN [Statistics] AS s ON i.StatisticId = s.Id
GROUP BY i.Name,i.Price,i.MinLevel,s.Strength,s.Defence,s.Speed,s.Luck,s.Mind
HAVING
Mind  > (SELECT AVG(Mind) FROM [Statistics]) AND
Speed  > (SELECT AVG(Speed) FROM [Statistics]) AND
Strength  > (SELECT AVG(Strength) FROM [Statistics])