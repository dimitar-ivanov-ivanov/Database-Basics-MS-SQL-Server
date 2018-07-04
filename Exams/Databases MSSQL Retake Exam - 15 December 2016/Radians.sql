CREATE FUNCTION dbo.udf_GetRadians(@degrees float)
RETURNS float
BEGIN
 RETURN	@degrees * PI() / 180;
END

--SELECT dbo.udf_GetRadians(22.12) AS Radians