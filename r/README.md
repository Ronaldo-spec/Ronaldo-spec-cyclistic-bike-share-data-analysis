# RStudio Workflow

The RStudio workflow was used to validate and visualize key analysis outputs using R packages such as `dplyr` and `ggplot2`.

## Main R Steps

1. Load and prepare the dataset.
2. Check missing values and duplicate records.
3. Remove unnecessary columns.
4. Create calculated fields:
   - `hour`
   - `name_of_the_day`
   - `month`
   - `ride_length`
   - `category_ride_length`
5. Filter ride durations above 24 hours.
6. Aggregate trip counts by user type, day, month, and hour.
7. Visualize usage patterns and ride duration differences.

## Suggested R Script File Name

When available, add the script as:

```text
r/cyclistic_analysis_r.R
```

## Main Visuals Produced

- Total trips by day
- Total trips by month
- Total trips by user type
- Hourly usage pattern
- Heatmap of casual rider usage
- Heatmap of member usage
- Average ride length by day
- Ride duration category distribution
