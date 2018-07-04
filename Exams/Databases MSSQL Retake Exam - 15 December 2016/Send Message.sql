CREATE PROC udp_SendMessage(@userId int,@chatId int,@content varchar(200))
AS 
BEGIN
 IF(@userId NOT IN (SELECT UserId FROM UsersChats 
 WHERE @chatId = ChatId))
 BEGIN
  RAISERROR('There is no chat with that user!',16,1);
 END
 ELSE
 BEGIN
  INSERT INTO Messages(Content,SentOn,ChatId,UserId)
  VALUES (@content,GETDATE(),@chatId,@userId);
 END 
END

--EXEC dbo.udp_SendMessage 19, 17, 'Awesome'

