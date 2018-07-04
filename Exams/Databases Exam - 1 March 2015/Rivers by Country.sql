SELECT c.CountryName,cn.ContinentName,
COUNT(r.Id) AS RiversCount,
ISNULL(SUM(r.Length),0) AS TotalLength
FROM Countries AS c
LEFT JOIN Continents AS cn ON cn.ContinentCode = c.ContinentCode
LEFT JOIN CountriesRivers AS cr ON  cr.CountryCode = c.CountryCode
LEFT JOIN Rivers AS r ON r.Id =  cr.RiverId
GROUP BY c.CountryName,cn.ContinentName
ORDER BY RiversCount DESC,TotalLength DESC,c.CountryName