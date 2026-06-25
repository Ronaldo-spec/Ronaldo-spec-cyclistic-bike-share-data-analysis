# Excel / Power Query Workflow

Large Excel workbook files are intentionally not included in this repository. This file documents the spreadsheet-based workflow used in the project.

For detailed Excel pivot table outputs, see:

[Excel Analysis Results](excel_results_summary.md)

## Tool

- Microsoft Excel
- Power Query
- Pivot Table
- Charts

## Workflow Summary

1. Import 12 monthly CSV files into Excel.
2. Use **Combine & Transform** to merge all monthly trip data.
3. Review data integrity and identify missing values in station-related columns such as:
   - `start_station_name`
   - `start_station_id`
   - `end_station_name`
   - `end_station_id`
4. Remove columns that are not required for the main business questions.
5. Remove duplicate rows.
6. Remove blank rows.
7. Calculate ride duration in minutes using:

```text
ride_length = (ended_at - started_at) * 24 * 60
```

Excel stores date and time values as serial numbers, where `1` represents one full day. Multiplying by `24 * 60` converts the date-time difference into minutes.

8. Filter extreme durations:

```text
ride_length <= 1440
```

The 1,440-minute threshold represents 24 hours. Durations above this threshold were treated as extreme values because they may distort average ride duration analysis.

9. Create additional fields:

| Field | Description |
|---|---|
| `hour` | Extracted hour from `started_at`, using 24-hour format |
| `name_of_the_day` | Day name extracted from trip start date |
| `month` | Month number extracted from trip start date |
| `ride_length` | Ride duration in minutes |
| `category_ride_length` | Ride duration category |

10. Create Pivot Tables for:

- Total trips by user type
- Total trips by day
- Total trips by month
- Hourly usage pattern for casual riders
- Hourly usage pattern for annual members
- Average ride length by user type
- Average ride length by day
- Ride duration category distribution

## Ride Duration Categories

| Category | Rule |
|---|---|
| `<=10` | Ride duration less than or equal to 10 minutes |
| `>10 and <=20` | Ride duration above 10 and up to 20 minutes |
| `>20 and <=30` | Ride duration above 20 and up to 30 minutes |
| `Over 30` | Ride duration above 30 minutes |

## Why Excel Was Included

Excel was used as the first practical analysis layer because it is useful for:

- Quickly combining and inspecting tabular data.
- Performing Power Query cleaning steps visually.
- Building Pivot Tables for fast validation.
- Creating early charts to compare casual riders and annual members.
- Validating whether results from Python, SQL, and RStudio were directionally consistent.

## Main Excel Outputs

The Excel analysis produced these portfolio-relevant outputs:

| Output | Purpose |
|---|---|
| Total trips by user type | Compare the overall contribution of casual riders and annual members |
| Trips by day | Identify weekday and weekend usage patterns |
| Trips by month | Identify seasonal usage patterns |
| Hourly usage by user type | Identify commuting vs leisure patterns |
| Average ride length | Compare trip duration behavior |
| Ride duration categories | Identify short-trip and long-trip user segments |

## Note

The Excel workbook is excluded because it is a large local working file. The repository uses summary CSV files and documentation instead, making it easier to review on GitHub.
