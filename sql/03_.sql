SELECT
    name_of_the_day,
    member_casual,
    COUNT(*) AS trip_count
FROM
    rides_cleaned
GROUP BY
    name_of_the_day,
    member_casual
ORDER BY
    FIELD (
        name_of_the_day,
        'Sunday',
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday'
    ),
    member_casual;

SELECT
    month,
    member_casual,
    COUNT(*) AS trip_count
FROM
    rides_cleaned
GROUP BY
    month,
    member_casual
ORDER BY
    FIELD (
        month,
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December'
    ),
    member_casual;

SELECT
    member_casual,
    COUNT(*) AS jumlah_perjalanan
FROM
    rides_cleaned
GROUP BY
    member_casual;

SELECT
    name_of_the_day,
    hour,
    COUNT(*) AS trip_count
FROM
    rides_cleaned
WHERE
    TRIM(
        BOTH '"'
        FROM
            TRIM(
                BOTH '\r'
                FROM
                    TRIM(
                        BOTH '\n'
                        FROM
                            member_casual
                    )
            )
    ) = 'casual'
GROUP BY
    name_of_the_day,
    hour
ORDER BY
    FIELD (
        name_of_the_day,
        'Sunday',
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday'
    ),
    hour;

SELECT
    name_of_the_day,
    hour,
    COUNT(*) AS trip_count
FROM
    rides_cleaned
WHERE
    TRIM(
        BOTH '"'
        FROM
            TRIM(
                BOTH '\r'
                FROM
                    TRIM(
                        BOTH '\n'
                        FROM
                            member_casual
                    )
            )
    ) = 'member'
GROUP BY
    name_of_the_day,
    hour
ORDER BY
    FIELD (
        name_of_the_day,
        'Sunday',
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday'
    ),
    hour;

SELECT
    name_of_the_day,
    member_casual,
    ROUND(AVG(ride_length), 2) AS avg_ride_length
FROM
    rides_cleaned
GROUP BY
    name_of_the_day,
    member_casual
ORDER BY
    FIELD (
        name_of_the_day,
        'Sunday',
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday'
    ),
    member_casual;

SELECT
    member_casual AS user_type,
    SEC_TO_TIME (AVG(ride_length)) AS average_ride_length
FROM
    rides_cleaned
GROUP BY
    member_casual;

SELECT
    member_casual,
    COUNT(
        CASE
            WHEN category_ride_length = '<=10' THEN 1
        END
    ) AS `<=10`,
    COUNT(
        CASE
            WHEN category_ride_length = '>10 and <=20' THEN 1
        END
    ) AS `>10 and <=20`,
    COUNT(
        CASE
            WHEN category_ride_length = '>20 and <=30' THEN 1
        END
    ) AS `>20 and <=30`,
    COUNT(
        CASE
            WHEN category_ride_length = 'Over 30' THEN 1
        END
    ) AS `Over 30`,
    COUNT(*) AS Total
FROM
    rides_cleaned
GROUP BY
    member_casual
UNION ALL
SELECT
    'Total' AS member_casual,
    COUNT(
        CASE
            WHEN category_ride_length = '<=10' THEN 1
        END
    ),
    COUNT(
        CASE
            WHEN category_ride_length = '>10 and <=20' THEN 1
        END
    ),
    COUNT(
        CASE
            WHEN category_ride_length = '>20 and <=30' THEN 1
        END
    ),
    COUNT(
        CASE
            WHEN category_ride_length = 'Over 30' THEN 1
        END
    ),
    COUNT(*) AS Total
FROM
    rides_cleaned;