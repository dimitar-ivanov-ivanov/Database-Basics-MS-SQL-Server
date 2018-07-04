SELECT u.Id,u.Username,u.FirstName,u.PhoneNumber,u.RegistrationDate,u.Email FROM Users AS u
LEFT  JOIN Questions AS q ON q.UserId = u.Id
WHERE u.PhoneNumber IS NULL AND q.Id IS NULL
ORDER BY u.RegistrationDate