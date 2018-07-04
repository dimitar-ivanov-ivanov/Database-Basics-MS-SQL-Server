SELECT t.TeamName AS [Home Team],t1.TeamName AS [Away Team],im.MatchDate AS [Match Date]
FROM InternationalMatches AS im
LEFT JOIN Teams AS t ON t.CountryCode = im.AwayCountryCode
LEFT JOIN Teams AS t1 ON t1.CountryCode = im.HomeCountryCode
ORDER BY [Match Date] DESC