SELECT f.ProductId,CONCAT(c.FirstName,' ',c.LastName) AS [Customer Name],
ISNULL(f.Description,'') AS FeedbackDescription
FROM Customers AS c
LEFT JOIN Feedbacks AS f ON f.CustomerId = c.Id
JOIN(
 SELECT cu.Id FROM Customers AS cu
 LEFT JOIN Feedbacks AS f1 ON f1.CustomerId = cu.Id
 GROUP BY cu.Id
 HAVING COUNT(f1.Id) >= 3
) AS topCust ON f.CustomerId = topCust.Id

ORDER BY f.ProductId,[Customer Name],f.Id