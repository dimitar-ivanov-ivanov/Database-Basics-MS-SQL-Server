SELECT cu.CustomerID,cu.Height FROM Customers AS cu
LEFT JOIN Accounts AS a ON a.CustomerID = cu.CustomerID
WHERE a.AccountID IS NULL AND cu.Height BETWEEN 1.74 AND 2.04