SELECT TOP 1 WITH TIES con.Name,AVG(f.Rate) AS FeedbackRate FROM Countries AS con
JOIN Customers AS cu ON cu.CountryId = con.Id
JOIN Feedbacks AS f ON  f.CustomerId = cu.Id
GROUP BY con.Name
ORDER BY FeedbackRate DESC