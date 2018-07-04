select top 5 c.CountryName,
 max(p.Elevation) as HighestPeakElevation,
 max(r.Length) as LongestRiverLength
 from Countries as c
left join MountainsCountries as mc on c.CountryCode = mc.CountryCode
left join Peaks as p on p.MountainId = mc.MountainId
left join CountriesRivers as cr on cr.CountryCode = c.CountryCode
left join Rivers as  r on r.Id = cr.RiverId
group by c.CountryName
order by HighestPeakElevation desc,LongestRiverLength desc,
c.CountryName