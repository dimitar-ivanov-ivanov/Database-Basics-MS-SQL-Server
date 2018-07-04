WITH CategoriesReporstsCount_CTE
(CategoryId,[Category Name],[Reports Number]) AS
(SELECT c.Id,c.Name AS [Category Name],
COUNT(r.Id) AS [Reports Number]
FROM Categories AS c
JOIN Reports AS r ON r.CategoryId = c.Id
GROUP BY c.Name,c.Id
)

SELECT cr.[Category Name],cr.[Reports Number],COUNT(s.Id)
FROM CategoriesReporstsCount_CTE AS cr
JOIN Reports AS r ON r.CategoryId = cr.CategoryId
JOIN Status AS s ON s.Id = r.StatusId
WHERE s.Label IN ('waiting','in progress')
GROUP BY cr.[Category Name],cr.[Reports Number]

