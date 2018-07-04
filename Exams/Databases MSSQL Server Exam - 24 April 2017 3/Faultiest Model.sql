SELECT fm.Model,fm.[Times Serviced],
ISNULL(SUM(p.Price  * ISNULL(op.Quantity,0)),0) AS [Parts Total]
FROM
(
 SELECT TOP 1 WITH TIES m.Name AS Model,m.ModelId,
 COUNT(j.JobId) AS [Times Serviced]
 FROM Models AS m
 JOIN Jobs  AS j ON j.ModelId = m.ModelId
 GROUP BY m.Name,m.ModelId
 ORDER BY [Times Serviced] DESC
) AS  fm --faultiestModels
LEFT JOIN Jobs AS j ON j.ModelId = fm.ModelId
LEFT JOIN Orders AS o ON  o.JobId = j.JobId
LEFT JOIN OrderParts  AS op  ON op.OrderId = o.OrderId
LEFT  JOIN  Parts AS p ON p.PartId = op.PartId 
GROUP BY fm.Model,fm.[Times Serviced]