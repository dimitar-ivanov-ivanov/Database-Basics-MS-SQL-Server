SELECT f.ProductId,f.Rate,f.Description,f.CustomerId,cu.Age,cu.Gender 
FROM Feedbacks AS f
JOIN Customers AS cu ON cu.Id = f.CustomerId
WHERE f.Rate < 5
ORDER BY f.ProductId DESC,f.Rate