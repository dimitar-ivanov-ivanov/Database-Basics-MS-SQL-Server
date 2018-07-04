SELECT c.CustomerId,Height FROM Customers AS c
LEFT JOIN Accounts AS a ON c.CustomerID = a.CustomerID
WHERE Height BETWEEN 1.74 AND 2.04 AND a.CustomerID IS NULL