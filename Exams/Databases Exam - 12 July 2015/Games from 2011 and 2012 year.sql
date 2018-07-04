select top 50 Name as Game, CONVERT(date, Start, 10) as Start
from Games
where YEAR(Start) >= 2011 and YEAR(Start) <= 2012
order by Start, Game