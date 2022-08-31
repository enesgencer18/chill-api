#
# This is a Plumber API. In RStudio 1.2 or newer you can run the API by
# clicking the 'Run API' button above.
#
# In RStudio 1.1 or older, see the Plumber documentation for details
# on running the API.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)
library(jsonlite)
library(reprex)

source("./chilling_model.R")


#* @apiTitle Chill API

#* Echo back the input
#* @get /echo
function(){
  list(Status = paste0("Chilling API is working properly!"),
       Time = Sys.time())
}

#* Log some information about the incoming request
#* @filter logger
function(req){
  cat(as.character(Sys.time()), "-",
      req$REQUEST_METHOD, req$PATH_INFO, "-",
      req$HTTP_USER_AGENT, "@", req$REMOTE_ADDR, "\n")
  
  forward()
}

#* Get model input
#* @filter /chilling_model
function(req, res){
  
  if(grepl("chilling_model", req$PATH_INFO)){
    req$data <- tryCatch(jsonlite::fromJSON(req$postBody), 
                         error = function(x){
                           return(NULL)
                         })
    
    if(is.null(req$data)){
      res$status <- 400
      return(
        list(error = "No JSON file is found in the request")
      )
    }
    
    list_of_inputs <- req$data
    req$results <- chilling_model(x = list_of_inputs$x, model = list_of_inputs$model)
  }
  forward()
  
}

#* Return the chilling model results
#* @post /chilling_model/values
function(req){
  res <- req$results
  
}

