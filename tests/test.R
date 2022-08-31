print("Required packages are loading...")

library("ChillModels")
library("plumber")
library("jsonlite")
library("reprex")
library("testthat")

print("Packages are loaded successfully!")

source("./chilling_model.R")

print("Unit tests are started...")

temp_vec <- rnorm(10, 30)

test_that("Utah Model Unit Test:",
            {
              expect_equal(chilling_model(x = temp_vec, model = "utah"), utah_model(temp_vec))
            })

test_that("North-Carolina Model Unit Test:",
            {
              expect_equal(chilling_model(x = temp_vec, model = "north_carolina"), north_carolina(temp_vec))
            })

print("Unit tests are done!")
