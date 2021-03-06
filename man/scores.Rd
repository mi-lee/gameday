% Generated by roxygen2 (4.0.2): do not edit by hand
\name{scores}
\alias{scores}
\title{Show scores}
\usage{
scores(date = Sys.Date())
}
\arguments{
\item{\code{date}}{date of the game}
}
\value{
data.frame a dataframe of the scores. The first column will return the home team; the second column will return the away team; the third column will return the score for the home team; the last column will rturn the score for the away team.
}
\description{
This function returns a data frame presenting the scores for the particular specified date of a game.
}
\details{
This function allows you to check the score of a particular date of a game, much like gday.
}
\note{
The \code{date} must be entered as a string in the format: "yyyy-mm-dd"; if the date entry is not provided, the score for today's date will be checked
}
\examples{
scores("2014-11-03")
scores(Sys.Date())
}

