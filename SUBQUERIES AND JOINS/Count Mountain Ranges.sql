select c.CountryCode,count(mc.MountainId) from Countries as c
join MountainsCountries as mc on mc.CountryCode = c.CountryCode
where c.CountryCode in ('US','RU','BG')
group by c.CountryCode