SELECT cu.CustomerID,CONCAT(FirstName,' ',LastName) AS FullName,
t.TownName AS HomeTown
FROM Customers AS cu
JOIN Towns AS t ON t.TownID = cu.HomeTownID
JOIN Tickets AS ti ON ti.CustomerID = cu.CustomerID
JOIN Flights AS f ON f.FlightID = ti.FlightID
JOIN Airports AS a ON a.AirportID = f.OriginAirportID AND a.TownID = t.TownID
WHERE f.Status = 'Departing'
ORDER BY cu.CustomerID