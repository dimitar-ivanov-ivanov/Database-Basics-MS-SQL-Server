SELECT TOP 3 cu.CustomerID,
CONCAT(cu.FirstName,' ',cu.LastName) AS FullName,
t.Price AS TicketPrice,
a.AirportName AS Destination
FROM Customers AS cu
JOIN Tickets AS t ON t.CustomerID = cu.CustomerID
JOIN Flights AS f ON f.FlightID = t.FlightID
JOIN Airports AS a ON a.AirportID = f.DestinationAirportID
WHERE f.Status = 'Delayed'
ORDER BY t.Price DESC,cu.CustomerID