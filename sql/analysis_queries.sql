-- Cyclistic Bike-Share Data Analysis
-- SQL analysis queries
-- Assumed cleaned table: rides_cleaned

-- 1. Total trips by user type
SELECT
    member_casual AS user_type,
    COUNT(*) AS total_trips
FROM rides_cleaned
GROUP BY member_casual
ORDER BY total_trips DESC;

-- 2. Trips by day of week and user type
SELECT
    name_of_the_day,
    member_casual AS user_type,
    COUNT(*) AS total_trips
FROM rides_cleaned
GROUP BY name_of_the_day, member_casual
ORDER BY
    FIELD(name_of_the_day, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'),
    member_casual;

-- 3. Trips by month and user type
SELECT
    month,
    member_casual AS user_type,
    COUNT(*) AS total_trips
FROM rides_cleaned
GROUP BY month, member_casual
ORDER BY month, member_casual;

-- 4. Hourly usage pattern by user type
SELECT
    hour,
    member_casual AS user_type,
    COUNT(*) AS total_trips
FROM rides_cleaned
GROUP BY hour, member_casual
ORDER BY hour, member_casual;

-- 5. Average ride length by user type
SELECT
    member_casual AS user_type,
    ROUND(AVG(ride_length), 2) AS avg_ride_length_minutes
FROM rides_cleaned
GROUP BY member_casual
ORDER BY avg_ride_length_minutes DESC;

-- 6. Average ride length by day and user type
SELECT
    name_of_the_day,
    member_casual AS user_type,
    ROUND(AVG(ride_length), 2) AS avg_ride_length_minutes
FROM rides_cleaned
GROUP BY name_of_the_day, member_casual
ORDER BY
    FIELD(name_of_the_day, 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'),
    member_casual;

-- 7. Ride duration category distribution
SELECT
    member_casual AS user_type,
    category_ride_length,
    COUNT(*) AS total_trips
FROM rides_cleaned
GROUP BY member_casual, category_ride_length
ORDER BY member_casual, category_ride_length;

-- 8. Potential casual rider conversion segment
-- Casual riders with longer rides are useful for membership conversion targeting.
SELECT
    category_ride_length,
    COUNT(*) AS total_casual_trips
FROM rides_cleaned
WHERE member_casual = 'casual'
GROUP BY category_ride_length
ORDER BY total_casual_trips DESC;
