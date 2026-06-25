ALTER TABLE rides_cleaned
ADD COLUMN hour INT;

UPDATE rides_cleaned
SET
    hour = HOUR (started_at);

Table 2.44
ALTER TABLE rides_cleaned
ADD COLUMN name_of_the_day VARCHAR(10);

UPDATE rides_cleaned
SET
    name_of_the_day = DAYNAME (started_at);

ALTER TABLE rides_cleaned
ADD COLUMN month VARCHAR(15);

UPDATE rides_cleaned
SET
    month = MONTHNAME (started_at);

ALTER TABLE rides_cleaned
ADD COLUMN ride_length DOUBLE;

UPDATE rides_cleaned
SET
    ride_length = TIMESTAMPDIFF (SECOND, started_at, ended_at) / 60.0;

ALTER TABLE rides_cleaned
ADD COLUMN category_ride_length VARCHAR(20);

UPDATE rides_cleaned
SET
    category_ride_length = CASE
        WHEN ride_length <= 10 THEN '<=10'
        WHEN ride_length > 10
        AND ride_length <= 20 THEN '>10 and <=20'
        WHEN ride_length > 20
        AND ride_length <= 30 THEN '>20 and <=30'
        ELSE 'Over 30'
    END;

DELETE FROM rides_cleaned
WHERE
    ride_length > 1440;

Table 2.50