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
  addr <- paste0("&q=", addr)
  
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