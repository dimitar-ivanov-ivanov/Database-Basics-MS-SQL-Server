CREATE PROC usp_PlaceOrder(@JobId int,@SerialNumber varchar(50),
@Quantity int) AS 
BEGIN

  IF(@Quantity <= 0)
  BEGIN;
   throw 50012,'Part quantity must be more than zero!',1
  END

 IF(@JobId NOT IN (SELECT JobId FROM Jobs))
  BEGIN;
   throw 50013 ,'Job not found!',1; 
  END

  IF((SELECT Status FROM Jobs WHERE JobId = @JobId) ='Finished')
  BEGIN;
   throw 50011  ,'This job is not active!',1; 
  END
 
  IF(@SerialNumber NOT IN (SELECT SerialNumber FROM Parts))
  BEGIN;
   throw 50014 ,'Part not found!',1; 
  END

  INSERT INTO Orders(JobId,IssueDate)
  VALUES (@JobId,NULL)

END