SELECT SUM(p.Price * ISNULL(op.Quantity,0)) AS [Parts Total] 
FROM Parts AS p
JOIN OrderParts AS op ON op.PartId = p.PartId
JOIN Orders AS o ON o.OrderId = op.OrderId
WHERE DATEDIFF(WEEK,IssueDate,'04/24/2014') <= 3
