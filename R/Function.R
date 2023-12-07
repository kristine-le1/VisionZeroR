library(ggplot2)

vz_graph <- function(cities) {

  # wrangle
  new <- vz_data_2023 |> filter(city %in% cities)

  # plotting
  ggplot(data = new,
         aes(x = year,
             y = fatal_perc,
             color = city,
             group = city)) +
    geom_point() +
    geom_line() +
    labs(title = "Normalized vehicular fatalities per year for VisionZero cities",
         x = "Year",
         y = "Normalized fatalities by percent of population",
         color = "City")
}

# Examples: argument has to be character vector
first <- vz_graph(c("Boston", "Denver", "Boulder", "NYC"))
first

second <- vz_graph(c("NYC", "Denver"))
second



# # Load the readr package for reading CSV files
# library(readr)
#
# # Specify the path to your CSV file
# file_path <- "data-raw/boston_data.csv"
#
# # Read the CSV file into a dataframe, using a more descriptive variable name
# population_df <- read_csv(file_path)
#
# # Extract the Boston city population and create a new dataframe
# # Ensure the column name matches exactly as in your CSV file
# bos_population_data <- data.frame(BostonPopulation = population_df[1, "Boston city, Massachusetts"])
#
# # Print the new dataframe with Boston city population
# print(bos_population_data)
#
#
# # Load required libraries
# library(readr)
# library(dplyr)
# library(ggplot2)
#
# # Reading the Boston population data
# population_df <- read_csv("~/Documents/SDS 270 /VisionZeroProject/vision0/VisionZeroProject/Population data/QuickFacts Dec-04-2023.csv")
# boston_population <- as.numeric(gsub(",", "", population_df[1, "Boston city, Massachusetts"]))
#
# # Process the fatality data
# boston_url <- "https://data.boston.gov/dataset/d326a4e3-75f2-42ac-9b32-e2920566d04c/resource/92f18923-d4ec-4c17-9405-4e0da63e1d6c/download/tmp1u21fr8k.csv"
# destfile1 <- "/Users/jeniahfranco/Documents/SDS 270 /VisionZeroProject/vision0/VisionZeroProject/boston_data.csv"
# download.file(boston_url, destfile1)
# boston_data <- read.csv(destfile1)
# clean_boston <- boston_data %>% select(1)
# clean_boston$date_time <- substr(clean_boston$date_time, 1, 4)
# sum_boston <- clean_boston %>%
#   group_by(date_time) %>%
#   summarise(total_fatal = n()) %>%
#   mutate(city = "Boston")
#
# # Calculate proportion of fatalities per capita
# proportion_data <- sum_boston %>%
#   mutate(proportion_fatal = total_fatal / boston_population * 100)
#
# # Visualization
# ggplot(proportion_data, aes(x = date_time, y = proportion_fatal, group = 1)) +
#   geom_line() +
#   geom_point() +
#   theme_minimal() +
#   labs(title = "Yearly Proportion of Fatalities in Boston",
#        x = "Year",
#        y = "Fatalities per Capita (%)")
#
# ################
#
# # Load required libraries
# library(readr)
# library(dplyr)
# library(ggplot2)
#
# # url
#
# bos_url <- "https://data.boston.gov/dataset/d326a4e3-75f2-42ac-9b32-e2920566d04c/resource/92f18923-d4ec-4c17-9405-4e0da63e1d6c/download/tmp1u21fr8k.csv"
#
# # destination file
#
# dest0 <- "data-raw/boston_data.csv"
#
# # download file
#
# download.file(bos_url, dest0)
#
# bos_data <- read.csv("data-raw/boston_data.csv")
#
# # cleaning
# clean_bos <- bos_data |> select(1,)
#
# # change column name
# year <- "year"
# colnames(clean_bos)[colnames(clean_bos) == "date_time"] <- year
#
# # cleaning up year column
# clean_bos$year <- substr(clean_bos$year, 1, 4)
#
# # summarize
# sum_bos <- clean_bos |> group_by(year) |> summarise(total_fatal = n()) |> mutate(city = "Boston")
#
#
# # Reading the Boston population data
# population_df <- read_csv("~/Downloads/VisionZeroR-main/Population data/QuickFacts Dec-04-2023.csv")
# boston_population <- as.numeric(gsub(",", "", population_df[1, "Boston city, Massachusetts"]))
#
# # Process the fatality data
# boston_url <- "https://data.boston.gov/dataset/d326a4e3-75f2-42ac-9b32-e2920566d04c/resource/92f18923-d4ec-4c17-9405-4e0da63e1d6c/download/tmp1u21fr8k.csv"
# destfile1 <- "~/Downloads/VisionZeroR-main/Population data/QuickFacts Dec-04-2023.csv"
#
# download.file(bos_url, dest0)
#
# bos_data <- read.csv("data-raw/boston_data.csv")
#
# download.file(boston_url, destfile1)
# boston_data <- read.csv(destfile1)
# clean_boston <- boston_data %>% select(1)
# clean_boston$date_time <- substr(clean_boston$date_time, 1, 4)
# sum_boston <- clean_boston %>%
#   group_by(date_time) %>%
#   summarise(total_fatal = n()) %>%
#   mutate(city = "Boston")
#
# # Calculate proportion of fatalities per capita
# proportion_data <- sum_boston %>%
#   mutate(proportion_fatal = total_fatal / boston_population * 100)
#
# # Visualization using ggplot2
# ggplot(proportion_data, aes(x = date_time, y = proportion_fatal, group = 1)) +
#   geom_line() +
#   geom_point() +
#   theme_minimal() +
#   labs(title = "Yearly Proportion of Fatalities in Boston",
#        x = "Year",
#        y = "Fatalities per Capita (%)")
#
# # Graphing Function
#
#   # Function body
#
#   # Libraries
#   library(ggplot2)
#
#   # Graphing function definition
#   plot_data <- function(data, x_variable, y_variable, title = "plot", x_label = "X-axis", y_label = "Y-axis") {
#
#     # ggplot object
#     my_plot <- ggplot(data, aes(x = {{x_variable}}, y = {{y_variable}})) +
#
#       # Specify the type of plot (e.g., points, lines, etc.)
#       geom_point() +
#
#       # Labels and title
#       labs(title = title, x = x_label, y = y_label) +
#
#       # Customize theme if necessary
#       theme_minimal()
#
#     # Print plot object
#     print(my_plot)
#
#   }
#
#   # Example usage of the graphing function
#  # plot_data(data = my_data, x_variable = x_values, y_variable = y_values, title = "My Custom Plot", x_label = "X-axis Label", y_label = "Y-axis Label")



