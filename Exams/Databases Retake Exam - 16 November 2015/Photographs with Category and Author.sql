SELECT p.Title,p.Link,p.Description,c.Name AS CategoryName,u.FullName AS Author 
FROM Photographs AS p
JOIN Categories AS c ON c.Id = p.CategoryId
JOIN Users AS u ON u.Id = p.UserId
WHERE c.Id IS NOT NULL AND p.Description IS NOT NULL
ORDER BY p.Title