CREATE PROC udp_SendMessage(@userId int,@chatId int,@content varchar(200)) AS
BEGIN

 IF(@userId NOT IN 
 (SELECT UserId FROM UsersChats 
 WHERE ChatId = @chatId))
 BEGIN
  RAISERROR('There is no chat with that user!',16,1);
 END
 ELSE
 BEGIN
  INSERT INTO Messages(UserId,ChatId,Content,SentOn)
  VALUES(@userId,@chatId,@content,GETDATE())
 END
END