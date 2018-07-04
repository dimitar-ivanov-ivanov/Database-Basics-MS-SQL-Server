DECLARE @OrderId int = 19;

DELETE FROM OrderParts
WHERE OrderId = @OrderId

DELETE FROM Orders
WHERE OrderId = @OrderId