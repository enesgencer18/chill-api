library(ChillModels)

chilling_model <- function(x, model){
  
  if(model == "utah"){
    res <- utah_model(x)
  } else if(model == "north_carolina"){
    res <- north_carolina(x)
  } else{res <- "Chilling model is not selected correctly"}
  
  return(res)
}