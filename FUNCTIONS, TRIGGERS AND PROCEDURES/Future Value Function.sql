CREATE FUNCTION ufn_CalculateFutureValue(@sum decimal(18,2),
@yearlyInterestRate float,@numberOfYears int)
RETURNS money
BEGIN
 RETURN @sum * POWER(1 + @yearlyInterestRate,@numberOfYears);
END