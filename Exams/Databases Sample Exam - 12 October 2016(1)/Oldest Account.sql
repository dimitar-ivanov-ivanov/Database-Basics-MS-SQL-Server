SELECT TOP 1 cu.CustomerID,cu.FirstName,a.StartDate 
FROM Customers AS cu
JOIN Accounts AS a ON a.CustomerID = cu.CustomerID
ORDER BY a.StartDate