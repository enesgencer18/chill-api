library(ChillModels)
library(testthat)

source("./chilling_model.R")

temp_vec <- rnorm(10, 30)

expect_that("Utah Model Unit Test:",
            {
              expect_equal(chilling_model(x = temp_vec, model = "utah"), utah_model(temp_vec))
            })

expect_that("North-Carolina Model Unit Test:",
            {
              expect_equal(chilling_model(x = temp_vec, model = "north_carolina"), north_carolina(temp_vec))
            })
