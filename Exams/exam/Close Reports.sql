CREATE TRIGGER tr_CloseReportStatus ON Reports FOR UPDATE 
AS BEGIN
 UPDATE Reports
 SET  StatusId = (SELECT Id FROM Status WHERE Label = 'completed')
 WHERE Id IN(
  SELECT d.Id FROM deleted AS d
  JOIN inserted AS i ON i.Id = d.Id
  JOIN Status AS s ON s.Id = d.Id
  WHERE d.CloseDate IS NULL AND i.CloseDate IS NOT NULL
  AND  s.Label != 'completed'
 )
END

UPDATE Reports
SET CloseDate = GETDATE()
WHERE EmployeeId = 5;
