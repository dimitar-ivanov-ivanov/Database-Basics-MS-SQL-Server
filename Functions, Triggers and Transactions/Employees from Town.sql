create proc usp_GetEmployeesFromTown (@town varchar(max)) as
select FirstName,LastName from Employees as e
join Addresses as a on a.AddressID = e.AddressID
join Towns as t on  t.TownID = a.TownID
where t.Name = @town
--exec usp_GetEmployeesFromTown 'Sofia'