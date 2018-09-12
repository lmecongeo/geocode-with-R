# geocode-with-R
A small set of functions that use the open mapquest API to geocode addresses. 

MapQuest offers open APIs to for all types of geocoding. In this repository, you find functions that use the Open Search (Nominatim) API, which is based on OpenStreetmapData. 

The gecoding involves three steps:
1) Building the url to send the request to the API: build_api()
2) Sending the request to the server and saving the response: geocode_nominatim()
3) Parsing the response, i.e. geographic coordinates: get_latlon()
