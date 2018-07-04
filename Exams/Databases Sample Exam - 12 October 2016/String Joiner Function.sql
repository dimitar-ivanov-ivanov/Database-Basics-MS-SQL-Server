CREATE FUNCTION udf_ConcatString(@first varchar(255),@second varchar(255))
RETURNS varchar(255)
BEGIN
 DECLARE @res varchar(255) = CONCAT(REVERSE(@first),REVERSE(@second));
 RETURN @res;
END

--GO
--testing
--SELECT dbo.udf_ConcatString('1234', '5678');