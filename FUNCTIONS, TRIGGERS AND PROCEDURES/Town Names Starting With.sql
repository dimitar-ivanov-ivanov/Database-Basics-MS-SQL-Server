--CREATE PROC usp_GetTownsStartingWith(@start varchar(50)) AS
-- SELECT Name FROM Towns
-- WHERE LEFT(Name,LEN(@start)) = @start

--EXEC usp_GetTownsStartingWith 'b';