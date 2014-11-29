use imdb;

select md.movie_id, m.name, m.year, m.rank
from directors as d
	inner join movies_directors as md on d.id = md.director_id
    inner join movies as m on m.id = md.movie_id
    
where d.first_name = 'Steven' and d.last_name = 'Spielberg'
order by rank desc ;

select md.movie_id, m.name, m.year, m.rank, AVG(rank) as AvgRank, COUNT(m.id) as NumMovies
from directors as d
	inner join movies_directors as md on d.id = md.director_id
    inner join movies as m on m.id = md.movie_id
where m.rank IS NOT NULL
group by d.id, d.first_name, d.last_name
having COUNT(*)>30
order by AvgRank desc ;

use imdb;

select *
from movies
where id in (select movie_id from movies_directors where director_id = '75280');