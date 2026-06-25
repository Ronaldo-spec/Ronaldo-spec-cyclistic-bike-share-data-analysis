# Data Documentation

## Raw Data

Raw trip files are not included in this repository.

Reasons:

- The raw dataset consists of large monthly CSV files.
- The project repository should remain lightweight and easy to review.
- Raw files can be obtained from the official public Cyclistic / Divvy historical trip data source.

## Processed Data

The `processed/` folder contains small summary tables derived from the analysis. These files are included to make the project easier to review without requiring the full raw dataset.

## Included Summary Tables

| File | Description |
|---|---|
| `trips_by_user_type.csv` | Total trips by casual riders and annual members |
| `trips_by_day.csv` | Total trips by day of week and user type |
| `trips_by_month.csv` | Total trips by month and user type |
| `avg_ride_length_by_user_type.csv` | Average ride length by user type |
| `avg_ride_length_by_day.csv` | Average ride length by day and user type |
| `ride_length_category_distribution.csv` | Distribution of rides by ride duration category |

## Cleaning Rules

The analysis applied the following cleaning logic:

- Remove duplicate rows.
- Remove blank rows.
- Remove columns that were not relevant to the business questions.
- Create calculated fields such as `ride_length`, `hour`, `month`, and `name_of_the_day`.
- Exclude ride durations greater than 24 hours / 1,440 minutes.

## Note

The summary files are intended for portfolio review and result validation, not for reproducing the full raw-data pipeline from scratch.
