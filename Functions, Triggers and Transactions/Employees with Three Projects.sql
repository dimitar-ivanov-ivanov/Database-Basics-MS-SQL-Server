create proc usp_AssignProject(@emloyeeId int , @projectID int) as
begin
 declare @maxProjects int = 3;

 begin tran
 insert into EmployeesProjects(EmployeeID,ProjectID) 
 values(@emloyeeId,@projectID)

 declare @projects int =  (select count(*) from EmployeesProjects
 where EmployeeID = @emloyeeId)

  if(@projectID > @maxProjects)
  begin
    RAISERROR('The employee has too many projects!', 16, 1);
    ROLLBACK;
  end
  else commit
end
