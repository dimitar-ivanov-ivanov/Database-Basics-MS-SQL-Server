 --DROP TRIGGER tr_LogMessages
 
 CREATE TRIGGER tr_LogMessages ON Users
 INSTEAD OF DELETE
 AS 
 BEGIN
  ALTER  TABLE Messages
  ALTER COLUMN UserId int NULL

  UPDATE Messages
  SET UserId = NULL WHERE  UserId IN (SELECT Id FROM deleted)

  DELETE FROM UsersChats WHERE UserId  IN (SELECT Id FROM deleted)

  UPDATE Users
  SET CredentialId = NULL WHERE Id IN (SELECT Id FROM deleted)


  DELETE FROM Credentials WHERE Id  IN (SELECT Id FROM deleted)
  DELETE FROM Users WHERE Users.Id = (SELECT Id FROM deleted) 
END

GO
DELETE FROM Users WHERE Users.Id = 1