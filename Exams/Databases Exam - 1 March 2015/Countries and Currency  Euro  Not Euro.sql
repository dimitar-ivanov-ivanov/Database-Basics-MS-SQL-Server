SELECT c.CountryName,c.CountryCode,
CASE
 WHEN cu.CurrencyCode = 'EUR' THEN 'Euro'
 ELSE 'Not Euro'
END AS Currency
FROM Countries AS c
JOIN Currencies AS cu ON cu.CurrencyCode = c.CurrencyCode
WHERE c.CurrencyCode IS NOT NULL
ORDER BY c.CountryName