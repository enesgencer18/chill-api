library(plumber)

r <- plumb("./plumber.R")
r$run(port = 8181, host = "0.0.0.0")
