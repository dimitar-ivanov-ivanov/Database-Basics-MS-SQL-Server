select c.CountryCode,
 m.MountainRange,
 p.PeakName,
 p.Elevation
 from Countries as c
join MountainsCountries as mc on c.CountryCode = mc.CountryCode
join Mountains as m on m.Id = mc.MountainId
join Peaks as p on p.MountainId = m.Id
where p.Elevation  > 2835 and c.CountryCode  = 'BG'
order by Elevation desc