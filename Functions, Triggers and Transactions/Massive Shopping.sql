DECLARE @gameName nvarchar(50) = 'Safflower';
DECLARE @username nvarchar(50) = 'Stamat';
DECLARE @userGameId int = (
 SELECT ug.Id FROM UsersGames AS ug
 JOIN Users AS u ON u.Id = ug.Id
 JOIN Games AS g ON g.Id = ug.GameId
)

DECLARE @userGameLevel int = (SELECT Level From UsersGames WHERE Id = @userGameId);
DECLARE @itemCost money,@availableCash money,@minLevel int,@maxLevel int;

SET @minLevel = 11; SET @maxLevel = 12;
SET @availableCash = (SELECT Cash FROM UsersGames WHERE Id = @userGameId);
SET @itemCost = (SELECT SUM(Price) FROM Items WHERE MinLevel BETWEEN @minLevel AND @maxLevel);

if(@itemCost < @availableCash)
BEGIN
  BEGIN TRAN
  UPDATE UsersGames SET Cash -=@itemCost WHERE  Id = @userGameId;
  IF(@@ROWCOUNT != 1)
  BEGIN
    ROLLBACK;
	RAISERROR('Could not make payment',16,1);
	RETURN;
  END
  ELSE
   BEGIN
    INSERT INTO UserGameItems (ItemId, UserGameId) 
    (SELECT Id, @userGameId FROM Items WHERE MinLevel BETWEEN @minLevel AND @maxLevel) 
    IF((SELECT COUNT(*) FROM Items WHERE MinLevel BETWEEN @minLevel AND @maxLevel) <> @@ROWCOUNT)
    BEGIN
      ROLLBACK; RAISERROR('Could not buy items', 16, 1); --RETURN;
    END	
    ELSE COMMIT;
   END
END

SET @minLevel = 19; SET @maxLevel = 21;
SET @availableCash = (SELECT Cash FROM UsersGames WHERE Id = @userGameId);
SET @itemCost = (SELECT SUM(Price) FROM Items WHERE MinLevel BETWEEN @minLevel AND @maxLevel);

if(@itemCost < @availableCash)
BEGIN
  BEGIN TRAN
  UPDATE UsersGames SET Cash -=@itemCost WHERE  Id = @userGameId;
  IF(@@ROWCOUNT != 1)
  BEGIN
    ROLLBACK;
	RAISERROR('Could not make payment',16,1);
	RETURN;
  END
  ELSE
   BEGIN
    INSERT INTO UserGameItems (ItemId, UserGameId) 
    (SELECT Id, @userGameId FROM Items WHERE MinLevel BETWEEN @minLevel AND @maxLevel) 
    IF((SELECT COUNT(*) FROM Items WHERE MinLevel BETWEEN @minLevel AND @maxLevel) <> @@ROWCOUNT)
    BEGIN
      ROLLBACK; RAISERROR('Could not buy items', 16, 1); --RETURN;
    END	
    ELSE COMMIT;
   END
END

SELECT i.Name AS [Item Name] FROM UserGameItems as ugi
JOIN UsersGames as ug ON ug.Id = ugi.UserGameId
JOIN Users as u ON u.Id = ug.UserId
JOIN Games as g ON g.Id = ug.GameId
JOIN Items as i on i.Id = ugi.ItemId
WHERE  g.Name =  @gameName
ORDER BY [Item Name]