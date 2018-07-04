SELECT TOP 5 c.CustomerID,l.Amount AS Amount FROM Customers AS c
JOIN Loans AS l ON c.CustomerID = l.CustomerID
WHERE l.Amount > (
 SELECT AVG(l.Amount) FROM Customers AS c
 JOIN Loans AS l ON l.CustomerID = c.CustomerID
 WHERE Gender = 'M'
)
ORDER BY c.LastName