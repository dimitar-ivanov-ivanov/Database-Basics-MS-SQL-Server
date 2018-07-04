SELECT u.FullName,m.Name AS Manufacturer,c.Model AS [Camera Model],c.Megapixels FROM Users AS u
JOIN Equipments AS e ON e.Id = u.EquipmentId
JOIN Cameras AS c ON c.Id = e.CameraId
JOIN Manufacturers  AS m ON m.Id = c.ManufacturerId
WHERE c.Year < 2015
ORDER BY u.FullName

--SELECT u.FullName,m.Name AS Manufacturer,c.Model,c.Megapixels FROM Manufacturers AS m
--JOIN Cameras AS c ON c.ManufacturerId = m.Id
--JOIN Equipments AS e ON e.CameraId = c.Id
--JOIN Users AS u  ON u.EquipmentId = e.Id
--WHERE c.Year  < 2015
--ORDER BY u.FullName