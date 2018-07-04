CREATE TRIGGER tr_DeleteProductsRelation ON Products
INSTEAD OF DELETE AS
BEGIN
 DELETE FROM Feedbacks
 WHERE ProductId IN (SELECT Id FROM deleted)

 DELETE FROM ProductsIngredients
 WHERE ProductId IN (SELECT Id FROM deleted)

 DELETE FROM Products
 WHERE  Id IN (SELECT Id FROM deleted)

END