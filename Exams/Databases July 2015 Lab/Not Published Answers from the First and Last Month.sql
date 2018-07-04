SELECT a.Content AS [Answer Content],q.Content  AS Question,c.Name AS Category 
FROM Answers AS a
JOIN Questions AS q ON q.Id = a.QuestionId
JOIN Categories AS c ON c.Id = q.CategoryId
ORDER  BY Category