CREATE PROC usp_DepositMoney (@accountId int,@moneyAmount money) AS
BEGIN
 BEGIN TRAN
  UPDATE Accounts
  SET Balance +=@moneyAmount
  WHERE Id = @accountId

  IF(@@ROWCOUNT <> 1)
  BEGIN
   ROLLBACK;
   RAISERROR ('Invalid account',16,1);
   RETURN;
  END
 COMMIT;
END