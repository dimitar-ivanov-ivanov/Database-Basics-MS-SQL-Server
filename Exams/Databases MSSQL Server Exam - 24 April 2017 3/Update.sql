Update Jobs
SET MechanicId = 3
WHERE Status = 'Pending' 

Update Jobs
SET Status = 'In Progress'
WHERE MechanicId = 3 AND Status = 'Pending'