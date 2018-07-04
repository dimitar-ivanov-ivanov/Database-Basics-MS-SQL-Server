CREATE PROC usp_SendFeedback(@customerId int,@productId int,@rate decimal,@description
nvarchar(255)) AS
BEGIN
 
 BEGIN TRAN
  INSERT INTO Feedbacks(CustomerId,ProductId,Rate,Description)
  VALUES (@customerId,@productId,@rate,@description)

 DECLARE @user int  = (
  SELECT COUNT(f.Id) FROM Feedbacks AS f
  WHERE f.CustomerId = @customerId
  );

  IF(@user >= 3)
  BEGIN
   ROLLBACK
   RAISERROR('You are limited to only 3 feedbacks per product!',16,1);
   RETURN;
  END
  COMMIT;
END

--EXEC usp_SendFeedback 1, 5, 7.50, 'Average experience';
--SELECT COUNT(*) FROM Feedbacks WHERE CustomerId = 1 AND ProductId = 5;
