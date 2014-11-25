# A helper fucntion used to check whether there is internet connection
internet_connection <- function() {
	tryCatch({RCurl::getURL("www.github.com"); TRUE},
					 error = function(err) FALSE)
}
