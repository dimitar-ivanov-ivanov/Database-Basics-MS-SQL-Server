CREATE PROC usp_TakeLoan(@CustomerID int,@LoanAmount decimal(18,2),
@Interest decimal(4,2),@StartDate date) AS
BEGIN
  BEGIN TRANSACTION

  INSERT INTO Loans(CustomerID,Amount,Interest,StartDate)
  VALUES
  (@CustomerID,@LoanAmount,@Interest,@StartDate)

  IF(@LoanAmount NOT BETWEEN 0.01 AND 100000)
  BEGIN
   RAISERROR('Invalid Loan Amount',16,1);
   ROLLBACK;
   RETURN;
  END

  COMMIT;
END

EXEC usp_TakeLoan @CustomerID = 1, @LoanAmount = 500, @Interest = 1, @StartDate='20160915'