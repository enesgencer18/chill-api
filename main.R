library(plumber)

r <- plumb("./plumber.R")
r$run(port = 7575, host = "0.0.0.0")
