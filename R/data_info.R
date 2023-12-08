#' Data for VisionZero crash fatalities and respective city population data
#'
#' @format A data frame with 36 rows and 5 columns:
#' \describe{
#'   \item{year}{Year of fatalities}
#'   \item{total_fatal}{number of documented fatalities resulting from a car crash per year as per each cities respective VisionZero data set. Note that some cities have a specific fatalities data set and other cities had a more general one that needed to be filtered for fatalities}
#'   \item{city}{City where fatality took place. Note that this is NOT an exhausive list of ALL VisionZero cities involved in the program.}
#'   \item{pop_size}{Population size for city listed as of 2022}
#'   \item{fatal_perc}{Proportion of each cities population involved in vehicular fatalities per year calcuated with VisionZero data and Census population data}

#'   ...
#' }
#' @source
#' <https://data.boston.gov/dataset/d326a4e3-75f2-42ac-9b32-e2920566d04c/resource/92f18923-d4ec-4c17-9405-4e0da63e1d6c/download/tmp1u21fr8k.csv>
#' <https://data.cityofnewyork.us/api/views/h9gi-nx95/rows.csv?date=20231129&accessType=DOWNLOAD>
#' <https://www.denvergov.org/media/gis/DataCatalog/traffic_accidents/csv/traffic_accidents.csv>
#' <https://opendata.arcgis.com/datasets/4918642e10c84c7fbb8d8590c5b9b216_0.csv>
#' <https://www.virginiaroads.org/datasets/VDOT::crashdata-details-3.csv
#' <https://www.census.gov/quickfacts/fact/csv/bostoncitymassachusetts,richmondcityvirginia,denvercountycolorado,bouldercitycolorado,newyorkcitynewyork/PST045222>

"vz_data_2023"
