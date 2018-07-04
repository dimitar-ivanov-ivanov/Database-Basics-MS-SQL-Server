CREATE PROC usp_CustomersWithUnexpiredLoans(@customerId int)
AS BEGIN
 SELECT cu.CustomerID,cu.FirstName,l.LoanID FROM Customers AS cu
 JOIN Loans AS l ON l.CustomerID = cu.CustomerID
 WHERE cu.CustomerID = @customerId AND l.ExpirationDate  IS NULL
END