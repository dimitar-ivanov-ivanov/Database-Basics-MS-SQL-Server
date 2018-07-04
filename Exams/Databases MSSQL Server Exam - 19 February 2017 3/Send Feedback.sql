CREATE PROC usp_SendFeedback(@CustomerId int,@ProductId int,
@Rate decimal(18,2),@Description nvarchar(255)) AS
BEGIN
 BEGIN TRANSACTION
 INSERT INTO Feedbacks(ProductId,CustomerId,Rate,Description)
 VALUES (@ProductId,@CustomerId,@Rate,@Description)

 IF((SELECT COUNT(f.Id) FROM Feedbacks AS f
     WHERE f.CustomerId = @CustomerId)>=3)
 BEGIN
  ROLLBACK;
  RAISERROR('You are limited to only 3 feedbacks per product!',16,1);  
  RETURN;
 END

 COMMIT;
END