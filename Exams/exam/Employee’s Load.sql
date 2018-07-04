CREATE FUNCTION udf_GetReportsCount(@employeeId int, @statusId int) 
RETURNS INT
BEGIN
 RETURN (
   SELECT COUNT(r.Id) FROM Reports AS  r
   WHERE r.EmployeeId = @employeeId AND r.StatusId = @statusId
 )
END

SELECT Id, FirstName, Lastname, dbo.udf_GetReportsCount(Id, 2) AS ReportsCount
FROM Employees
ORDER BY Id
