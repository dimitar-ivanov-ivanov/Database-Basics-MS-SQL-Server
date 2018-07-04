SELECT cu.CustomerID,l.Amount FROM  Customers AS cu
JOIN Loans AS l ON l.CustomerID = cu.CustomerID
WHERE l.Amount > (
 SELECT AVG(l.Amount) FROM Customers AS  cu
 JOIN Loans AS l ON l.CustomerID =  cu.CustomerID
 WHERE cu.Gender = 'M'
)
ORDER BY cu.LastName