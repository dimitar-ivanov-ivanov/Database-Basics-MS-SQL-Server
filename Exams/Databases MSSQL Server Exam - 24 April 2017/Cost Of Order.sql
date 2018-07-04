CREATE FUNCTION udf_GetCost(@jobId int)
RETURNS money
BEGIN 
 DECLARE @res money = (
 SELECT SUM(p.Price * pn.Quantity) FROM Parts AS p
 JOIN PartsNeeded AS pn ON pn.PartId = p.PartId
 JOIN Jobs AS j ON j.JobId = pn.JobId
 WHERE @jobId = j.JobId
 );

 IF(@res IS NULL) RETURN 0;
 RETURN @res;
END


--SELECT dbo.udf_GetCost(3)