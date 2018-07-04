SELECT Available FROM
(SELECT DISTINCT m.MechanicId,CONCAT(m.FirstName,' ',m.LastName) AS Available 
FROM Mechanics AS m
LEFT JOIN Jobs AS j ON j.MechanicId = m.MechanicId
WHERE j.JobId IS NULL OR j.Status = 'Finished') AS  am
ORDER BY am.MechanicId