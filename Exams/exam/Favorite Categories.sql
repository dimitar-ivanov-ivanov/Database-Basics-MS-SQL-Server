WITH DistributorsCategoriesCount_CTE(DepartmentId,
[Department  Name],CategoryCount)  AS
(SELECT d.Id,d.Name AS [Department  Name],
COUNT(c.Id) AS CategoryCount
FROM Departments AS d
JOIN Categories AS c ON c.DepartmentId = d.Id
JOIN Reports AS r ON r.CategoryId = c.Id
WHERE r.UserId IS NOT NULL
GROUP BY d.Name,d.Id
)

SELECT dcc.[Department  Name],c.Name AS [Category Name],
 CAST(ROUND(CAST(COUNT(c.Id) AS DECIMAL(6,2)) / dcc.CategoryCount * 100,0) AS INT)
  AS Percentage
FROM DistributorsCategoriesCount_CTE AS dcc
JOIN Categories AS c ON c.DepartmentId = dcc.DepartmentId
JOIN Reports AS r ON r.CategoryId = c.Id
WHERE r.UserId IS NOT NULL
GROUP BY dcc.[Department  Name],c.Name,dcc.CategoryCount
ORDER BY dcc.[Department  Name],c.Name,Percentage
