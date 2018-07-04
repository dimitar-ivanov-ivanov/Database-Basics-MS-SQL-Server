--CREATE TABLE AccountLogs( 
--AccountID INT,
--AccountNumber CHAR(12) NOT NULL,
--StartDate DATE NOT NULL,
--CustomerID INT NOT NULL,
--CONSTRAINT PK_AccountsLogs PRIMARY KEY(AccountID),
--CONSTRAINT FK_AccountsLogs_Customers FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
--)

CREATE TRIGGER tr_AccountsDelete ON Accounts
INSTEAD OF DELETE AS
BEGIN
 DELETE FROM EmployeesAccounts
 WHERE AccountID IN (SELECT  AccountID FROM deleted)

 DELETE FROM Accounts
 WHERE AccountID IN (SELECT AccountID FROM deleted)

 INSERT INTO AccountLogs(AccountID,AccountNumber,StartDate,CustomerId)
 (SELECT AccountID,AccountNumber,StartDate,CustomerID FROM deleted)
END