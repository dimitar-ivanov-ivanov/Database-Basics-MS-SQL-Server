create function ufn_GetSalaryLevel(@salary MONEY)
returns varchar(10) as
begin
if(@salary < 30000)
begin
   return 'Low';
end
else if(@salary <= 50000)
begin
   return 'Average'
end

  return 'High';
end