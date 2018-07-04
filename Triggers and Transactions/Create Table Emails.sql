--CREATE TABLE NotificationEmails(
-- Id int IDENTITY,
-- Recipient int,
-- Subject varchar(200),
-- Body varchar(200),
-- CONSTRAINT PK_NotificationEmails PRIMARY KEY(Id),
-- CONSTRAINT FK_NotificationEmails_Accounts FOREIGN KEY(Recipient)
-- REFERENCES Accounts(Id)
--)

CREATE TRIG GER tr_CreateTableEmails ON Logs FOR INSERT AS
BEGIN
 INSERT INTO NotificationEmails(Recipient,Subject,Body)
 (
  SELECT AccountId,
  CONCAT('Balance change for account: ',AccountId),
  CONCAT('On ',CONVERT(VARCHAR(20), GETDATE(), 100),
  ' your balance was changed from ',OldSum,' to ',NewSum)
  FROM inserted
 )
END