SELECT m.Name AS Model,
COUNT(j.JobId) AS [Times Serviced]
FROM Models AS m
JOIN Jobs AS j ON j.ModelId = m.ModelId
JOIN PartsNeeded AS pn ON pn.JobId = j.JobId
JOIN Parts AS p ON p.PartId = pn.PartId
GROUP BY m.Name
ORDER BY [Times Serviced] DESC