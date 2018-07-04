SELECT c.ContinentCode,c.CurrencyCode,COUNT(c.CountryCode) AS CurrencyUsage
FROM Countries AS c
JOIN Currencies AS cu ON cu.CurrencyCode = c.CurrencyCode
JOIN Continents AS con ON con.ContinentCode = c.ContinentCode
WHERE c.CurrencyCode NOT IN (
 SELECT c.CurrencyCode FROM Countries AS c
 JOIN Currencies  AS cu ON cu.CurrencyCode = c.CurrencyCode
 GROUP BY c.CurrencyCode
 HAVING COUNT(c.CountryCode) = 1
)
GROUP BY c.ContinentCode,c.CurrencyCode