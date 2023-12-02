## code to prepare `DATASET` dataset goes here

library(dplyr)
options(timeout = 300)

# Boston Webscraping

# url

bos_url <- "https://data.boston.gov/dataset/d326a4e3-75f2-42ac-9b32-e2920566d04c/resource/92f18923-d4ec-4c17-9405-4e0da63e1d6c/download/tmp1u21fr8k.csv"

# destination file

dest0 <- "data-raw/boston_data.csv"

# download file

download.file(bos_url, dest0)

bos_data <- read.csv("data-raw/boston_data.csv")

# cleaning
clean_bos <- bos_data |> select(1,)

# change column name
year <- "year"
colnames(clean_bos)[colnames(clean_bos) == "date_time"] <- year

# cleaning up year column
clean_bos$year <- substr(clean_bos$year, 1, 4)

# summarize
sum_bos <- clean_bos |> group_by(year) |> summarise(total_fatal = n()) |> mutate(city = "Boston")


# Denver Webscraping

# url
dv_url <- "https://www.denvergov.org/media/gis/DataCatalog/traffic_accidents/csv/traffic_accidents.csv"

# destination file

dest1 <- "data-raw/denver_data.csv"

# download file

download.file(dv_url, dest1)

dv_data <- read.csv("data-raw/denver_data.csv")

# cleaning

clean_dv <- dv_data |> select(3,42) |> filter(FATALITIES != 0)

clean_dv$incident_id <- as.character(clean_dv$incident_id)

clean_dv$year <- substr(clean_dv$incident_id, 1, 4)

sum_dv <- clean_dv |> group_by(year) |> summarise(total_fatal = sum(FATALITIES)) |> mutate(city = "Denver")

# NYC Webscraping

# url
nyc_url <- "https://data.cityofnewyork.us/api/views/h9gi-nx95/rows.csv?date=20231129&accessType=DOWNLOAD"

# destination file

dest2 <- "data-raw/nyc_data.csv"

# download file

download.file(nyc_url, dest2)

nyc_data <- read.csv("data-raw/nyc_data.csv")

# cleaning

clean_nyc <- nyc_data |> select(1, 12) |> filter(NUMBER.OF.PERSONS.KILLED != 0)

clean_nyc$CRASH.DATE<- as.character(clean_nyc$CRASH.DATE)

clean_nyc$year <- substr(clean_nyc$CRASH.DATE, 7, 10)

sum_nyc <- clean_nyc |> group_by(year) |> summarise(total_fatal = sum(NUMBER.OF.PERSONS.KILLED)) |> mutate(city = "NYC")

# Boulder, CO

# url
co_url <- "https://opendata.arcgis.com/datasets/4918642e10c84c7fbb8d8590c5b9b216_0.csv"

# path to your CSV file
dest3 <- "data-raw/boulder_data.csv"

# download file
download.file(co_url, dest3)

#read csv
co_data <- read.csv("data-raw/boulder_data.csv")

# cleaning
#reportedyear, numkilled
clean_co <- co_data |> select(14, 27) |> filter(NumKilled != 0)

# Assuming 'old_column_name' is the current name of the column
year <- "year"

# Change the name of the column
colnames(clean_co)[colnames(clean_co) == "ReportedYear"] <- year

sum_co <- clean_co |> group_by(year) |> summarise(total_fatal = sum(NumKilled)) |> mutate(city = "Boulder")

# Richmond, VA

# url
va_url <- "https://www.virginiaroads.org/datasets/VDOT::crashdata-details-3.csv"

# path to your CSV file
dest4 <- "data-raw/richmond_data.csv"

# download file
download.file(va_url, dest4)

#read csv
va_data <- read.csv("data-raw/richmond_data.csv")

#cleaning
clean_va <- va_data |> select(3, 4) |> filter(CRASH_SEVERITY == "K")

# Assuming 'old_column_name' is the current name of the column
year <- "year"

# Change the name of the column
colnames(clean_va)[colnames(clean_va) == "CRASH_YEAR"] <- year
sum_va <- clean_va |> group_by(year) |> summarise(total_fatal = n()) |> mutate(city = "Richmond")


# Binding data into 1 dataset

vz_fatal <- rbind(sum_dv, sum_nyc, sum_va, sum_co, sum_bos)

usethis::use_data(vz_fatal, overwrite = TRUE)

