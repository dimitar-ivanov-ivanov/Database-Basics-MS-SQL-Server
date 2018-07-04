--CREATE FUNCTION ufn_GetSalaryLevel(@Salary decimal(18,4))
--RETURNS varchar(20) AS
--BEGIN
-- IF(@Salary < 30000)
-- BEGIN
--  RETURN 'Low';
-- END
-- ELSE IF(@Salary <= 50000)
-- BEGIN
--  RETURN 'Average';
-- END

-- RETURN 'High';
--END

SELECT Salary,dbo.ufn_GetSalaryLevel(Salary) FROM Employees