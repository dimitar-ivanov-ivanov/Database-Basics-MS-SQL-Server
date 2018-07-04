CREATE PROC usp_AssignEmployeeToReport(@employeeId int, @reportId int)
AS BEGIN
  BEGIN TRANSACTION
   UPDATE Reports
   SET EmployeeId = @employeeId
   WHERE  Id = @reportId

   DECLARE @EmployeeDepartment int = (
    SELECT e.DepartmentId  FROM Employees AS e
	WHERE e.Id =  @employeeId
   )

   DECLARE @ReportDepartment int = (
    SELECT c.DepartmentId FROM Reports AS r
	JOIN Categories AS c ON r.CategoryId = c.Id
	WHERE r.Id = @reportId
   )

   IF(@EmployeeDepartment != @ReportDepartment)
   BEGIN
    RAISERROR('Employee doesn''t belong to the appropriate department!',16,1);
	ROLLBACK;
	RETURN;
   END

  COMMIT;
END