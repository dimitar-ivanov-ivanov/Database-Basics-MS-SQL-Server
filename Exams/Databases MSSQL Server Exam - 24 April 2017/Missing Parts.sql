SELECT p.PartId,p.Description,
COUNT(j.JobId),
p.StockQty AS [In Stock],
COUNT(o.Delivered)
FROM Parts AS p
JOIN PartsNeeded AS pn ON pn.PartId = p.PartId
JOIN Jobs AS j ON j.JobId = pn.JobId
JOIN OrderParts AS op ON op.PartId = p.PartId
JOIN Orders AS o ON o.OrderId = op.OrderId
WHERE o.Delivered = 1 AND j.Status = 'Finished'
GROUP BY p.PartId,p.Description,p.StockQty
ORDER BY p.PartId