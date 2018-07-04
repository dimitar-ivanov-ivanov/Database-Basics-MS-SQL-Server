SELECT p.PartId,p.Description,re.Required,p.StockQty AS [In Stock],
po.Ordered
FROM Parts AS p
JOIN (
 SELECT p.PartId,COUNT(j.JobId) AS Required FROM Jobs AS j
  JOIN PartsNeeded AS pn ON pn.JobId = j.JobId
  JOIN Parts AS p ON p.PartId = pn.PartId
 WHERE j.Status != 'Finished'
 GROUP BY p.PartId
) AS re ON re.PartId  = p.PartId
JOIN (
 SELECT p.PartId,COUNT(o.OrderId) AS Ordered FROM Parts AS p
JOIN OrderParts AS op ON op.PartId = p.PartId
JOIN Orders AS o ON  o.OrderId = op.OrderId
WHERE o.Delivered = 0
GROUP BY p.PartId
) AS po ON po.PartId = p.PartId
ORDER BY p.PartId