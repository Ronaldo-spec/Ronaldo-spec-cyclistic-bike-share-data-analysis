# Install the required library: install.packages(“tidyverse”)
# Load the required package
library(tidyverse)

# Load the dataset
setwd(“../divvy-tripdata_original”)

# Read all CSV files and combine them into a single data frame
file_list <- list.files(pattern = “*.csv”)
all_trips <- file_list %>%
lapply(read_csv) %>%
bind_rows()

sum(duplicated(all_trips))
colSums(is.na(all_trips))

all_trips <- all_trips %>%
select(-ride_id, -start_station_name, -start_station_id, -end_station_name, -end_station_id, -start_lat, -start_lng, -end_lat, -end_lng)

# Install the library to extract the hour value from the `started_at` column
install.packages(“lubridate”)
library(lubridate)

# Create an “hour” column and populate it with the ‘hour’ values from “started_at”
all_trips <- all_trips %>%
mutate(hour = lubridate::hour(started_at))

# Check the results
all_trips %>%
select(started_at, hour) %>%
head()

# Create a column named “hour” and populate it with the ‘name_of_the_day’ values from “started_at”
all_trips <- all_trips %>%
mutate(name_of_the_day = lubridate::wday(started_at, label = TRUE, abbr = FALSE))

# Check the results
all_trips %>%
select(started_at, name_of_the_day) %>%
head()

# Create a “month” column and populate it with the month values from “started_at”
all_trips <- all_trips %>%
mutate(month = month(started_at, label = TRUE, abbr = FALSE))

# Check the results
all_trips %>%
select(started_at, month) %>%
head()

# Create a “month” column and populate it with the “ride_length” value calculated as ended_at minus started_at
all_trips <- all_trips %>%
mutate(ride_length = as.numeric(difftime(ended_at, started_at, units = “mins”)))

# Check the results
all_trips %>%
select(started_at, ended_at, ride_length) %>%
head()

# Create a “month” column and populate it with the ‘category_ride_length’ values from “ride_length”
all_trips <- all_trips %>%
mutate(category_ride_length = case_when(
ride_length <= 10 ~ “<=10”,
ride_length > 10 & ride_length <= 20 ~ “>10 and <=20”,
ride_length > 20 & ride_length <= 30 ~ “>20 and <=30”,
ride_length > 30 ~ “>30”,
TRUE ~ “Invalid”
))

# Check the results
all_trips %>%
select(ride_length, category_ride_length) %>%
head(5)

all_trips <- all_trips %>%
filter(ride_length <= 1440)

# Install Library ggplot2
install.packages("ggplot2")
library(ggplot2)

# Retrieve data and calculate 
trips_per_day <- all_trips %>%
group_by(member_casual, name_of_the_day) %>%
summarise(trips_per_day = n(), .groups = “drop”)

# Visualization
ggplot(number_per_day, aes(x = name_of_the_day, y = number_of_trips, fill = member_casual)) +
geom_bar(stat = “identity”, position = “dodge”) +
labs(
title = “Number of Trips per Day by User Type”,
x = “Day”,
y = “Number of Trips”,
fill = “User Type”
) +
theme_minimal()

#Retrieving data and calculating
number_per_month <- all_trips %>%
group_by(member_casual, month) %>%
summarise(number_of_trips = n(), .groups = “drop”)
#Visualization
ggplot(number_per_month, aes(x = month, y = number_of_trips, fill = member_casual)) +
geom_bar(stat = “identity”, position = “dodge”) +
labs(
title = “Number of Trips per Month by User Type”,
x = “Month”,
y = “Number of Trips”,
fill = “User Type”
) +
theme_minimal() +
theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Calculating the total
total_trips <- all_trips %>%
group_by(member_casual) %>%
summarise(total = n()) %>%
arrange(desc(total))
# Check the results
total_trips
# Visualization
ggplot(total_trips, aes(x = member_casual, y = total, fill = member_casual)) +
geom_col() +
labs(title = “Total Trips by User Type”,
x = “User Type”,
y = “Total Trips”) +
theme_minimal()

# Retrieving and processing data
number_per_hour <- all_trips %>%
group_by(hour, member_casual) %>%
summarise(number = n(), .groups = “drop”)
# Visualization ggplot(trips_per_hour, aes(x = hour, y = trips, color = member_casual)) +
geom_line(size = 1.2) +
scale_x_continuous(breaks = 0:23) + # Display all hours from 0–23
labs(
title = “Number of Trips per Hour”,
x = “Hour (0–23)”,
y = “Number of Trips”,
color = “User Type”
) +
theme_minimal()

number_per_day <- all_trips %>%
group_by(name_of_the_day, member_casual) %>%
summarise(count = n(), groups = “drop”)
Table 2.75 Days of Travel


library(dplyr)
user_travel_time <- all_trips %>%
group_by(member_casual, name_of_the_day, hour) %>%
summarise(count = n(), .groups = “drop”)
# Sort by day
user_travel_time$name_of_the_day <- factor(
user_travel_time$name_of_the_day,
levels = c(“Sunday”, “Monday”, “Tuesday”, “Wednesday”, “Thursday”, ‘Friday’, “Saturday”)
)


ggplot(filter(waktu_perjalanan_pengguna, member_casual == "casual"),
aes(x = name_of_the_day, y = hour, fill = jumlah)) +
geom_tile(color = "white") +
scale_y_continuous(breaks = 0:23) +
scale_fill_gradient(low = "white", high = "red") +
labs(
title = "Heatmap Penggunaan Sepeda - Casual",
x = "Hari",
y = "Jam (0-23)",
fill = "Jumlah Perjalanan"
) +
theme_minimal()


ggplot(filter(waktu_perjalanan_pengguna, member_casual == "member"),
aes(x = name_of_the_day, y = hour, fill = jumlah)) +
geom_tile(color = "white") +
scale_y_continuous(breaks = 0:23) +
scale_fill_gradient(low = "white", high = "red") +
labs(
title = "Heatmap Penggunaan Sepeda - Member",
x = "Hari",
y = "Jam (0-23)",
fill = "Jumlah Perjalanan"
) +
theme_minimal()


# Mengambil dan menghitung data
avg_ride_length_per_day <- all_trips %>%
group_by(member_casual, name_of_the_day) %>%
summarise(
avg_ride_length = mean(ride_length, na.rm = TRUE),
.groups = "drop"
)
# Visualisasi
ggplot(avg_ride_length_per_day, aes(x = name_of_the_day, y = avg_ride_length, fill = member_casual)) +
geom_col(position = "dodge") +
labs(
title = "Rata-rata Durasi Perjalanan per Hari",
x = "Hari",
y = "Rata-rata Durasi (menit)",
fill = "Tipe Pengguna"
) +
theme_minimal()

# Mengambil dan menghitung data
average_ride_length <- all_trips %>%
group_by(member_casual) %>%
summarise(avg_ride_length = mean(ride_length, na.rm = TRUE)) %>%
arrange(desc(avg_ride_length))
# Visualisasi
ggplot(average_ride_length, aes(x = member_casual, y = avg_ride_length, fill = member_casual)) +
geom_col() +
labs(
title = "Rata-rata Durasi Perjalanan berdasarkan Tipe Pengguna",
x = "Tipe Pengguna",
y = "Rata-rata Durasi (menit)"
) +
theme_minimal()

# Mengambil dan menghitung data
jumlah_per_kategori <- all_trips %>%
group_by(member_casual, category_ride_length) %>%
summarise(jumlah = n(), .groups = "drop") %>%
arrange(category_ride_length)
# Visualisasi
ggplot(jumlah_per_kategori, aes(x = category_ride_length, y = jumlah, fill = member_casual)) +
geom_col(position = "dodge") +
labs(
title = "Jumlah Perjalanan Berdasarkan Kategori Durasi",
x = "Kategori Durasi (menit)",
y = "Jumlah Perjalanan",
fill = "Tipe Pengguna"
) +
theme_minimal()


