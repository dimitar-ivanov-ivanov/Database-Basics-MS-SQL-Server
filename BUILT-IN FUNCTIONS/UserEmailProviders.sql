SELECT 
 Username,
 SUBSTRING(Email,CHARINDEX('@',Email) + 1,LEN(Email) - CHARINDEX('@',Email) + 1) AS EmailProvider
 FROM Users
ORDER BY EmailProvider,Username