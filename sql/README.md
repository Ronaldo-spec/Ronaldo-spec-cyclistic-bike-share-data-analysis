# SQL Workflow

This folder documents the SQL-based analysis workflow for the Cyclistic bike-share project.

## Main Table Assumption

The analysis queries assume a cleaned table named `rides_cleaned` with the following key fields:

| Column | Description |
|---|---|
| `rideable_type` | Type of bike used |
| `started_at` | Trip start timestamp |
| `ended_at` | Trip end timestamp |
| `member_casual` | User type: `casual` or `member` |
| `hour` | Trip start hour |
| `name_of_the_day` | Trip start day name |
| `month` | Trip start month |
| `ride_length` | Trip duration in minutes |
| `category_ride_length` | Ride duration category |

## Analysis Covered

The SQL queries cover:

- Total trips by user type
- Trips by day of week
- Trips by month
- Hourly usage pattern by user type
- Average ride length by user type
- Average ride length by day
- Ride duration category distribution

## Note

Raw import scripts and local database-specific configurations may vary depending on the user's machine, database engine, and CSV file path. This repository focuses on the analysis logic and portfolio presentation.
