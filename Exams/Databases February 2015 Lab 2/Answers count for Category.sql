SELECT c.Name AS Category,COUNT(a.Id) AS [Answers Count] FROM Categories AS c
JOIN Questions AS q ON q.CategoryId = c.Id
JOIN Answers AS a ON a.QuestionId = q.Id
GROUP BY c.Name