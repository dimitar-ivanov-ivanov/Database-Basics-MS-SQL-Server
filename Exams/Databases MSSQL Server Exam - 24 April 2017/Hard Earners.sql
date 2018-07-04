SELECT TOP 3 CONCAT(m.FirstName,' ',m.LastName),COUNT(j.JobId) AS Jobs
 FROM Mechanics AS m
JOIN Jobs AS j ON j.MechanicId = m.MechanicId
WHERE j.Status != 'Finished'
GROUP BY m.FirstName,m.LastName,m.MechanicId
HAVING COUNT(j.JobId) > 1
ORDER BY COUNT(j.JobId) DESC,m.MechanicId