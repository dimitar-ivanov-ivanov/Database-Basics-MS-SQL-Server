select count(c.CountryCode) from Countries as c
left join MountainsCountries as mc on mc.CountryCode =  c.CountryCode
where mc.MountainId is null