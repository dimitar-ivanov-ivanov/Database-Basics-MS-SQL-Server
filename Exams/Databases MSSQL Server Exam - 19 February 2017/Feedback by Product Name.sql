CREATE Function udf_GetRating(@name varchar(200))
RETURNS varchar(200)
BEGIN
 DECLARE @rating int = (
   SELECT AVG(Rate) FROM Feedbacks as f
   JOIN Products AS p ON f.ProductId = p.Id
   WHERE p.Name = @name
 )

 IF(@rating IS NULL) RETURN 'No rating';

 IF(@rating < 5) RETURN 'Bad';
 ELSE IF(@rating <= 8) RETURN 'Average';
  RETURN 'Good';
END

--SELECT TOP 5 Id, Name, dbo.udf_GetRating(Name)
--  FROM Products
-- ORDER BY Id


