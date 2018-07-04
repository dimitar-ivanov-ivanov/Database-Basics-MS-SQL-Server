SELECT cn.ContinentName,SUM(CONVERT(bigint,c.AreaInSqKm)) AS CountriesArea,
SUM(CONVERT(bigint,c.Population)) AS CountriesPopulation
FROM Continents AS cn
LEFT JOIN Countries AS c ON c.ContinentCode = cn.ContinentCode
GROUP BY cn.ContinentName
ORDER BY CountriesPopulation DESC