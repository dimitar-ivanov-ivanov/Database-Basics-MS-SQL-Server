SELECT c.Name,q.Title,q.CreatedOn FROM Categories AS c
LEFT JOIN Questions AS q ON q.CategoryId = c.CategoryId
ORDER BY c.Name,q.CreatedOn