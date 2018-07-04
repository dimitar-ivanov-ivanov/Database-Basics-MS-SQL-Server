SELECT c.Name AS Category,COUNT(a.Id) AS [Answer Count] FROM Categories AS c
JOIN Questions AS q ON q.CategoryId = c.Id
JOIN Answers AS a ON a.QuestionId = q.Id
GROUP BY c.Name
ORDER BY [Answer Count] DESC