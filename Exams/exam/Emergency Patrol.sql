SELECT r.OpenDate,r.Description,u.Email AS [Reporter Email] 
FROM Reports AS r
JOIN Users AS u ON u.Id = r.UserId
JOIN Categories AS c ON c.Id = r.CategoryId
JOIN Departments AS d ON  d.Id = c.DepartmentId
WHERE r.CloseDate IS NULL AND LEN(r.Description) > 20
AND CHARINDEX('str',r.Description) != 0
AND d.Name IN ('Infrastructure','Emergency','Roads Maintenance')
ORDER BY r.OpenDate,[Reporter Email],r.Id

--SELECT OpenDate,Description FROM  Reports
--WHERE CloseDate IS NULL AND LEN(Description) > 20
--AND CHARINDEX('str',Description) != 0 
--ORDER  BY OpenDate,Id