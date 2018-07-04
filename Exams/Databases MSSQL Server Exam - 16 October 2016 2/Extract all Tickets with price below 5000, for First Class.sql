SELECT t.TicketID,a.AirportName AS Destination,
CONCAT(cu.FirstName,' ',cu.LastName) AS CustomerName
FROM Tickets  AS t
JOIN Customers AS cu  ON cu.CustomerID = t.CustomerID
JOIN Flights AS f ON f.FlightID = t.FlightID
JOIN Airports AS a ON a.AirportID =f.DestinationAirportID
WHERE t.Price < 5000 AND t.Class = 'First' 
ORDER BY t.TicketID