SELECT TOP 10 a.Content AS Answer,a.CreatedOn,u.Username FROM Answers AS a
JOIN Users AS u ON a.UserId =  u.Id
ORDER BY CreatedOn