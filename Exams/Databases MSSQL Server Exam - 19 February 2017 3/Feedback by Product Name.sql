CREATE FUNCTION udf_GetRating(@ProductName nvarchar(25))
RETURNS varchar(30)
BEGIN
 DECLARE @Rate decimal(18,2) = (SELECT AVG(f.Rate) 
 FROM Feedbacks AS f
 JOIN Products AS p ON p.Id = f.ProductId
 WHERE p.Name = @ProductName);

 IF(@Rate IS NULL) RETURN 'No rating';
 
 IF(@Rate <=5 ) RETURN 'Bad';
 ELSE IF(@Rate <= 8) RETURN 'Average';

 RETURN 'Good';
END

--SELECT TOP 5 Id, Name, dbo.udf_GetRating(Name)
--  FROM Products
-- ORDER BY Id
