CREATE TRIGGER  tr_DeleteProducts ON Products FOR DELETE
AS
BEGIN
 DELETE FROM Feedbacks WHERE ProductId IN
 (SELECT Id FROM deleted)

 DELETE FROM ProductsIngredients WHERE ProductId IN
 (SELECT Id FROM deleted)
END