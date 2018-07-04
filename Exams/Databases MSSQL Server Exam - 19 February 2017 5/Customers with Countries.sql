CREATE VIEW v_UserWithCountries  AS
 SELECT CONCAT(cu.FirstName,' ',cu.LastName) AS CustomerName,
 cu.Age,cu.Gender,con.Name AS CountryName 
 FROM Countries AS con
 JOIN Customers AS cu ON cu.CountryId = con.Id