use facebook;

select * 
from Profiles
where `Political Views` in ('Conservative', 'Very Conservative');

-- class practice: favorite book by liberal students and conservative student
create view BooksLiberals as
select b.FavoriteBook, count(p.ProfileID) as NumLiberalStudents
from Profiles as p
	inner join FavoriteBooks as b on p.ProfileID = b.ProfileID
where p.`Political Views` = 'Liberal'
group by b.FavoriteBook
order by NumLiberalStudents desc;

select * from FavoriteBooks;

-- create view BooksConservatives as
select b.FavoriteBook, count(p.ProfileID) as NumConservativeStudents
from Profiles as p
	inner join FavoriteBooks as b on p.ProfileID = b.ProfileID
where p.`Political Views` = 'Conservative'
group by b.FavoriteBook
order by NumConservativeStudents desc;

create view BookComparison as
select c.FavoriteBook, l.NumLiberalStudents, c.NumConservativeStudents, 
		c.NumConservativeStudents / l.NumLiberalStudents as OddsConservative
from BooksLiberals as l
	inner join BooksConservatives as c on l.FavoriteBook = c.FavoriteBook
order by NumLiberalStudents desc;

drop view if exists NumLiberals;
create view NumLiberals as
select count(*) as NumLiberals from Profiles
where `Political Views` = 'Liberal';


drop view if exists NumConservatives;
create view NumConservatives as
select count(*) as NumConservatives from Profiles
where `Political Views` = 'Conservative';


