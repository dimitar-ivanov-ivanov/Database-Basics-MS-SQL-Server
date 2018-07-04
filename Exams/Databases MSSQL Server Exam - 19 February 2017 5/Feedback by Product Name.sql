CREATE FUNCTION udf_GetRating(@Name nvarchar(30))
RETURNS nvarchar(30)
BEGIN
 DECLARE @Rating decimal(4,2) = (
  SELECT AVG(f.Rate) FROM Products AS p
  JOIN Feedbacks AS f  ON f.ProductId = p.Id
  WHERE p.Name  = @Name
 )

 IF(@Rating IS NULL)
 BEGIN
  RETURN 'No rating';
 END

  IF(@Rating  < 5 )
  BEGIN
   RETURN 'Bad';
  END
  ELSE IF(@Rating BETWEEN 5 AND 8 )
  BEGIN
   RETURN 'Average';
  END

  RETURN 'Good';
END 