CREATE FUNCTION udf_GetRating(@name nvarchar(250))
RETURNS varchar(250)
BEGIN

 DECLARE @rate decimal(4,2) = (
  SELECT AVG(f.Rate) FROM Feedbacks AS f
  JOIN Products AS p ON p.Id = f.ProductId
  WHERE p.Name = @name
 )

 IF(@rate IS NULL) RETURN 'No rating'

 IF(@rate <= 5) RETURN 'Bad'
 ELSE IF(@rate <= 8) RETURN 'Average'
 
 RETURN 'Good'

END