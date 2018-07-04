CREATE TRIGGER tr_TakePreviousEmployeeLoan ON Employees FOR INSERT AS
BEGIN
 DECLARE @EmployeeID int = (
  SELECT EmployeeID FROM inserted AS i
 )

 INSERT INTO EmployeesLoans(EmployeeID,LoanID)
 VALUES
 (@EmployeeID - 1,
 (SELECT l.Amount FROM Employees AS e
  JOIN EmployeesLoans AS el ON el.EmployeeID = e.EmployeeID
  JOIN Loans AS l ON l.LoanID = el.LoanID
  WHERE e.EmployeeID = @EmployeeID))

END