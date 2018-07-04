SELECT f.ProductId,CONCAT(c.FirstName,' ',c.LastName) AS CustomerName,
ISNULL(f.Description,'') AS FeedbackDescription
FROM Feedbacks AS f
JOIN Customers AS c ON c.Id = f.CustomerId
WHERE c.Id IN (
 SELECT c.Id FROM Customers  AS  c
 JOIN Feedbacks AS f ON f.CustomerId = c.Id
 GROUP BY c.Id
 HAVING COUNT(f.Id) >= 3
)
ORDER BY f.ProductId,CustomerName,f.Id
