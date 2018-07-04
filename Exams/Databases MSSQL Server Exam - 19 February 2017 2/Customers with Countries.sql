CREATE VIEW v_UserWithCountries AS
SELECT CONCAT(FirstName,' ',LastName) AS CustomerName,Age,Gender,c.Name AS CountryName
FROM Customers AS cu
JOIN Countries AS c ON c.Id = cu.CountryId