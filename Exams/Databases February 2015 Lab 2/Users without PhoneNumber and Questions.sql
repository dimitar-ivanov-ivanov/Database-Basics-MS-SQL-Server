SELECT * FROM Users AS  u
WHERE u.PhoneNumber IS NULL AND u.Id NOT  IN(
 SELECT u.Id FROM Users AS u
 JOIN Questions  AS q ON q.UserId = u.Id
)
ORDER BY u.RegistrationDate