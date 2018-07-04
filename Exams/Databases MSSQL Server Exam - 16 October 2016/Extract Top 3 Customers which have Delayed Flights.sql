SELECT TOP 3 c.CustomerID,CONCAT(c.FirstName,' ',c.LastName) AS FullName,
t.Price,a.AirportName AS Destination
FROM Customers  AS c
JOIN Tickets AS t ON t.CustomerID = c.CustomerID
JOIN Flights AS f ON f.FlightID = t.FlightID
JOIN Airports AS a ON f.DestinationAirportID = a.AirportID
WHERE f.Status = 'Delayed'
ORDER BY t.Price DESC,c.CustomerID