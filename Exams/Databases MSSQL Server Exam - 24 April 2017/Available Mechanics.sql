SELECT CONCAT(m.FirstName,' ',m.LastName) AS Available FROM Mechanics  AS m
JOIN Jobs AS j ON j.MechanicId = m.MechanicId
WHERE j.Status != 'In Progress' 
GROUP BY m.FirstName,m.LastName,m.MechanicId
ORDER BY m.MechanicId