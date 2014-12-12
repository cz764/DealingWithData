SELECT * FROM yelp.yelp_phone;

LOAD DATA LOCAL INFILE '~/DealingWithData/VM/ipynb/yelp_phone.csv'
INTO TABLE yelp_phone FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' LINES TERMINATED BY '\n';

use yelp;

select * from yelp_phone where phone = 2017959899;


SET SQL_SAFE_UPDATES = 0;
UPDATE yelp.yelp_phone
SET longitude = -74.0296042, latitude = 40.7410246
WHERE phone = 2017959899;

UPDATE yelp.yelp_phone
SET longitude = 0, latitude = 0
WHERE phone = 2017959899;

