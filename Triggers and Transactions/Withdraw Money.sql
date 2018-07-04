CREATE PROC  usp_WithdrawMoney(@AccountId int,@MoneyAmount money) AS
BEGIN
 BEGIN TRANSACTION
  UPDATE Accounts
  SET Balance -= @MoneyAmount
  WHERE Id = @AccountId
 COMMIT
END 