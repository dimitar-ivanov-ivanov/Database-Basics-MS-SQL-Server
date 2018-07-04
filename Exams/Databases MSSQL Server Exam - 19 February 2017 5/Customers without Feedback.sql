SELECT CONCAT(cu.FirstName,' ',cu.LastName) AS [CustomerName],
cu.PhoneNumber,cu.Gender 
FROM Customers AS cu
LEFT JOIN Feedbacks AS f ON f.CustomerId = cu.Id
WHERE f.Id IS NULL
ORDER BY cu.Id