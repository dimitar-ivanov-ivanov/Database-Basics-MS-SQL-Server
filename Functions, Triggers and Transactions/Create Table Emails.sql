--CREATE TABLE NotificationEmails(
-- Id int IDENTITY NOT NULL,
-- Recepient int NOT NULL,
-- Subject varchar(50) NOT NULL,
-- Body varchar(max),
-- CONSTRAINT PK_NotificationEmails PRIMARY KEY(Id),
-- CONSTRAINT FK_NotificationEmails FOREIGN KEY(Recepient)
-- REFERENCES Accounts(Id)
--)

CREATE TRIGGER tr_AccountsUpdate ON Logs FOR UPDATE AS
BEGIN
 DECLARE @recepient int = (SELECT AccountId FROM inserted);
 DECLARE @oldSum money = (SELECT OldSum FROM inserted);
 DECLARE @newSum money = (SELECT NewSum FROM inserted);
 DECLARE @subject varchar(max) = CONCAT('Balance change for account',@recepient);
 DECLARE @body varchar(max) = CONCAT('On Sep ',GETDATE(),
 ' your balance was changed from ',@oldSum,' to ',@newSum,'.');

 INSERT INTO NotificationEmails VALUES
 (@recepient,@oldSum,@newSum)
END

UPDATE Accounts
 SET Balance += 1000
 WHERE  Id =1