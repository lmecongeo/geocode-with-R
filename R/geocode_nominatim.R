geocode_nominatim <- function(q) {
  
  # q should entail the url that is requested
  
  # Load packages
  require(rjson)
  
  # Send request
  r <- readLines(q, warn = FALSE)
  r <- fromJSON(r)
  
  # Return response. Just the first one.
  if (length(r) == 0) {
    r <- NA
    return(r)
  } else {
    r <- r[[1L]]
    return(r)
  }
  
}
