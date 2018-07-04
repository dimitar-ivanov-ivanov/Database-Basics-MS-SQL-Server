INSERT INTO Messages(Content,SentOn,ChatId,UserId)
(
 SELECT 
 CONCAT(u.Age,'-',u.Gender,'-',l.Latitude,'-',l.Longitude),
 GETDATE(),
 CEILING(
 CASE
  WHEN u.Gender = 'F' THEN SQRT(u.Age * 2)
  ELSE POWER(u.Age / 18,3)
 END),
 u.Id
 FROM Users AS u
 JOIN Locations AS l ON l.Id = u.LocationId
 WHERE u.Id BETWEEN 10 AND 20
)