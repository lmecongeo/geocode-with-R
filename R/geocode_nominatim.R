# geocode_nominatim() needs a machine readable url to send the request to the mapquest server. That is, use build_api() to build such an url.

geocode_nominatim <- function(q) {
  
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
