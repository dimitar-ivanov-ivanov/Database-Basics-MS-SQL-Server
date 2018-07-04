SELECT m.Name FROM Manufacturers AS m
LEFT JOIN Lenses AS l ON l.ManufacturerId = m.Id
LEFT JOIN  Cameras AS c ON c.ManufacturerId = m.Id
WHERE c.Id IS NULL AND l.Id IS NULL
GROUP BY m.Name
ORDER BY m.Name
