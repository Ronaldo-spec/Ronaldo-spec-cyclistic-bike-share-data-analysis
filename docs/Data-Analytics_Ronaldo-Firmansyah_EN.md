# Cyclistic Bike-Share Data Analysis

**Google Data Analytics Capstone Project**  
**English Portfolio Report**  
Prepared by **Ronaldo Firmansyah**

---

## Executive Summary

This report presents an end-to-end data analysis project based on the Cyclistic bike-share case study from the Google Data Analytics Capstone. The project compares how casual riders and annual members use Cyclistic bikes differently, then translates the findings into practical marketing recommendations for increasing annual membership conversion.

The analysis uses one full year of historical trip data from **July 2024 to June 2025**. The data was processed and validated using **Excel / Power Query, SQL, Python, and RStudio**.

| Metric | Value |
|---|---:|
| Total trips after cleaning | 5,590,841 |
| Casual rider trips | 2,049,922 |
| Annual member trips | 3,540,919 |
| Average ride length - casual riders | 19.96 minutes |
| Average ride length - annual members | 11.83 minutes |
| Overall average ride length | 14.81 minutes |

The findings show that annual members take more trips overall and are more active during weekday commuting hours. Casual riders are more active during weekends, warmer months, and longer-duration rides. These patterns support seasonal, weekend-focused, and duration-based digital marketing campaigns.

---

## 1. Introduction

A data analytics case study demonstrates how an analyst defines a business problem, prepares data, processes and cleans records, analyzes patterns, visualizes findings, and recommends action based on evidence.

This project applies that workflow to a business scenario from the Google Data Analytics Capstone. The purpose is to document not only the final findings, but also the analytical process behind the results.

### Project Objectives

- Understand behavioral differences between casual riders and annual members.
- Identify patterns that can support annual membership conversion.
- Provide marketing recommendations supported by data insights.
- Demonstrate an end-to-end analytics workflow using Excel, SQL, Python, and RStudio.

---

## 2. Project Scenario

Cyclistic is a fictional bike-share company in Chicago. The company offers single-ride passes, full-day passes, and annual memberships. Customers who use single-ride or day passes are referred to as casual riders, while customers with annual memberships are referred to as members.

The marketing director believes that future growth depends on maximizing annual memberships. Therefore, the analytics team needs to understand how casual riders and annual members use Cyclistic bikes differently and how these insights can support marketing strategy.

### Business Questions

1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy an annual Cyclistic membership?
3. How can Cyclistic use digital media to influence casual riders to become annual members?

---

## 3. Data Preparation and Cleaning

The project uses historical Cyclistic / Divvy trip data covering one full year, from July 2024 to June 2025. The dataset contains trip-level records and distinguishes between casual riders and annual members.

| Item | Description |
|---|---|
| Dataset period | July 2024 - June 2025 |
| Dataset type | Historical bike-share trip records |
| Main user types | casual, member |
| Raw data status | Not included in the repository |

### Cleaning Logic

The cleaning process included:

- Removing duplicate rows and blank rows.
- Removing irrelevant or incomplete station and coordinate columns from the working dataset.
- Converting `started_at` and `ended_at` into datetime format.
- Creating ride duration in minutes.
- Filtering invalid durations and extreme durations above **1,440 minutes / 24 hours**.
- Creating analytical columns for hour, day name, month, and ride duration category.

### Derived Columns

| Derived Column | Purpose |
|---|---|
| `hour` | Analyze hourly usage pattern. |
| `day_of_week` / `name_of_the_day` | Analyze weekday and weekend behavior. |
| `month` | Analyze seasonal and monthly trends. |
| `ride_length` | Measure trip duration in minutes. |
| `category_ride_length` | Compare short and long ride behavior. |

---

## 4. Analysis Process by Tool

### 4.1 Excel / Power Query

Excel and Power Query were used to combine 12 monthly CSV files, inspect missing values, remove unnecessary fields, create calculated fields, filter extreme durations, and build Pivot Tables for initial analysis.

Excel was useful as a fast validation layer because it allowed the analyst to inspect data visually and compare aggregate outputs quickly.

### 4.2 Python / Google Colab

Python was used for additional validation, analysis, and visualization. The process included loading files, concatenating monthly datasets, converting date fields, creating derived columns, checking missing values and duplicate rows, filtering extreme durations, and visualizing usage patterns.

Main libraries included:

- `pandas`
- `numpy`
- `matplotlib`
- `seaborn`

### 4.3 SQL / MariaDB

SQL was used to perform structured data processing in a relational database environment. Because importing a large dataset through phpMyAdmin caused limitations, the data import process was handled through command-line workflow and staging tables.

SQL was used to:

- Create raw and cleaned tables.
- Parse raw CSV lines into structured columns.
- Create `ride_length`, `hour`, `day`, `month`, and `category_ride_length`.
- Filter abnormal ride durations.
- Generate aggregate results by user type, day, month, hour, and duration category.

### 4.4 RStudio

RStudio was used to validate the analytical results and produce additional visualizations. The workflow included data integrity checks, column transformation, filtering, aggregation, and visual outputs using R packages such as `lubridate` and `ggplot2`.

---

## 5. Results

### 5.1 Total Trips by Day

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

Members recorded more trips than casual riders on every day of the week. Casual rider activity peaks on Saturday, while member activity is stronger and more consistent during weekdays.

### 5.2 Total Trips by Month

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

Casual rider usage increases strongly during warmer months, especially between May and September. Member usage also rises in the same period but remains more stable across the year.

### 5.3 Total Trips by User Type

| User Type | Total Trips | Share |
|---|---:|---:|
| Casual | 2,049,922 | 36.66% |
| Member | 3,540,919 | 63.34% |
| **Total** | **5,590,841** | **100.00%** |

Annual members account for approximately 63% of all trips, indicating that the membership segment is the dominant contributor to trip volume.

### 5.4 Average Ride Length

| User Type | Average Ride Length |
|---|---:|
| Casual | 19.96 minutes |
| Member | 11.83 minutes |
| Overall | 14.81 minutes |

Casual riders have longer average ride durations than annual members on every day of the week. The gap is especially visible on weekends, which suggests stronger leisure or recreational usage among casual riders.

### 5.5 Ride Duration Category Distribution

| User Type | <=10 | >10 and <=20 | >20 and <=30 | Over 30 | Total |
|---|---:|---:|---:|---:|---:|
| Casual | 887,173 | 593,724 | 244,300 | 324,725 | 2,049,922 |
| Member | 2,057,844 | 997,043 | 298,530 | 187,502 | 3,540,919 |
| **Total** | **2,945,017** | **1,590,767** | **542,830** | **512,227** | **5,590,841** |

Members dominate short trips, especially trips of 10 minutes or less. Casual riders have a stronger relative presence in trips above 30 minutes, making long-duration casual rides a promising conversion target.

---

## 6. Interpretation

### 6.1 How Members and Casual Riders Use Bikes Differently

- Members ride more frequently overall and show a more routine usage pattern.
- Members are more active on weekdays and during commuting hours.
- Casual riders are more active on weekends and warmer months.
- Casual riders have longer average ride durations, suggesting recreational or non-routine trips.

### 6.2 Why Casual Riders May Buy Membership

Casual riders may be interested in membership when they repeatedly use Cyclistic for weekend activities, leisure trips, or longer rides. The decision can be influenced by convenience, cost savings, and the perception that membership provides better value for recurring use.

### 6.3 How Digital Media Can Influence Conversion

Digital media can be used to target casual riders based on timing and behavior. The strongest opportunities are weekend campaigns, summer campaigns, and duration-based messages after users complete long rides.

---

## 7. Recommendations

### 7.1 Weekend and Summer Conversion Campaign

Cyclistic should target casual riders during weekends and peak seasonal months, especially from May to September.

Example message:

> Try 1 Month Membership for Free This Weekend.

### 7.2 Time-and-Duration-Based Targeting

Cyclistic should use app notifications or email campaigns around casual rider active hours and after long rides.

Example message:

> Riding more than 20 minutes? Save more with a monthly membership.

### 7.3 Behavior-Based Digital Marketing

Cyclistic should use social media, email marketing, and location-based campaigns around leisure areas, parks, tourist spots, and weekend routes. The message should emphasize convenience, repeated use, cost savings, and membership benefits for weekend trips.

### 7.4 Cost-Saving Comparison

Cyclistic should show casual riders a simple comparison between repeated single-ride usage and annual membership cost. This can help casual riders recognize when membership becomes financially more attractive.

---

## 8. Limitations and Future Improvements

### 8.1 Limitations

- The dataset does not contain unique user identifiers, so individual repeat behavior cannot be tracked.
- The dataset does not contain fare or payment data, so actual financial savings cannot be calculated directly.
- The dataset does not contain demographic data, so customer segmentation is limited.
- Weather, location, and station-level analysis were not included in the main analysis scope.
- The findings are based on aggregate behavior rather than individual customer journeys.

### 8.2 Future Improvements

- Add user-level identifiers to analyze repeat casual riders.
- Add fare or payment data to calculate membership break-even points.
- Add weather data to evaluate temperature and seasonality effects.
- Add station-level location analysis to identify high-conversion areas.
- Build a predictive model for membership conversion likelihood.
- Develop an interactive Power BI dashboard for stakeholder exploration.
- Compare multiple years to understand long-term behavioral changes.

---

## 9. Closing

This project demonstrates how data analytics can support business decision-making by transforming raw trip data into actionable marketing insights. The analysis shows that members and casual riders use Cyclistic differently in terms of trip frequency, timing, seasonality, and duration.

The strongest recommendation is to focus on casual riders who use Cyclistic during weekends, warmer months, and longer rides. This segment is more likely to perceive annual membership as valuable when the message is framed around savings, convenience, and repeated recreational use.
