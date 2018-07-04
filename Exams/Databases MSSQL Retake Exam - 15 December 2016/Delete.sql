DELETE FROM Locations
WHERE
( 
 SELECT COUNT(u.Id) FROM Users AS u
 LEFT JOIN Locations AS l ON l.Id =u.LocationId
) = 0