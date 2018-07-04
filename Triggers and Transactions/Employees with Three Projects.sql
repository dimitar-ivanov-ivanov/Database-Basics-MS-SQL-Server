CREATE PROC usp_AssignProject(@employeeID int,@projectID int) AS
BEGIN
 BEGIN TRANSACTION
  INSERT INTO EmployeesProjects(EmployeeID,ProjectID)
  VALUES(@employeeID,@projectID)

  IF((SELECT COUNT(ProjectID) FROM EmployeesProjects
   WHERE EmployeeID = @employeeID) > 3)
  BEGIN
   RAISERROR('The employee has too many projects!',16,1);
   ROLLBACK;
   RETURN;
  END

 COMMIT;
END