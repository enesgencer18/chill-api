library(plumber)

r <- plumb("./plumber.R")
r$run(port = 7576, host = "0.0.0.0")
