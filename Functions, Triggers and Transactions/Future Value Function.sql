CREATE FUNCTION ufn_CalculateFutureValue(@sum money,@yearlyInterestRate float,@years int)
RETURNS money AS
BEGIN
 return @sum * power(1 +  @yearlyInterestRate,@years);
END;

SELECT dbo.ufn_CalculateFutureValue(1000, 0.10, 5) AS FV