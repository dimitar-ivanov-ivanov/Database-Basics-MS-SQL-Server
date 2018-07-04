CREATE PROC usp_TakeLoan
(@CustomerID int,@LoanAmount decimal(18,2),
@Interest  decimal(4,2),@StartDate date)
AS BEGIN
 BEGIN  TRANSACTION
  INSERT INTO Loans(StartDate,Amount,Interest,CustomerID)
  VALUES
  (@StartDate,@LoanAmount,@Interest,@CustomerID)

  IF(@LoanAmount NOT BETWEEN 0.01 AND 100000)
  BEGIN
   RAISERROR('Invalid Loan Amount',16,1);
   ROLLBACK;
   RETURN;
  END
 COMMIT;
END