SELECT p.Name AS ProductName,AVG(F.Rate) AS ProductAverageRate,
d.Name,con.Name AS DistributorCountry
FROM Products AS p
JOIN Feedbacks AS f ON f.ProductId = p.Id
JOIN ProductsIngredients AS pii ON pii.ProductId =p.Id
JOIN Ingredients AS i ON i.Id = pii.IngredientId
JOIN Distributors AS d ON d.Id = i.DistributorId
JOIN Countries AS con ON con.Id = d.CountryId
WHERE  i.Id IN (
 SELECT i1.Id FROM Ingredients AS i1
 JOIN Distributors AS d ON d.Id = i1.DistributorId 
 GROUP BY i1.Id
 HAVING COUNT(d.Id) = 1
)
GROUP  BY p.Id,p.Name,d.Name,con.Name
ORDER BY p.Id