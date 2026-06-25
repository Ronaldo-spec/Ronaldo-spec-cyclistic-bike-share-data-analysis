# Cyclistic Bike-Share Data Analysis

End-to-end bike-share data analysis project using **Excel / Power Query, Python, SQL, and RStudio** to compare usage behavior between **casual riders** and **annual members**, then generate data-driven marketing recommendations to support annual membership conversion.

This project was completed as part of the **Google Data Analytics Capstone** case study and is presented as a professional data analytics portfolio project.

---

## Project Overview

Cyclistic is a fictional bike-share company in Chicago. The business objective is to understand how casual riders and annual members use the service differently, then use the insights to design marketing strategies that can convert casual riders into annual members.

The analysis covers one full year of historical trip data, from **July 2024 to June 2025**.

---

## Business Questions

This project answers three key business questions:

1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy an annual Cyclistic membership?
3. How can Cyclistic use digital media to influence casual riders to become annual members?

---

## Tools Used

| Area | Tools |
|---|---|
| Spreadsheet & data preparation | Microsoft Excel, Power Query |
| Programming & analysis | Python, Google Colab, pandas, numpy |
| Database & querying | SQL, MariaDB / MySQL |
| Statistical analysis & visualization | RStudio, dplyr, ggplot2 |
| Documentation | PDF report, Markdown, GitHub |

---

## Data Scope

| Item | Description |
|---|---|
| Dataset period | July 2024 - June 2025 |
| Dataset type | Historical bike-share trip records |
| User types | Casual riders and annual members |
| Main fields used | user type, trip start time, trip end time, ride duration, day, month, hour, duration category |
| Raw data status | Not uploaded to this repository to keep the repository lightweight |

The raw dataset is public and used only for educational and portfolio purposes. Raw files are not stored in this repository because of file size limitations and repository cleanliness.

---

## Analysis Workflow

The analysis followed an end-to-end data analytics process:

1. **Ask**  
   Defined the business problem and key questions around membership conversion.

2. **Prepare**  
   Collected 12 months of historical bike-share trip data.

3. **Process**  
   Cleaned the data by removing duplicates, blank rows, irrelevant columns, and extreme ride durations above 24 hours.

4. **Analyze**  
   Created additional fields such as `hour`, `name_of_the_day`, `month`, `ride_length`, and `category_ride_length`.

5. **Share**  
   Produced tables, charts, and visual summaries using Excel, Python, SQL, and RStudio.

6. **Act**  
   Generated business recommendations for digital marketing and membership conversion.

---

## Documentation Index

| Document | Description |
|---|---|
| [Full Report](docs/Data-Analytics_Ronaldo-Firmansyah.pdf) | Complete 82-page project report |
| [Project Summary](docs/project_summary.md) | Short project summary, methodology, findings, and recommendations |
| [Excel / Power Query Workflow](excel/power_query_workflow.md) | Excel cleaning and transformation steps |
| [Excel Analysis Results](excel/excel_results_summary.md) | Excel Pivot Table outputs and interpretation |
| [SQL Workflow](sql/README.md) | SQL workflow assumptions and query coverage |
| [SQL Analysis Queries](sql/analysis_queries.sql) | SQL templates for analysis queries |
| [Summary Results](outputs/tables/summary_results.md) | Final metrics, findings, and recommendations |

---

## Key Metrics

| Metric | Value |
|---|---:|
| Total trips after cleaning | 5,590,841 |
| Casual rider trips | 2,049,922 |
| Annual member trips | 3,540,919 |
| Average ride length - casual riders | 19.96 minutes |
| Average ride length - annual members | 11.83 minutes |
| Overall average ride length | 14.81 minutes |

---

## Key Findings

### 1. Members ride more consistently throughout the year

Annual members recorded more trips than casual riders overall. Their usage pattern is more stable, especially on weekdays, indicating routine and functional usage such as commuting.

### 2. Casual riders are more weekend and seasonal oriented

Casual riders are more active on weekends, especially Saturday and Sunday. Their usage increases sharply from May to September, which suggests stronger recreational and seasonal behavior.

### 3. Members show commuting behavior

Members are more active during peak commuting hours, especially around **07:00-09:00** and **16:00-18:00**.

### 4. Casual riders take longer rides

Casual riders have longer average ride durations than members. This indicates that casual riders are more likely to use the service for leisure, recreation, or non-routine trips.

### 5. Long-duration rides are a conversion opportunity

Casual riders are more represented in longer ride duration categories, especially trips above 30 minutes. This group has stronger potential to be targeted with membership cost-saving messages.

---

## Business Recommendations

### 1. Weekend and summer conversion campaign

Launch targeted conversion campaigns during weekends and peak casual-rider months, especially from May to September. Example campaign: **"Try 1 Month Membership for Free This Weekend"**.

### 2. Time-and-duration-based targeting

Use app notifications, email, or in-app ads during casual rider peak activity hours around **11:00-17:00**. Target users with messages such as: **"Riding more than 20 minutes? Save more with a monthly membership."**

### 3. Digital marketing based on rider behavior

Use social media, email marketing, and location-based campaigns around popular leisure areas, parks, and tourist spots. Highlight membership benefits for weekend trips and longer rides.

---

## Repository Structure

```text
cyclistic-bike-share-data-analysis/
|
|-- README.md
|-- .gitignore
|
|-- docs/
|   |-- Data-Analytics_Ronaldo-Firmansyah.pdf
|   |-- project_summary.md
|
|-- data/
|   |-- README.md
|   |-- processed/
|       |-- trips_by_user_type.csv
|       |-- trips_by_day.csv
|       |-- trips_by_month.csv
|       |-- avg_ride_length_by_user_type.csv
|       |-- avg_ride_length_by_day.csv
|       |-- ride_length_category_distribution.csv
|
|-- excel/
|   |-- power_query_workflow.md
|   |-- excel_results_summary.md
|
|-- sql/
|   |-- README.md
|   |-- analysis_queries.sql
|
|-- notebooks/
|   |-- README.md
|
|-- r/
|   |-- README.md
|
|-- outputs/
|   |-- tables/
|       |-- summary_results.md
```

---

## Full Report

The full report is available here:

[Data Analytics Report - Ronaldo Firmansyah](docs/Data-Analytics_Ronaldo-Firmansyah.pdf)

---

## Notes

- Raw dataset files are not included in this repository.
- Large Excel workbook files are excluded because they exceed GitHub's recommended file size usage and are not necessary for reviewing the project.
- The repository focuses on documentation, analysis workflow, summary outputs, and portfolio presentation.

---

## Author

**Ronaldo Firmansyah**  
Programmer | Business Analyst | ERP/Application Support | SQL Reporting | Data Analyst

LinkedIn: [linkedin.com/in/ronaldofirmansyah](https://linkedin.com/in/ronaldofirmansyah)  
GitHub: [github.com/Ronaldo-spec](https://github.com/Ronaldo-spec)
