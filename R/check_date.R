check_date <- function(date) {
	tryCatch({date = as.Date(date); TRUE},
					 error = function(err) FALSE)
}
