SELECT p.Title,c.Model AS CameraModel,l.Model AS LensModel FROM Photographs AS p
JOIN Equipments AS e ON e.Id = p.EquipmentId
JOIN Cameras AS c ON c.Id = e.CameraId
JOIN Lenses AS l ON e.LensId = l.Id
ORDER BY p.Title