CREATE PROC usp_CustomersWithUnexpiredLoans(@customerId int) AS
BEGIN 
 SELECT c.CustomerID,FirstName,l.LoanID FROM Customers AS c
 JOIN Loans AS l ON l.CustomerID = c.CustomerID
 WHERE c.CustomerID = @customerId AND l.ExpirationDate IS NULL
END

--EXEC usp_CustomersWithUnexpiredLoans @CustomerID = 9