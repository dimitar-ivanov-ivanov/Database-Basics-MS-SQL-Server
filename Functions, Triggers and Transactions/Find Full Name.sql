create proc usp_GetHoldersFullName as
begin
 select (FirstName + ' '+ LastName) as FullName from AccountHolders
end 

--exec usp_GetHoldersFullName