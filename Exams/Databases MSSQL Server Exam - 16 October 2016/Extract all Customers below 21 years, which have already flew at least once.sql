SELECT c.CustomerID,
CONCAT(c.FirstName,' ',c.LastName) AS FullName,
DATEDIFF(YEAR,c.DateOfBirth,'2016/01/01') AS Age
 FROM Customers AS c
   JOIN Tickets AS t ON t.CustomerID = c.CustomerID
   JOIN Flights AS f ON t.FlightID = f.FlightID
 WHERE DATEDIFF(YEAR,c.DateOfBirth,'2016/01/01') < 21
 GROUP BY c.CustomerID,c.FirstName,c.LastName,c.DateOfBirth
 HAVING (
  SELECT  COUNT(*) FROM Flights
  WHERE Status = 'Arrived'
 ) > 0
ORDER BY Age DESC,c.CustomerID
