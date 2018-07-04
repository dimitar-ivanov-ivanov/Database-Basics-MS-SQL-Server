SELECT p.PartId,p.Description,
COUNT(j.JobId)  AS Required,p.StockQty AS [In Stock],
COUNT(o.OrderId) AS Ordered
FROM Parts AS p
LEFT JOIN PartsNeeded AS pn ON pn.PartId = p.PartId
LEFT JOIN Jobs AS j  ON j.JobId = pn.JobId
LEFT JOIN Orders AS o ON o.JobId = j.JobId
WHERE j.Status != 'Finished' AND o.Delivered = 0 AND p.StockQty < pn.Quantity
GROUP BY p.PartId,p.Description,p.StockQty
ORDER  BY p.PartId