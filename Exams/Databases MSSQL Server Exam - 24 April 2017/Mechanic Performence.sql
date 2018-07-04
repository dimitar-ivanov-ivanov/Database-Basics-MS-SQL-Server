SELECT CONCAT(m.FirstName,' ',m.LastName) AS Mechanic,
AVG(DATEDIFF(DAY,j.IssueDate,j.FinishDate)) AS [Average Days] FROM Mechanics AS m
JOIN Jobs as j ON j.MechanicId = m.MechanicId
GROUP BY m.FirstName,m.LastName,m.MechanicId
ORDER BY m.MechanicId