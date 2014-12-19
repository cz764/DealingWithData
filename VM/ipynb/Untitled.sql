SELECT * FROM yelp.yelp_phone;


LOAD DATA LOCAL INFILE '~/DealingWithData/VM/DealingWithData_FinalProject/Data/yelp_user.csv'
INTO TABLE yelp_user FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' LINES TERMINATED BY '\n';

use yelp;

select * from yelp_phone;

select count(*) from yelp_phone where longitude = 0 and latitude = 0;

select * from yelp_zipcode;


SET SQL_SAFE_UPDATES = 0;
UPDATE yelp.yelp_phone
SET longitude = -74.0296042, latitude = 40.7410246
WHERE phone = 2017959899;

UPDATE yelp.yelp_phone
SET longitude = 0, latitude = 0
WHERE phone = 2017959899;

drop view if exists gotGeolocation;
create view gotGeolocation as
select distinct phone, longitude, latitude
from yelp_zipcode as yz
where yz.longitude != 0 and yz.latitude != 0 and yz.phone IS NOT NULL;

select count(*) from gotGeolocation;

create table new_yelp_phone as
select y.*, g.longitude as lon, g.latitude as lat
from yelp_phone as y, gotGeolocation as g
where y.phone = g.phone and y.longitude = 0 and y.latitude = 0;

ALTER TABLE new_yelp_phone DROP column longitude;
ALTER TABLE new_yelp_phone DROP column latitude;
ALTER TABLE new_yelp_phone change column lon longitude double(12,8);
ALTER TABLE new_yelp_phone change column lat latitude double(12,8);

select count(*) from new_yelp_phone;

select *
from yelp_phone as y, new_yelp_phone as ny
where y.phone = ny.phone;

UPDATE yelp_phone
INNER JOIN new_yelp_phone as ny ON yelp_phone.phone = ny.phone
SET yelp_phone.latitude = ny.latitude,
yelp_phone.longitude = ny.longitude
WHERE yelp_phone.phone = ny.phone;

SELECT *
INTO OUTFILE 'new_yelp_phone.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
ESCAPED BY '\\'
LINES TERMINATED BY '\n'
FROM yelp_phone;

ALTER TABLE `yelp_review` ADD INDEX `userid` (`userid`);
ALTER TABLE `yelp_review` ADD INDEX `bizid` (`bizid`);
ALTER TABLE `yelp_user` ADD INDEX `userid` (`userid`);

