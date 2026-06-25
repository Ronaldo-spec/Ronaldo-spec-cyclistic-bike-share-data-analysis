# Project Summary

## Project Name

Cyclistic Bike-Share Data Analysis

## Objective

Analyze differences in usage behavior between casual riders and annual members, then generate data-driven recommendations to support annual membership conversion.

## Dataset Period

July 2024 - June 2025

## Tools Used

- Microsoft Excel / Power Query
- Python / Google Colab
- SQL / MariaDB or MySQL
- RStudio / dplyr / ggplot2

## Data Processing Summary

The dataset was cleaned and transformed through the following steps:

1. Combined 12 monthly CSV files.
2. Removed duplicate rows and blank rows.
3. Removed irrelevant columns for the analysis scope.
4. Converted date and time fields into valid datetime formats.
5. Created additional analysis fields:
   - `hour`
   - `name_of_the_day`
   - `month`
   - `ride_length`
   - `category_ride_length`
6. Removed extreme ride durations above 24 hours to reduce distortion in average duration analysis.
7. Aggregated results by user type, day, month, hour, and ride duration category.

## Main Results

| Metric | Value |
|---|---:|
| Total trips after cleaning | 5,590,841 |
| Casual rider trips | 2,049,922 |
| Annual member trips | 3,540,919 |
| Average ride length - casual riders | 19.96 minutes |
| Average ride length - annual members | 11.83 minutes |
| Overall average ride length | 14.81 minutes |

## Key Findings

1. Annual members make more trips overall and show more consistent weekday usage.
2. Casual riders are more active on weekends and during warmer / vacation-oriented months.
3. Members are more active during commuting hours, especially 07:00-09:00 and 16:00-18:00.
4. Casual riders have longer average ride durations than members.
5. Casual riders with longer trip durations represent a strong opportunity for membership conversion.

## Business Recommendations

1. Launch weekend and summer conversion campaigns.
2. Use time-and-duration-based targeting through app notifications or digital ads.
3. Optimize social media and email marketing around leisure, weekend, and longer-duration ride behavior.

## Repository Notes

The complete PDF report is stored in the `docs/` folder. Raw datasets and large Excel workbooks are intentionally not included to keep the repository lightweight and review-friendly.
