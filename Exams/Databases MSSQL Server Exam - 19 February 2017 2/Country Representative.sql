--SELECT d.Name,d.CountryId FROM Distributors AS d
--JOIN Ingredients AS i ON i.DistributorId = d.Id
--GROUP BY d.Name,d.CountryId
--ORDER BY COUNT(i.Id) DESC

SELECT c.Name FROM Countries AS c
