SELECT t.TicketID,a.AirportName AS Destination,
CONCAT(c.FirstName,' ',c.LastName) AS CustomerName 
FROM  Tickets AS t
JOIN Customers AS c ON c.CustomerID = t.CustomerID
JOIN Towns AS tt ON tt.TownID = c.HomeTownID
JOIN Flights AS f ON f.FlightID = t.FlightID
JOIN Airports AS a ON a.AirportID = f.DestinationAirportID
WHERE t.Price < 5000 AND t.Class = 'First'
ORDER BY t.TicketID