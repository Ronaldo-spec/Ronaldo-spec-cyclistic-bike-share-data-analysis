# Python Notebook

The Python workflow was developed in Google Colab as part of the end-to-end analysis process.

## Main Python Steps

1. Import required libraries:
   - pandas
   - numpy
   - seaborn
   - matplotlib
   - glob

2. Load and combine 12 monthly CSV files.
3. Convert `started_at` and `ended_at` into datetime format.
4. Remove irrelevant columns.
5. Create additional fields:
   - `hour`
   - `name_of_the_day`
   - `month`
   - `ride_length`
   - `category_ride_length`
6. Check missing values and duplicates.
7. Remove extreme ride durations above 24 hours.
8. Generate aggregations and visualizations.

## Google Colab

The original analysis was created in Google Colab. If the notebook is shared publicly, the link can be added here.

```text
Google Colab link: add public notebook link here
```

## Suggested Notebook File Name

When available, add the notebook as:

```text
notebooks/cyclistic_analysis_python.ipynb
```
