SELECT  m.Name AS Model,COUNT(j.JobId) AS [Times Serviced],
SUM(p.Price * ISNULL(pn.Quantity,0)) AS [Parts Total]
FROM Models  AS m
 JOIN Jobs AS j ON j.ModelId  = m.ModelId
 JOIN PartsNeeded AS pn ON pn.JobId = j.JobId
 JOIN Parts AS p ON p.PartId = pn.PartId
WHERE j.Status = 'Finished'
GROUP BY m.Name
ORDER BY [Times Serviced] DESC