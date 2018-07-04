SELECT mj.Name AS Model,mj.[Times Serviced], 
ISNULL(SUM(p.Price * ISNULL(op.Quantity,0)),0) AS [Parts Total]
FROM
(SELECT TOP 1  m.ModelId,m.Name,COUNT(j.JobId) AS [Times Serviced]
FROM Models AS m
JOIN Jobs AS j ON  j.ModelId = m.ModelId
GROUP BY m.ModelId,m.Name
ORDER BY [Times Serviced] DESC) AS mj
LEFT JOIN Jobs AS j ON j.ModelId = mj.ModelId
LEFT JOIN Orders AS o ON o.JobId = j.JobId
LEFT JOIN OrderParts AS op ON op.OrderId = o.OrderId
LEFT JOIN Parts AS p ON p.PartId = op.PartId
GROUP BY mj.Name,mj.[Times Serviced]