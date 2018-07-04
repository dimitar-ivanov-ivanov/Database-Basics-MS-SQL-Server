SELECT TOP 5 c.CountryName,r.RiverName  FROM Countries AS c
LEFT JOIN CountriesRivers AS cr ON cr.CountryCode = c.CountryCode
LEFT JOIN Rivers AS r ON r.Id = cr.RiverId
JOIN Continents AS con  ON con.ContinentCode = c.ContinentCode
WHERE con.ContinentName = 'Africa'
ORDER BY c.CountryName