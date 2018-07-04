CREATE TRIGGER tr_DetectDeliver ON Orders AFTER UPDATE AS
BEGIN
  DECLARE @OrderId int = (SELECT OrderId FROM inserted)
  
  UPDATE Parts
  SET StockQty += (SELECT Quantity FROM OrderParts
  WHERE OrderId=@OrderId AND Parts.PartId = OrderParts.PartId)
  WHERE PartId IN (SELECT PartId FROM OrderParts
  WHERE OrderId = @OrderId)
 
 DELETE FROM OrderParts
 WHERE OrderId = @OrderId
END

UPDATE Orders
SET Delivered = 1
WHERE OrderId = 3
