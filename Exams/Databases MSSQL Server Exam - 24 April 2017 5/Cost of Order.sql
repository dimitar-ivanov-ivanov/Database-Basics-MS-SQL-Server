CREATE FUNCTION udf_GetCost(@jobID int)
RETURNS money 
BEGIN
 RETURN(
  SELECT ISNULL(SUM(p.Price * op.Quantity),0) FROM Orders AS o
  JOIN OrderParts AS op ON op.OrderId = o.OrderId
  JOIN Parts AS p ON p.PartId = op.PartId 
  WHERE o.JobId = @jobID
 ) 
END

DELETE dbo.udf_GetCost