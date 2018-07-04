WITH CustomersWithAtleast3Feedbacks_CTE (CustomerId) AS
(
 SELECT cu.Id FROM Customers AS cu
 JOIN Feedbacks AS f ON f.CustomerId = cu.Id
 GROUP BY cu.Id
 HAVING COUNT(f.Id) >=3
)

SELECT f.ProductId,CONCAT(cu.FirstName,' ',cu.LastName) AS CustomerName,
ISNULL(f.Description,'') AS FeedbackDescription 
FROM CustomersWithAtleast3Feedbacks_CTE AS cf
JOIN Customers AS cu ON cu.Id = cf.CustomerId
JOIN Feedbacks AS f ON f.CustomerId = cu.Id
ORDER BY f.ProductId,CustomerName,f.Id