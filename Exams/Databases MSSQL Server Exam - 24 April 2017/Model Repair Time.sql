SELECT mo.ModelId,mo.Name,
CONCAT(AVG(DATEDIFF(DAY,j.IssueDate,j.FinishDate)),' ','days')  AS [Average Service Time]
FROM Models as mo
JOIN Jobs AS j ON j.ModelId = mo.ModelId
GROUP BY mo.ModelId,mo.Name
ORDER BY AVG(DATEDIFF(DAY,j.IssueDate,j.FinishDate))