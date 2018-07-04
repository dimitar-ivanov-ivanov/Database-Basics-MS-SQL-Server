SELECT m.Id,m.ChatId,m.UserId FROM Messages AS m
LEFT JOIN UsersChats AS uc ON 
uc.ChatId = m.ChatId AND uc.UserId = m.UserId
WHERE m.ChatId = 17 AND uc.UserId IS NULL
ORDER BY m.Id DESC