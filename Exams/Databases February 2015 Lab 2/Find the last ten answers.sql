SELECT TOP 10 a.Content,a.CreatedOn,u.Username FROM Answers AS a
JOIN Users AS u ON u.Id = a.UserId
ORDER BY a.CreatedOn