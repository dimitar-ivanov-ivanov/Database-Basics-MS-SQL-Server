CREATE PROC usp_GetTownsStartingWith (@startingWith varchar(max))
AS
  SELECT Name AS Town
  FROM Towns
  WHERE Name LIKE CONCAT(@startingWith, '%')

--exec usp_GetTownsStartingWith 'b';