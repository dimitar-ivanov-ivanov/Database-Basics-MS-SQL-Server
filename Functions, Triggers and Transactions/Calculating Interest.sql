CREATE PROC usp_CalculateFutureValueForAccount(@accountId int ,@interestRate float) AS
 DECLARE @years int = 5;
 SELECT ac.Id,ac.FirstName,ac.LastName,a.Balance,
  dbo.ufn_CalculateFutureValue(a.Balance, @interestRate, @years) AS BalanceIn5Years
  FROM AccountHolders as ac
 JOIN Accounts as a ON ac.Id = a.AccountHolderId
 WHERE @accountId = a.Id