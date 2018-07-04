--CREATE TABLE Logs(
-- LogId int IDENTITY,
-- AccountId int NOT NULL,
-- OldSum money NOT NULL,
-- NewSum money NOT NULL,
-- CONSTRAINT PK_Logs PRIMARY KEY(LogId),
-- CONSTRAINT FK_Logs_Accounts FOREIGN KEY(AccountId) 
-- REFERENCES Accounts(Id)
--)

CREATE TRIGGER tr_Logs ON Accounts FOR UPDATE AS
BEGIN
 INSERT  INTO Logs(AccountId,OldSum,NewSum)
 (
  SELECT i.Id,d.Balance,i.Balance FROM inserted AS i
  JOIN deleted AS d ON d.Id = i.Id
 )
END