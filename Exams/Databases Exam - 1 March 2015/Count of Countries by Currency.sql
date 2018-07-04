SELECT cu.CurrencyCode,cu.Description AS Currency,
COUNT(c.CountryCode) AS NumberOfCountries,
FROM  Currencies AS cu
JOIN Countries AS c ON c.CurrencyCode = cu.CurrencyCode
GROUP BY cu.CurrencyCode,cu.Description
ORDER BY NumberOfCountries DESC,cu.Description