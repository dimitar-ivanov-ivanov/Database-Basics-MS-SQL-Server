SELECT TOP 1 WITH TIES 
con.Name AS CountryName,AVG(f.Rate) AS FeedbackRate 
FROM Feedbacks AS f
JOIN Customers AS cu ON cu.Id = f.CustomerId
JOIN Countries AS con ON con.Id = cu.CountryId
GROUP BY con.Name
ORDER BY FeedbackRate DESC
