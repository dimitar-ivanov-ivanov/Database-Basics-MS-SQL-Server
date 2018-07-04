select top 5 c.CountryName,r.RiverName
 from Countries as c
join Continents as cn on cn.ContinentCode = c.ContinentCode
 left join CountriesRivers as cr on c.CountryCode = cr.CountryCode
left join Rivers as r on r.Id = cr.RiverId
where cn.ContinentName  = 'Africa'
order by c.CountryName