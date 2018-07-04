UPDATE Tickets
SET Price += Price / 2
WHERE TicketID IN (
 SELECT t.TicketID FROM Flights AS f
 JOIN Tickets AS t ON t.FlightID = f.FlightID
 WHERE f.AirlineID IN (
  SELECT TOP 1 AirlineID FROM Airlines ORDER BY Rating DESC
 )
)
