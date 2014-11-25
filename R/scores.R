#' Show scores
#'
#' This function returns a data frame presenting the scores for the particular specified date of a game.
#'
#' This function allows you to check the score of a particular date of a game, much like gday.
#'
#' @param \code{date}  date of the game
#' @return data.frame a dataframe of the scores. The first column will return the home team; the second column will return the away team; the third column will return the score for the home team; the last column will rturn the score for the away team.
#' @note The \code{date} must be entered as a string in the format: "yyyy-mm-dd"; if the date entry is not provided, the score for today's date will be checked
#' @export
#' @examples
#' scores("2014-11-03")
#' scores(Sys.Date())

scores <- function(date = Sys.Date()){
	if (internet_connection() == FALSE){
		return("No internet connection. Data cannot be obtained.")}

	# test that the date is correctly formatted
	assertthat::assert_that(check_date(date))

	url  <- paste0('http://live.nhle.com/GameData/GCScoreboard/',
									 date, '.jsonp')
	raw <- RCurl::getURL(url)
	json <- gsub('([a-zA-Z_0-9\\.]*\\()|(\\);?$)', "", raw, perl = TRUE)
	data <- jsonlite::fromJSON(json)$games
	with(data,
			 data.frame(home = paste(htn, htcommon),
			 					 away = paste(atn, atcommon),
			 					 home_score = hts,
			 					 away_score = ats))
}
