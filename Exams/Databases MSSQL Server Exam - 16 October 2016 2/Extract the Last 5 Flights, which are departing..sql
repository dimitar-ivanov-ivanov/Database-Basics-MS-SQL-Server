SELECT TOP 5 WITH TIES f.FlightID,f.DepartureTime,f.ArrivalTime,
a.AirportName AS Origin,a1.AirportName AS Destination 
FROM (
 SELECT TOP 5 FlightID,DepartureTime,ArrivalTime,OriginAirportID,DestinationAirportID FROM Flights
 WHERE Status = 'Departing'
 ORDER BY DepartureTime DESC 
) 
AS f
JOIN Airports AS a ON a.AirportID = f.OriginAirportID
JOIN Airports AS a1 ON a1.AirportID = f.DestinationAirportID
ORDER  BY DepartureTime,f.FlightID