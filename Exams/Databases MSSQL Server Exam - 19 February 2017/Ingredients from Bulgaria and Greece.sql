SELECT TOP 15 i.Name,i.Description,c.Name FROM Ingredients as i
JOIN Countries as c ON c.Id = i.OriginCountryId
WHERE c.Name IN ('Bulgaria','Greece')
ORDER BY i.Name,c.Name