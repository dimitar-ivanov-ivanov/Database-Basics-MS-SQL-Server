SELECT p.Name AS ProductName,AVG(f.Rate) AS ProductAverageRate,
 d.Name AS DistributorName,c.Name AS DistributorCountry  
  FROM Products AS p
JOIN Feedbacks AS f ON f.ProductId = p.Id
JOIN ProductsIngredients AS pii ON pii.ProductId = p.Id
JOIN Ingredients AS i ON i.Id = pii.IngredientId
JOIN Distributors as d ON i.DistributorId = d.Id
JOIN Countries AS c ON c.Id = d.CountryId
GROUP BY p.Name,d.Name,c.Name,p.Id
HAVING COUNT(i.DistributorId) = 1
ORDER BY p.Id