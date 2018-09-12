# Builds and returns the url that is required to send the query to the server.
# addr should be a character vector containing the address that is to be geocoded.
# key should be the mapquest api key that is necessary to send the request. 
# ctry is optional and can entail a country specification in ISO 3166-1 (<https://en.wikipedia.org/wiki/ISO_3166-1>)

build_api <- function(addr, key, ctry) {
  
  # Dependencies
  require(RCurl)
  
  # Check for missing arguments
  opt_args <- list(addr = missing(addr), 
                   key = missing(key), 
                   ctry = missing(ctry))
  
  # Stop if address or key is misssing
  if (opt_args$addr | opt_args$key) {
    stop("address or key are missing")
  }
  
  # Check arguments. Stop if addr and key are not character vectors
  stopifnot(is.character(addr))
  stopifnot(is.character(key))
  
  # Escape addr to machine readable url
  addr <- curlEscape(addr)
  
  # Set basics of query
  root <- "https://open.mapquestapi.com/nominatim/v1/search.php?"
  
  if (opt_args$ctry) {
    q_args <- list(format = "json",
                   key = key,
                   q = addr)
  } else {
    q_args <- list(format = "json",
                   key = key,
                   q = addr,
                   countrycodes = ctry)
  }
  
  q_args <- paste(names(q_args), q_args, sep = "=", collapse = "&")
  q <- paste0(root, q_args)
  
  # Return query
  return(q)
  
}
