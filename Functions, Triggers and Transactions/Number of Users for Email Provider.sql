Select RIGHT(Email,LEN(Email) - CHARINDEX('@',Email)) AS EmailProvider,
 COUNT(*) AS NumberOfUsers
From Users
GROUP BY RIGHT(Email,LEN(Email) - CHARINDEX('@',Email))
ORDER BY NumberOfUsers DESC,EmailProvider