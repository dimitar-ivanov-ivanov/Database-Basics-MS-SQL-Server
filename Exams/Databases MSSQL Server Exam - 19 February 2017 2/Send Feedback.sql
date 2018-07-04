CREATE PROC usp_SendFeedback(@customerId int,@productId int,@rate decimal(4,2),
@description nvarchar(255)) AS
BEGIN
  BEGIN TRANSACTION
  INSERT INTO Feedbacks(CustomerId,ProductId,Rate,Description)
  VALUES (@customerId,@productId,@rate,@description)

  DECLARE @numFeedbacks int = (
   SELECT COUNT(f.Id) FROM Feedbacks AS f
   WHERE f.CustomerId = @customerId
  )

  IF(@numFeedbacks > 3)
  BEGIN 
   ROLLBACK
   RAISERROR('You are limited to only 3 feedbacks per product!',16,1)
   RETURN;
  END
  COMMIT;
END