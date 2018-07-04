SELECT CountryName AS [Country Name],IsoCode AS [ISO Code]FROM Countries AS c
WHERE LEN(CountryName) - LEN(REPLACE(CountryName,'A','')) >= 3 OR
 LEN(CountryName) - LEN(REPLACE(CountryName,'a','')) = 3
 ORDER BY IsoCode