get_latlon <- function(r) {
  
  # r should entail the response from geocode_nominatim. If the response was unsucessful NA is returned
  
  if (is.logical(r)) {
    latlon <- list(lat = NA,
                   lon = NA)
    return(latlon)
  } else {
    latlon <- list(lat = r$lat,
                   lon = r$lon)
    return(latlon)
  }
  
}