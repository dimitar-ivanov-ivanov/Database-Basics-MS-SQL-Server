CREATE FUNCTION udf_GetRadians(@Degrees float)
RETURNS Float
BEGIN
 RETURN @Degrees * PI() / 180; 
END