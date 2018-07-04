SELECT a.AirportID,a.AirportName,COUNT(t.TicketID) AS Passengers
FROM Airports AS a
JOIN Flights  AS f ON f.OriginAirportID = a.AirportID
JOIN Tickets  AS t ON t.FlightID = f.FlightID
WHERE f.Status = 'Departing'
GROUP BY a.AirportID,a.AirportName
HAVING COUNT(t.TicketID) > 0
