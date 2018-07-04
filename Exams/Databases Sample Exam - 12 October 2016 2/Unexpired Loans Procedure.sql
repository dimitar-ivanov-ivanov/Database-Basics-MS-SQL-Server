CREATE PROC usp_CustomersWithUnexpiredLoans(@CustomerID int)
AS BEGIN
 SELECT cu.CustomerID,cu.FirstName,l.LoanID FROM  Customers AS  cu
 JOIN Loans AS l ON l.CustomerID = cu.CustomerID
 WHERE cu.CustomerID = @CustomerID AND L.ExpirationDate IS NULL
END

EXEC dbo.usp_CustomersWithUnexpiredLoans 9 