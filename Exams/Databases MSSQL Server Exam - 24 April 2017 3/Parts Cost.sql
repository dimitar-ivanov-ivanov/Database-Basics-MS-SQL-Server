SELECT SUM(p.Price * ISNULL(op.Quantity,0)) AS [Parts Total Cost] FROM Parts AS p
JOIN OrderParts AS op ON op.PartId = p.PartId
JOIN Orders AS o ON o.OrderId = op.OrderId 
WHERE DATEDIFF(WEEK,o.IssueDate,'04/24/2017') <=3