SELECT CT.Name AS Category,
u.Username,u.PhoneNumber,COUNT(a.Id) AS [Answers Count]
FROM Categories AS ct
JOIN Questions AS q ON q.CategoryId = ct.Id
JOIN Answers AS a ON a.QuestionId = q.Id
JOIN Users AS u ON u.Id = a.UserId
WHERE u.PhoneNumber IS NOT NULL
GROUP BY ct.Name,u.Username,u.PhoneNumber
ORDER BY [Answers Count] DESC