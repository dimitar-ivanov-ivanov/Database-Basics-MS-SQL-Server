SELECT DISTINCT cu.CustomerID,CONCAT(cu.FirstName,' ',cu.LastName) AS FullName,
2016 - YEAR(DateOfBirth) AS Age 
FROM Customers AS cu
JOIN Tickets AS t ON t.CustomerID = cu.CustomerID
JOIN Flights AS f ON f.FlightID =t.FlightID
WHERE f.Status = 'Arrived' AND YEAR(f.DepartureTime) < 2016 
AND 2016 - YEAR(DateOfBirth) < 21
ORDER BY Age DESC,cu.CustomerID