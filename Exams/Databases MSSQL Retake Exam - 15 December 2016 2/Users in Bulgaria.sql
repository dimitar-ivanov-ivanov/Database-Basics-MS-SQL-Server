SELECT u.Nickname,c.Title,l.Latitude,l.Longitude 
FROM Users AS u
JOIN Locations AS l ON l.Id = u.LocationId
JOIN UsersChats AS uc ON uc.UserId = u.Id
JOIN Chats AS c ON c.Id = uc.ChatId
WHERE l.Latitude >= 41.13999 AND l.Latitude <= 44.12999
AND l.Longitude >= 22.20999 AND l.Longitude <= 28.35999
ORDER BY Title
