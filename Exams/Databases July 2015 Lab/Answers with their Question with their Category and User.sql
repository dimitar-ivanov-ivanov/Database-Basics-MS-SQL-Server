SELECT a.Content AS [Answer Content],a.CreatedON,u.Username AS [Answer Author],
q.Title AS [Question Title],
c.Name AS [Category Name]
FROM Answers AS a
JOIN Users AS u ON u.Id = a.UserId
JOIN Questions AS q ON q.UserId = a.QuestionId
JOIN Categories AS c ON c.CategoryId = q.CategoryId
ORDER BY [Category Name],[Answer Author],CreatedOn