SELECT CONCAT(m.FirstName,' ',m.LastName) AS Mechanic,
AVG(DATEDIFF(DAY,j.IssueDate,j.FinishDate)) 
FROM Mechanics AS m
JOIN Jobs AS j ON j.MechanicId = m.MechanicId
WHERE j.Status = 'Finished'
GROUP BY m.FirstName,m.LastName,m.MechanicId
ORDER BY m.MechanicId