CREATE FUNCTION udf_ConcatString (@first varchar(max),@second varchar(max))
RETURNS varchar(max)
BEGIN
 RETURN CONCAT(@first,' ',@second);
END 