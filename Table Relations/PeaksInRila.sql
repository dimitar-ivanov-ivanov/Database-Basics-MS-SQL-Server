SELECT m.MountainRange,p.PeakName,p.Elevation 
FROM Mountains as m
JOIN Peaks as p ON p.MountainID = m.Id
WHERE m.MountainRange = 'Rila'
ORDER BY p.Elevation DESC