UPDATE Cameras
SET Price  += (SELECT AVG(c.Price) * LEN(m.Name) /100 FROM Cameras AS c JOIN Manufacturers  
AS m ON c.ManufacturerId  = m.Id
GROUP BY m.Name)