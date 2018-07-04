SELECT m.Name,SUM(l.Price) AS [Total Price] FROM Manufacturers AS m
JOIN Lenses AS l ON l.ManufacturerId = m.Id
GROUP BY m.Name
ORDER BY m.Name