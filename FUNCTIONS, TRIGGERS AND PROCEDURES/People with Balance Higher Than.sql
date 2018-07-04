CREATE PROC usp_GetHoldersWithBalanceHigherThan(@amount money) AS
 SELECT FirstName,LastName FROM AccountHolders AS ah
 JOIN Accounts AS a ON a.AccountHolderId =  ah.Id
 GROUP BY FirstName,LastName
 HAVING SUM(a.Balance) > @amount