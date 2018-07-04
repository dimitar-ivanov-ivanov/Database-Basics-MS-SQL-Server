SELECT CONCAT(FirstName,' ',LastName) AS Mechanic,
AVG(DATEDIFF(DAY,j.IssueDate,FinishDate)) AS [Average Days]
FROM Mechanics AS m
JOIN Jobs AS j ON j.MechanicId = m.MechanicId
GROUP BY FirstName,LastName,m.MechanicId
ORDER BY m.MechanicId