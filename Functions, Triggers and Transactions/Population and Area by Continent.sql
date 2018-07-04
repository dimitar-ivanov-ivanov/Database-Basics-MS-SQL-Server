SELECT cn.ContinentName,
SUM(c.AreaInSqKm) AS CountriesArea,
SUM(CAST(c.Population AS float)) AS CountriesPopulation 
FROM Continents as cn
LEFT JOIN Countries as c ON c.ContinentCode = cn.ContinentCode
GROUP BY cn.ContinentName
ORDER BY CountriesPopulation DESC