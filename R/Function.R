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



