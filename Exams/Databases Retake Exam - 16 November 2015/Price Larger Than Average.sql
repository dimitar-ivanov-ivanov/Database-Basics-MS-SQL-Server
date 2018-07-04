SELECT m.Name,c.Model,c.Price FROM Manufacturers AS m
JOIN Cameras AS c ON c.ManufacturerId = m.Id
WHERE c.Price > (SELECT AVG(Price) FROM Cameras WHERE Price IS NOT NULL)
ORDER BY c.Price DESC,c.Model