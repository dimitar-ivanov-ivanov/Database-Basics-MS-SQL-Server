SELECT c.Name,q.Content FROM Categories AS c
LEFT JOIN Questions AS q ON q.CategoryId = c.CategoryId
ORDER BY c.Name,q.Title