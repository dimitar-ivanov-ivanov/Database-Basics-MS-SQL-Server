SELECT  CONCAT(FirstName,' ',LastName) AS Client,
DATEDIFF(DAY,IssueDate,'04/24/2017') AS [Days going],
Status
FROM Clients AS c
JOIN Jobs AS j ON c.ClientId = j.ClientId
WHERE Status != 'Finished'