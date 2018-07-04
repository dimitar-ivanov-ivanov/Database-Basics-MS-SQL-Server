SELECT MIN(a.CreatedOn) AS MinDate,
MAX(a.CreatedOn) AS MaxDate
FROM Answers AS a
WHERE YEAR(a.CreatedOn) BETWEEN 2012 AND 2014