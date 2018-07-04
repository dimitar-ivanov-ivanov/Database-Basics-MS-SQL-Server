SELECT DISTINCT TOP 5 a.AirlineID,AirlineName,Nationality,Rating FROM Airlines 
AS a
LEFT JOIN Flights AS f ON f.AirlineID = a.AirlineID
WHERE f.FlightID IS NOT NULL
ORDER BY Rating DESC,a.AirlineID