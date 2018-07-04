SELECT CountryName,CountryCode,
CASE
 WHEN CurrencyCode = 'EUR' THEN 'Inside'
 ELSE 'Outside'
END AS Eurozone
FROM Countries
ORDER BY CountryName