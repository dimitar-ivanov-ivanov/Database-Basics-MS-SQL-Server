CREATE TABLE AccountLogs( 
AccountID INT,
AccountNumber CHAR(12) NOT NULL,
StartDate DATE NOT NULL,
CustomerID INT NOT NULL,
CONSTRAINT PK_AccountsLogs PRIMARY KEY(AccountID),
CONSTRAINT FK_AccountsLogs_Customers FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
)

CREATE TRIGGER tr_DeleteTrigger ON Accounts FOR DELETE AS
BEGIN
  INSERT INTO AccountLogs(AccountID,AccountNumber,StartDate,CustomerID)
  (
   SELECT AccountID,AccountNumber,StartDate,CustomerID FROM deleted
  )
END

DELETE FROM [dbo].[Accounts] WHERE CustomerID = 4