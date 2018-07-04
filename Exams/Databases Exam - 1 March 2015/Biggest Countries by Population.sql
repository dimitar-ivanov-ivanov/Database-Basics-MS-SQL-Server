SELECT TOP 30 c.CountryName,c.Population FROM Countries AS c
JOIN Continents AS cn  ON c.ContinentCode = cn.ContinentCode
WHERE cn.ContinentName = 'Europe'
ORDER BY c.Population DESC,c.CountryName