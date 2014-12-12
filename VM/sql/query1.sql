use imdb;

select director_id,COUNT(movie_id) as movies_directed
from movies_directors
group by director_id
order by movies_directed desc ;

select *
from directors 
where id = 25116;

use facebook;

select Sex, `Political Views`, COUNT(*) AS cnt
from Profiles
where Sex IS NOT NULL AND `Political Views` IS NOT NULL
group by Sex, `Political Views`;

select YEAR(Birthday), COUNT(*)
from Profiles
where YEAR(Birthday) IS NOT NULL
group by YEAR(Birthday)
order by YEAR(Birthday);

use yelp;

LOAD DATA LOCAL INFILE '/vagrant/ipynb/yelp_phone.csv'
INTO TABLE yelp_phone
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n';