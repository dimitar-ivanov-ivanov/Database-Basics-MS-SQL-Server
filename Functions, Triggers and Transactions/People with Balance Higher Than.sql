create proc usp_GetHoldersWithBalanceHigherThan(@floor money) as 
begin
 select ac.FirstName,ac.LastName from AccountHolders as ac
 join Accounts as a on a.AccountHolderId =ac.Id
 group by ac.FirstName,ac.LastName
 having sum(a.Balance)  > @floor
end
--exec usp_GetHoldersWithBalanceHigherThan 2000