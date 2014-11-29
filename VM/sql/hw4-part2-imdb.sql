use imdb;

-- 1. find how many actors are stored in the actors table
select COUNT(*) as num_actors
from actors
where id IS NOT NULL;

-- 2. find all information for actor with id 376249
select * from actors where id = 376249 and id IS NOT NULL;

-- 3. find all the actors that played in the movie Ocean's Twelve
select a.*, m.name as Movies
from actors as a
	inner join roles as r on a.id = r.actor_id
    inner join movies as m on m.id = r.movie_id
where m.name = "Ocean's Twelve";

-- 4. find all the movies that have the word "Vietnam" in their title
select *
from movies
where movies.name LIKE "%Vietnam%" and movies.id IS NOT NULL;

-- 5. find the number of movies that each actor has played. show just the actor id and the number of movies
select a.id, count(m.id) as NumMovies
from actors as a
	inner join roles as r on a.id = r.actor_id
    inner join movies as m on m.id = r.movie_id
where m.id IS NOT null
group by a.id;

-- 6. find the number of actors for each movie. show just the movie id and the number of actors in the movie
select m.id, count(a.id) as NumActors
from actors as a
	inner join roles as r on a.id = r.actor_id
    inner join movies as m on m.id = r.movie_id
where m.id IS NOT null
group by m.id;

/* 7. Find the time period in which each actor was active, by listing the earliest and 
	the latest year in which the actor starred in a film.*/
select a.id as ActId, min(m.year) as Earliest, max(m.year) as Latest
from actors as a
	inner join roles as r on a.id = r.actor_id
    inner join movies as m on m.id = r.movie_id
where m.id IS NOT null and a.id IS NOT null
group by a.id
order by m.year;

-- 8. Repeat the query above, but only list actors that have starred in at least 10 movies
select a.id as ActId, min(m.year) as Earliest, max(m.year) as Latest
from actors as a
	inner join roles as r on a.id = r.actor_id
    inner join movies as m on m.id = r.movie_id
where m.id IS NOT null and a.id IS NOT null
group by a.id
having count(m.id) >= 10
order by m.year;

-- this is for testing the result
select *
from actors as a
	inner join roles as r on a.id = r.actor_id
    inner join movies as m on m.id = r.movie_id
where m.id IS NOT null and a.id = 741344;

/* 9. Repeat the query above, and also list in the results the number of years that the actor was active, 
by subtracting the earliest year from the latest year of activity. Order the results in decreasing order, 
listing the longest active actor first.*/


