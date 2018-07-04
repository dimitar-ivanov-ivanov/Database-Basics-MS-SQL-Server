--CREATE TABLE Logs (
--  LogId int NOT NULL IDENTITY, 
--  AccountId int NOT NULL, 
--  OldSum money NOT NULL, 
--  NewSum money NOT NULL,
--  CONSTRAINT PK_Logs PRIMARY KEY (LogId),
--  CONSTRAINT FK_Logs_Accounts FOREIGN KEY (AccountId) REFERENCES Accounts(Id)
--)

CREATE TRIGGER tr_AccountsUpdate ON Accounts FOR UPDATE AS
BEGIN 
 DECLARE @accountId int = (SELECT Id FROM inserted);
 DECLARE @deletedBalance money = (SELECT Balance FROM deleted);
 DECLARE @insertedBalance money = (SELECT Balance FROM inserted);

 IF(@deletedBalance != @insertedBalance)
 BEGIN
  INSERT INTO Logs
  VALUES (@accountId,@deletedBalance,@insertedBalance)
 END
END