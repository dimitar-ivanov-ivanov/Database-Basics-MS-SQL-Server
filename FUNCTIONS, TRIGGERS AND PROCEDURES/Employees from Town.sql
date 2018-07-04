CREATE PROC usp_GetEmployeesFromTown(@Name varchar(50)) AS
 SELECT FirstName,LastName FROM Employees AS e
 JOIN Addresses  AS a ON a.AddressID = e.AddressID
 JOIN Towns AS t ON t.TownID = a.TownID
 WHERE t.Name = @Name

-- EXEC usp_GetEmployeesFromTown 'Sofia';