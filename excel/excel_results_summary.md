# Excel Analysis Results

This file documents the Excel / Power Query analysis results from the Cyclistic bike-share case study. The full Excel workbook is not included because of file size limitations, but the main workflow and pivot table outputs are summarized here for portfolio review.

## Excel Tooling

- Microsoft Excel
- Power Query
- Pivot Table
- Excel charts

## Data Preparation in Excel

The Excel workflow used **Combine & Transform** to import 12 monthly CSV files into a single dataset. The cleaning and transformation process included:

1. Combining 12 monthly trip files.
2. Reviewing missing values, especially in station-related fields.
3. Removing fields that were not required for the business questions.
4. Removing duplicate rows.
5. Removing blank rows.
6. Creating `ride_length` in minutes.
7. Filtering ride durations above 24 hours / 1,440 minutes.
8. Creating helper columns for analysis:
   - `hour`
   - `name_of_the_day`
   - `month`
   - `category_ride_length`
9. Building Pivot Tables and charts for comparison between casual riders and annual members.

## Derived Columns

| Column | Logic | Purpose |
|---|---|---|
| `hour` | Extract hour from `started_at` | Analyze hourly usage pattern |
| `name_of_the_day` | Extract day name from `started_at` | Analyze weekday vs weekend behavior |
| `month` | Extract month from `started_at` | Analyze seasonal usage pattern |
| `ride_length` | `(ended_at - started_at) * 24 * 60` | Calculate trip duration in minutes |
| `category_ride_length` | Duration bucket based on `ride_length` | Compare short and long ride behavior |

## Ride Duration Categories

| Category | Rule |
|---|---|
| `<=10` | Ride duration less than or equal to 10 minutes |
| `>10 and <=20` | Ride duration above 10 and up to 20 minutes |
| `>20 and <=30` | Ride duration above 20 and up to 30 minutes |
| `Over 30` | Ride duration above 30 minutes |

---

## Pivot Table 1: Total Trips by Day

| Day | Casual | Member | Total |
|---|---:|---:|---:|
| Sunday | 334,704 | 384,660 | 719,364 |
| Monday | 246,267 | 522,537 | 768,804 |
| Tuesday | 224,033 | 549,996 | 774,029 |
| Wednesday | 236,486 | 550,536 | 787,022 |
| Thursday | 262,157 | 552,542 | 814,699 |
| Friday | 320,055 | 520,838 | 840,893 |
| Saturday | 426,220 | 459,810 | 886,030 |
| **Total** | **2,049,922** | **3,540,919** | **5,590,841** |

### Interpretation

- Annual members record more trips than casual riders on every day of the week.
- Members show stronger weekday usage, especially from Monday to Friday.
- Casual riders peak on Saturday, indicating stronger weekend / recreational behavior.

---

## Pivot Table 2: Total Trips by Month

| Month | Casual | Member | Total |
|---:|---:|---:|---:|
| 1 | 24,076 | 114,506 | 138,582 |
| 2 | 27,709 | 124,123 | 151,832 |
| 3 | 85,662 | 212,226 | 297,888 |
| 4 | 108,971 | 262,096 | 371,067 |
| 5 | 182,263 | 319,750 | 502,013 |
| 6 | 291,205 | 386,738 | 677,943 |
| 7 | 319,560 | 428,278 | 747,838 |
| 8 | 317,542 | 437,259 | 754,801 |
| 9 | 345,854 | 474,282 | 820,136 |
| 10 | 215,933 | 399,755 | 615,688 |
| 11 | 92,847 | 241,930 | 334,777 |
| 12 | 38,300 | 139,976 | 178,276 |

### Interpretation

- Total trips increase sharply from May to September.
- Casual rider activity is highly seasonal, increasing strongly during warmer months.
- Member activity also increases during the same period, but remains more stable than casual rider usage.

---

## Pivot Table 3: Total Trips by User Type

| User Type | Total Trips | Share of Total |
|---|---:|---:|
| Casual | 2,049,922 | 36.66% |
| Member | 3,540,919 | 63.34% |
| **Total** | **5,590,841** | **100.00%** |

### Interpretation

- Annual members dominate total usage, contributing around 63% of all trips.
- Casual riders still represent a large user base, making them a strong conversion target.

---

## Pivot Table 4: Average Ride Length by Day

| Day | Casual | Member | Total |
|---|---:|---:|---:|
| Sunday | 22.82 | 12.97 | 17.55 |
| Monday | 19.37 | 11.35 | 13.92 |
| Tuesday | 17.48 | 11.37 | 13.14 |
| Wednesday | 17.17 | 11.39 | 13.12 |
| Thursday | 17.73 | 11.45 | 13.47 |
| Friday | 19.53 | 11.74 | 14.71 |
| Saturday | 22.62 | 13.03 | 17.64 |
| **Total** | **19.96** | **11.83** | **14.81** |

### Interpretation

- Casual riders have longer average ride durations than members on every day of the week.
- Casual rides are longest on weekends, especially Sunday and Saturday.
- Members have shorter and more consistent trip durations, supporting the interpretation that members use bikes more functionally and routinely.

---

## Pivot Table 5: Average Ride Length by User Type

| User Type | Average Ride Length |
|---|---:|
| Casual | 19.96 minutes |
| Member | 11.83 minutes |
| **Overall** | **14.81 minutes** |

### Interpretation

Casual riders ride approximately **8.13 minutes longer** than annual members on average. This suggests that casual riders are more likely to use bikes for leisure or longer non-routine trips.

---

## Pivot Table 6: Ride Duration Category Distribution

| User Type | <=10 | >10 and <=20 | >20 and <=30 | Over 30 | Total |
|---|---:|---:|---:|---:|---:|
| Casual | 887,173 | 593,724 | 244,300 | 324,725 | 2,049,922 |
| Member | 2,057,844 | 997,043 | 298,530 | 187,502 | 3,540,919 |
| **Total** | **2,945,017** | **1,590,767** | **542,830** | **512,227** | **5,590,841** |

### Interpretation

- Members dominate short trips, especially rides below or equal to 10 minutes.
- Casual riders have a stronger relative presence in the `Over 30` category.
- Longer casual rides can be used as a practical target segment for membership conversion messaging.

---

## Excel Contribution to the Project

Excel was used not only as a spreadsheet tool, but as an analysis validation layer. The Excel results provided:

- A fast way to inspect and clean the combined dataset.
- Pivot-based validation of total trips, average ride duration, and ride duration categories.
- A comparison baseline against Python, SQL, and RStudio outputs.
- Early visual insights for identifying weekday, weekend, monthly, and duration-based patterns.

## Portfolio Note

The Excel workbook itself is intentionally excluded because it is a large local working file. This summary captures the important Excel workflow and outputs needed for project review.
