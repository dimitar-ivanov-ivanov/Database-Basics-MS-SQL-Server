CREATE PROC usp_TransferMoney(@senderId int,@receiverId int,@Amount money) AS
BEGIN
 BEGIN TRANSACTION
  EXEC dbo.usp_WithdrawMoney @senderId, @Amount
  EXEC dbo.usp_DepositMoney @receiverId,@Amount 
 
  IF(@Amount <0 or  @senderId = @receiverId 
  OR (SELECT SUM(Balance) FROM Accounts WHERE AccountHolderId = @senderId) < 0)
  BEGIN
   RAISERROR('Invalid Amount or Invalid balance',16,1);
   ROLLBACK;
   RETURN;
  END
 COMMIT;
END