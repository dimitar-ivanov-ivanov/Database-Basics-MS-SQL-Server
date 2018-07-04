SELECT DISTINCT c.CustomerID,CONCAT(c.FirstName,' ',c.LastName ) AS FullName,
t.TownName AS HomeTown
FROM Customers AS  c
JOIN Tickets AS tt ON tt.CustomerID = c.CustomerID
JOIN Flights AS f ON tt.FlightID  = f.FlightID
JOIN Towns AS t ON t.TownID = c.HomeTownID AND f.OriginAirportID = t.TownID
WHERE f.Status = 'Departing'
ORDER BY CustomerID