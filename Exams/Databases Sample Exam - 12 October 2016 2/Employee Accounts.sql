SELECT TOP 5 e.EmployeeID,e.FirstName,a.AccountNumber FROM Employees AS e
JOIN EmployeesAccounts AS ea ON ea.EmployeeID = e.EmployeeID
JOIN Accounts AS a ON a.AccountID = ea.AccountID
WHERE YEAR(a.StartDate) > 2012
ORDER BY e.FirstName DESC