CREATE FUNCTION udf_ConcatString
(@first varchar(255),@second nvarchar(255)) 
RETURNS nvarchar(255)
BEGIN
 RETURN CONCAT(REVERSE(@first),REVERSE(@second));
END