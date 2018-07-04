CREATE FUNCTION udf_GetCost(@JobId int)
RETURNS decimal(18,2)
BEGIN
  RETURN (
   SELECT ISNULL(SUM(ISNULL(op.Quantity,0) * p.Price),0) FROM Orders AS o
   LEFT JOIN OrderParts as op ON op.OrderId = o.OrderId
   LEFT JOIN Parts AS p ON p.PartId = op.PartId
   WHERE o.JobId = @JobId
  )
END

--SELECT dbo.udf_GetCost(3)