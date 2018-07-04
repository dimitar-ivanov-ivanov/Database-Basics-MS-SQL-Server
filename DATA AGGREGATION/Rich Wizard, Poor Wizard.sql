DECLARE @currentDeposit DECIMAL(8,2)
DECLARE @previousDeposit DECIMAL(8,2)
DECLARE @sumDifferences DECIMAL(8,2) = 0
DECLARE wizardCursor CURSOR FOR SELECT DepositAmount FROM WizzardDeposits

OPEN wizardCursor
FETCH NEXT FROM wizardCursor INTO @currentDeposit
WHILE (@@FETCH_STATUS = 0)
BEGIN
  IF (@previousDeposit IS NOT NULL)
  BEGIN
    SET @sumDifferences += @previousDeposit - @currentDeposit
  END
  SET @previousDeposit = @currentDeposit
  FETCH NEXT FROM wizardCursor INTO @currentDeposit
END
CLOSE wizardCursor
DEALLOCATE wizardCursor

SELECT @sumDifferences AS SumDifference