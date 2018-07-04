CREATE TRIGGER tr_UserItems ON UserGameItems FOR INSERT
AS
BEGIN
 DECLARE @userLevel int = (
   SELECT Level FROM UsersGames AS ug
   JOIN inserted AS i ON i.UserGameId = ug.Id
 );

 DECLARE @itemLevel int = (
  SELECT MinLevel FROM Items AS i
  JOIN inserted AS ugi ON ugi.ItemId = i.Id
 );

 IF(@itemLevel > @userLevel)
 BEGIN
    ROLLBACK;
      RAISERROR('Higher user game level required for item purchase', 16, 1);
      RETURN;
 END
END

--INSERT INTO UserGameItems VALUES(1,1);