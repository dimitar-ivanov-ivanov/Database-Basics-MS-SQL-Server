SELECT c.Name,q.Title,q.CreatedOn FROM Questions  AS q
RIGHT JOIN Categories AS c ON c.Id = q.CategoryId
ORDER BY c.Name,q.Title