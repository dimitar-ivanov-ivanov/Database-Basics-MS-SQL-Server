SELECT p.Name AS ProductName,AVG(f.Rate) AS ProductAverageRate,
pd.DistributorName,pd.DistributorCountry
FROM
(SELECT i.Id AS IngredientId,
d.Name AS DistributorName,
con.Name AS DistributorCountry FROM Ingredients AS i
JOIN Distributors AS d ON d.Id = i.DistributorId
JOIN Countries AS con ON con.Id = d.CountryId
GROUP BY i.Id,d.Name,con.Name
HAVING COUNT(d.Id) = 1) AS pd

JOIN ProductsIngredients AS pi ON pi.IngredientId  = pd.IngredientId
JOIN Products AS p ON p.Id = pi.ProductId
JOIN Feedbacks AS f ON f.ProductId = p.Id
GROUP BY p.Name,pd.DistributorName,pd.DistributorCountry,p.Id
ORDER BY p.Id