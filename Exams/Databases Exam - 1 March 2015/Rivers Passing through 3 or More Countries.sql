SELECT r.RiverName AS River,COUNT(c.CountryCode) AS [Countries Count] FROM Rivers AS r
JOIN CountriesRivers AS cr ON cr.RiverId = r.Id
JOIN Countries AS c ON c.CountryCode = cr.CountryCode
GROUP BY r.RiverName
HAVING COUNT(c.CountryCode)  >= 3
ORDER BY r.RiverName