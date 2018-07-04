CREATE PROC usp_PlaceOrder(@jobId int,@serialNumber varchar(50),
@quantity int) AS
BEGIN
 BEGIN TRAN
  DECLARE @jobExists int = (
   SELECT o.OrderId FROM Jobs AS j
   LEFT JOIN PartsNeeded AS pn ON pn.JobId = j.JobId
   LEFT JOIN Orders AS o ON o.JobId = o.JobId
   WHERE j.JobId = @jobId AND o.IssueDate IS NULL
  );


  if(@jobExists IS NULL)
  BEGIN
   RAISERRRO('Job not found!',5003)
  END

  COMMIT;
END 