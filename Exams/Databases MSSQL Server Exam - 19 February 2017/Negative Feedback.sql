SELECT f.ProductId AS ProductId,f.Rate,f.Description,c.Id as CustomerId,c.Age,c.Gender 
FROM Feedbacks as f
JOIN Customers AS c ON c.Id = f.CustomerId
WHERE f.Rate  < 5
ORDER BY ProductId DESC,f.Rate