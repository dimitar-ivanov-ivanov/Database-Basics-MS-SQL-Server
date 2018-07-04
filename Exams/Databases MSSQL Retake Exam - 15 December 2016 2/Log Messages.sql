--CREATE TABLE MessageLogs(
-- Id int IDENTITY,
-- Content varchar(200),
-- SentOn date,
-- ChatId int NOT NULL,
-- UserId int NOT NULL,
-- CONSTRAINT PK_MessageLogs PRIMARY KEY(Id),
-- CONSTRAINT FK_MessageLogs_Chats FOREIGN KEY(ChatId)
-- REFERENCES Chats(Id),
-- CONSTRAINT FK_MessageLogs_Users FOREIGN KEY(UserId)
-- REFERENCES Users(Id)
--)



CREATE TRIGGER tr_LogMessages ON Messages
FOR DELETE AS
BEGIN
 INSERT INTO MessageLogs(Id,UserId,ChatId,Content,SentOn)
 (SELECT Id,UserId,ChatId,Content,SentOn FROM deleted ) 
END