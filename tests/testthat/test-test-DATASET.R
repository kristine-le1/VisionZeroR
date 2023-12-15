test_that("vz_data_2023 row count", {
  expect_equal(nrow(vz_data_2023), 36)
})
test_that("vz_data_2023 column count", {
  expect_equal(ncol(vz_data_2023), 5)
})
test_that("variable search", {
  expect_equal(names(vz_data_2023), c("year", "total_fatal", "city", "pop_size", "fatal_perc"))
})
