SELECT TOP 5 f.FlightID,f.DepartureTime,f.ArrivalTime,
a.AirportName AS Origin,a2.AirportName AS Destination
 FROM Flights AS f
JOIN Airports AS a ON a.AirportID = f.OriginAirportID
JOIN Airports AS a2 ON a2.AirportID = f.DestinationAirportID
WHERE f.Status = 'Departing'
ORDER BY f.DepartureTime,f.FlightID