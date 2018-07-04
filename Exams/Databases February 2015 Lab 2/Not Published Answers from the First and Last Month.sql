DECLARE  @lastYear int = (
 SELECT MAX(YEAR(a.CreatedOn)) FROM Answers AS a
 HAVING COUNT(a.Id) IS NOT NULL
)

DECLARE  @lastMonth int = (
 SELECT MAX(MONTH(a.CreatedOn)) FROM Answers AS a
 WHERE YEAR(a.CreatedOn) = @lastYear
 HAVING COUNT(a.Id) IS NOT NULL
)

DECLARE  @firstMonth int = (
 SELECT MIN(MONTH(a.CreatedOn)) FROM Answers AS a
 WHERE YEAR(a.CreatedOn) = @lastYear
 HAVING COUNT(a.Id) IS NOT NULL
)



SELECT a.Content AS [Answer Content],q.Title AS Question,c.Name AS Category
FROM Answers AS a
JOIN Questions AS q ON a.QuestionId = q.Id
JOIN Categories AS c ON c.Id = q.CategoryId
WHERE a.IsHidden = 1 AND YEAR(a.CreatedOn)   = @lastYear AND 
(MONTH(a.CreatedOn) = @lastMonth OR MONTH(a.CreatedOn) = @firstMonth)
ORDER BY c.Name