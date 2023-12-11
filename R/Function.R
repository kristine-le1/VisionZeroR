#' Creates point graph of vehicular fatalities normalized to the population size for user-given VisionZero cities
#'
#' Given 1 to 5 VisionZero cities (Boston, NYC, Boulder, Denver or Richmond), this function creates a point graph of vehicular fatalities throughout the years (from 2008-2023) normalized to the population size of the city for the user-given cities. This function uses vehicular fatality and population data aggregated for these cities in the `vz_data_2023` data set
#'
#' @param character A character vector of up to 5 elements containing city names from five different VisionZero cities: Boston, NYC, Boulder, Denver, and Richmond.
#'
#' @return A point graph in the `plots` window displaying the percentage of vehicular fatalities based on population size across the years 2008-2023 (year range dependent on the available data for the user-given cities).
#'
#' @examples
#' # Graphing vehicular fatality data for just Richmond
#' vz_graph("Richmond")
#' # Graphing vehicular fatality data for Boston and Boulder
#' vz_graph(c("Boston", "Boulder"))
#'
#' @importFrom dplyr filter
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_point
#' @importFrom ggplot2 geom_line
#' @importFrom ggplot2 labs
#' @importFrom ggplot2 aes
#' @export

vz_graph <- function(cities) {

  new <- vz_data_2023 |> dplyr::filter(city %in% cities)

  # plotting
  ggplot2::ggplot(data = new,
         ggplot2::aes(x = year,
             y = fatal_perc,
             color = city,
             group = city)) +
    ggplot2::geom_point() +
    ggplot2::geom_line() +
    ggplot2::labs(title = "Normalized vehicular fatalities per year for VisionZero cities",
         x = "Year",
         y = "Normalized fatalities by percent of population",
         color = "City")
}



