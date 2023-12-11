# This file is part of the standard setup for testthat.
# It is recommended that you do not modify it.
#
# Where should you do additional test configuration?
# Learn more about the roles of various files in:
# * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
# * https://testthat.r-lib.org/articles/special-files.html

library(testthat)
library(VisionZeroR)

test_check("VisionZeroR")

library(testthat)
library(ggplot2)

test_that("Graphing Test", {
  vz_data_2023 <- data.frame(
    city = c("Boston", "Denver", "Boulder", "NYC", "Richmond"),
    year = rep(2008:2023, each = 4),
    fatal_perc = runif(20)
  )

  test_plot <- vz_graph(c("Boston", "Denver", "Boulder", "NYC", "Richmond"))

  expected_plot <-   ggplot(data = new,
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

  #actual plot vs expected plot
  expect_identical(test_plot, expected_plot)
})

test_that("VisionZeroR objects have 5 elements", {
  expect_equal(length(VisionZeroR(3)), 5)
})

test_that("VisionZeroR objects are type character", {
  expect_true(is.character(VisionZeroR(3)))
})
