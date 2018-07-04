SELECT DISTINCT c.CustomerID,CONCAT(c.FirstName,' ',c.LastName ) AS FullName,
DATEDIFF(YEAR,c.DateOfBirth,'01-01-2016') AS Age
FROM Customers AS  c
JOIN Tickets AS tt ON tt.CustomerID = c.CustomerID
JOIN Flights AS f ON tt.FlightID  = f.FlightID
WHERE f.Status = 'Departing'
ORDER BY Age,CustomerID