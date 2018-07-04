SELECT p.Title,c.Name AS [Category Name],ca.Model,m.Name AS [Manufacturer Name],
ca.Megapixels,ca.Price
FROM Photographs AS p
JOIN Categories AS c ON c.Id = p.CategoryId
JOIN Equipments AS e ON e.Id = p.EquipmentId
JOIN Cameras AS ca ON ca.Id = e.CameraId
JOIN Manufacturers  AS m ON m.Id = ca.ManufacturerId
GROUP BY p.Title,c.Name,ca.Model,m.Name,ca.Megapixels,ca.Price
ORDER BY ca.Price DESC,p.Title