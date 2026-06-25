CREATE TABLE
    rides (
        ride_id VARCHAR(50),
        rideable_type VARCHAR(20),
        started_at DATETIME (3),
        ended_at DATETIME (3),
        start_station_name TEXT,
        start_station_id VARCHAR(100),
        end_station_name TEXT,
        end_station_id VARCHAR(100),
        start_lat FLOAT,
        41 start_lng FLOAT,
        end_lat FLOAT,
        end_lng FLOAT,
        member_casual VARCHAR(10),
        PRIMARY KEY (ride_id)
    );


CREATE TABLE
    raw_lines (line TEXT);


LOAD DATA LOCAL INFILE '../202407-divvy-tripdata.csv' INTO TABLE raw_lines LINES TERMINATED BY '\n';


DELETE FROM raw_lines
WHERE
    line LIKE 'ride_id,%'
    OR line LIKE '"ride_id",%';
    

LOAD DATA LOCAL INFILE '../202407-divvy-tripdata.csv' INTO TABLE raw_lines LINES TERMINATED BY '\n';


INSERT IGNORE INTO rides (
    ride_id,
    rideable_type,
    started_at,
    ended_at,
    start_station_name,
    start_station_id,
    end_station_name,
    end_station_id,
    start_lat,
    start_lng,
    end_lat,
    end_lng,
    member_casual
)
SELECT
    SUBSTRING_INDEX (SUBSTRING_INDEX (line, ',', 1), ',', -1), -- ride_id
    SUBSTRING_INDEX (SUBSTRING_INDEX (line, ',', 2), ',', -1), -- rideable_type
    -- started_at
    STR_TO_DATE (
        REPLACE (
            SUBSTRING_INDEX (
                SUBSTRING_INDEX (SUBSTRING_INDEX (line, ',', 3), ',', -1),
                '.',
                1
            ),
            '"',
            ''
        ),
        '%Y-%m-%d %H:%i:%s'
    ),
    -- ended_at
    STR_TO_DATE (
        REPLACE (
            SUBSTRING_INDEX (
                SUBSTRING_INDEX (SUBSTRING_INDEX (line, ',', 4), ',', -1),
                '.',
                1
            ),
            '"',
            ''
        ),
        '%Y-%m-%d %H:%i:%s'
    ),
    SUBSTRING_INDEX (SUBSTRING_INDEX (line, ',', 5), ',', -1), -- start_station_name
    SUBSTRING_INDEX (SUBSTRING_INDEX (line, ',', 6), ',', -1), -- start_station_id
    SUBSTRING_INDEX (SUBSTRING_INDEX (line, ',', 7), ',', -1), -- end_station_name
    SUBSTRING_INDEX (SUBSTRING_INDEX (line, ',', 8), ',', -1), -- end_station_id
    SUBSTRING_INDEX (SUBSTRING_INDEX (line, ',', 9), ',', -1) + 0.0, -- start_lat
    SUBSTRING_INDEX (SUBSTRING_INDEX (line, ',', 10), ',', -1) + 0.0, -- start_lng
    SUBSTRING_INDEX (SUBSTRING_INDEX (line, ',', 11), ',', -1) + 0.0, -- end_lat
    SUBSTRING_INDEX (SUBSTRING_INDEX (line, ',', 12), ',', -1) + 0.0, -- end_lng
    SUBSTRING_INDEX (SUBSTRING_INDEX (line, ',', 13), ',', -1) -- member_casual
FROM
    raw_lines;


CREATE TABLE
    rides_cleaned (
        rideable_type VARCHAR(20),
        started_at DATETIME (3),
        ended_at DATETIME (3),
        member_casual VARCHAR(10)
    );


INSERT INTO
    rides_cleaned (
        rideable_type,
        started_at,
        ended_at,
        member_casual
    )
SELECT
    rideable_type,
    started_at,
    ended_at,
    member_casual
FROM
    rides;



