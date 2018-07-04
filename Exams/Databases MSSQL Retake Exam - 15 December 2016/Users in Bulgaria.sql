SELECT u.Nickname,c.Title,l.Latitude,l.Longitude FROM Users AS u
JOIN UsersChats  AS uc ON uc.UserId = u.Id
JOIN Chats AS c ON c.Id = uc.ChatId
JOIN Locations AS l on l.Id = u.LocationId
WHERE l.Latitude BETWEEN 41.14 AND 44.13 
AND l.Longitude BETWEEN 22.21 AND 28.36
ORDER BY c.Title