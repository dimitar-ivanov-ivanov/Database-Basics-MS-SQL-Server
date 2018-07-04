CREATE PROC usp_SendFeedback(@CustomerId int,@ProductId int,
@Rate decimal(4,2),@Description nvarchar(255)) AS
BEGIN
 BEGIN TRANSACTION
 
 INSERT INTO Feedbacks(CustomerId,ProductId,Rate,Description)
 VALUES (@CustomerId,@ProductId,@Rate,@Description)

  IF((SELECT COUNT(Id) FROM Feedbacks
      WHERE CustomerId = @CustomerId) >3)
	 BEGIN
	  RAISERROR('You are limited to only 3 feedbacks per product!',16,1);
	  ROLLBACK;
	  RETURN;
	 END

 COMMIT;
END