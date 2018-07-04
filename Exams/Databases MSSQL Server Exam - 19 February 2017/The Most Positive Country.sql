SELECT TOP 1 WITH TIES c.Name AS CountryName,
AVG(f.Rate) AS FeedbackRate 
FROM Countries AS c
JOIN Customers as cu ON cu.CountryId = c.Id
JOIN Feedbacks as f ON f.CustomerId = cu.Id
GROUP BY c.Name
ORDER BY FeedbackRate DESC