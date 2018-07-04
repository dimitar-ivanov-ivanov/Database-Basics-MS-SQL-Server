SELECT p.PeakName,m.MountainRange,c.CountryName,cn.ContinentName 
FROM Peaks as p
JOIN Mountains AS m ON  m.Id = p.MountainId
JOIN MountainsCountries AS mc ON mc.MountainId = m.Id
JOIN Countries AS c ON c.CountryCode = mc.CountryCode
JOIN Continents AS cn ON c.ContinentCode = cn.ContinentCode
ORDER BY PeakName,ContinentName 