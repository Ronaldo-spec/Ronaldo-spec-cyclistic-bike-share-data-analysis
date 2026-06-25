# Excel / Power Query Workflow

Large Excel workbook files are intentionally not included in this repository. This file documents the spreadsheet-based workflow used in the project.

## Tool

- Microsoft Excel
- Power Query
- Pivot Table
- Charts

## Workflow Summary

1. Import 12 monthly CSV files into Excel.
2. Use **Combine & Transform** to merge all monthly trip data.
3. Review data integrity and identify missing values in station-related columns.
4. Remove columns that are not required for the main business questions.
5. Remove duplicate rows.
6. Remove blank rows.
7. Calculate ride duration in minutes using:

```text
ride_length = (ended_at - started_at) * 24 * 60
```

8. Filter extreme durations:

```text
ride_length <= 1440
```

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
- Hourly usage pattern
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

## Note

The Excel workbook is excluded because it is a large local working file. The repository uses summary CSV files and documentation instead, making it easier to review on GitHub.
