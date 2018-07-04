SELECT p.PeakName,m.MountainRange,p.Elevation FROM Peaks as p
JOIN Mountains as m ON m.Id = p.MountainId
ORDER BY Elevation DESC,PeakName