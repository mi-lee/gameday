#' Is it Gameday?
#'
#' This function returns TRUE if your NHL team plays today
#' and FALSE otherwise
#'
#' You know then problem: You're in your office writing R code and
#' suddenly have the urge to check whether your NHL team has a game today.
#' Before you know it you just wasted 15 minutes browsing the lastest
#' news on your favorite hockey webpage.
#' Suffer no more! You can now ask R directly, without tempting yourself
#' by firing up your web browser.
#'
#' @param team The name of your team. The default is set to the Canucks
#' @param date The date you are checking
#' @return Logical. It returns \code{TRUE} if \code{team} has an NHL game today,
#' \code{FALSE} otherwise
#' @note case in \code{team} is ignored
#' @export
#' @examples
#' gday("canucks")
#' gday("Bruins")
gday <- function(team = "canucks", date = Sys.Date()){
	if(!internet_connection()) {
		stop("No internet connection. Data cannot be accessed.")
	}
	else if (!is.character(team)) {
		stop("Please input team name as a string!")
	}
	else {
		assertthat::assert_that(check_date(as.Date(date)))
		url <- paste0("http://live.nhle.com/GameData/GCScoreboard/", date, ".jsonp")
		grepl(team, RCurl::getURL(url), ignore.case = TRUE)
	}
}
