CREATE PROC usp_TransferMoney(@senderId int ,@receiverId int, @amount money) AS
BEGIN
  DECLARE @senderBalanceBefore money = (SELECT Balance FROM Accounts WHERE Id = @senderId);
  IF(@senderBalanceBefore IS NULL)
  BEGIN
    RAISERROR('Invalid sender account!', 16, 1);
    RETURN;
  END   
  DECLARE @receiverBalanceBefore money = (SELECT Balance FROM Accounts WHERE Id = @receiverId);  
  IF(@receiverBalanceBefore IS NULL)
  BEGIN
    RAISERROR('Invalid receiver account!', 16, 1);
    RETURN;
  END 

  IF(@senderId = @receiverId)
  BEGIN
    RAISERROR('Sender and receiver accounts must be different!', 16, 1);
    RETURN;
  END  
  IF(@amount <= 0)
  BEGIN
    RAISERROR ('Transfer amount must be positive!', 16, 1); 
    RETURN;
  END 


 DECLARE @senderExists int = ( 
  SELECT COUNT(*) FROM Accounts
  WHERE Id = @senderId
 );

  DECLARE @receiverExists int = ( 
  SELECT COUNT(*) FROM Accounts
  WHERE Id = @senderId
 );

 if(@senderExists  = 0 OR @receiverExists = 0)
 BEGIN
  RAISERROR ('Invalid account',16,1);
  RETURN;
 END
 
 BEGIN TRAN
  EXEC usp_WithdrawMoney @senderId,@amount;
  EXEC usp_DepositMoney @receiverId,@amount;
  
  DECLARE @receiverBalanceAfter money = (SELECT Balance FROM Accounts WHERE Id = @receiverId);  
  DECLARE @senderBalanceAfter money = (SELECT Balance FROM Accounts WHERE Id = @senderId);

  if(@senderBalanceBefore - @amount != @senderBalanceAfter OR
     @receiverBalanceBefore + @amount != @receiverBalanceAfter)
	 BEGIN
	  ROLLBACK;
      RAISERROR('Invalid account balances!', 16, 1);
      RETURN;
	 END
 COMMIT;
END