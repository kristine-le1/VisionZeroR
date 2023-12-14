library(ggplot2)
library(VisionZeroR)
library(vdiffr)

  test_that("Graphing test", {
    vdiffr::expect_doppelganger(
      title = "vz_graph",
      fig = vz_graph(c("Boston", "Denver", "Boulder", "NYC", "Richmond"))
    )
})
