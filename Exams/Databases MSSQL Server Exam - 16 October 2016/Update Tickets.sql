 
DECLARE @highestRatedAirline int = ( 
 SELECT TOP 1 a.AirlineID FROM Airlines AS a
 ORDER BY a.Rating DESC
)

UPDATE Tickets
SET Price += Price * 50/100
WHERE FlightID IN (
 SELECT f.FlightID FROM Flights AS f
 WHERE  f.AirlineID = @highestRatedAirline
)