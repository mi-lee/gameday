library(testthat)
library(gameday)
library(devtools)

test_that("Vancouver Canucks had a game against Nashville Predators on 2014-11-02", {
	expect_true(gday(team = "canucks",   date = "2014-11-02"))
	expect_true(gday(team = "predators", date = "2014-11-02"))
})

test_that("case is ignored", {
	expect_equal(gday("canucks"), gday("CANUCKS"))
})

test_that("Vancouver Canucks did not play on 2014-12-21", {
	expect_false(gday(team = "canucks", date = "2014-11-21"))
	expect_is(gday("canucks"), "logical")
})

test_that("Invalid date", {
	expect_error(gday(team = "bruins", date = "113-232-2323"))
	expect_error(gday(team = "bruins", date = "forever"))
})

test_that("Invalid date; please return a new date", {
	expect_error(scores("23-23-111"))
	expect_error(scores("tomorrow and tomorrow"))
	expect_error(scores("yesterday"))
})

test_that("The class of returned object should be a dataframe", {
	expect_is(scores(Sys.Date()), "data.frame")
})

test_that("There was 1 game on May 28th", {
	expect_true(nrow(scores("2014-05-28")) == 1)
})
test_that("The score for Chicago Blackhawks on May 28 was 5", {
	expect_true((scores("2014-05-28")[1,3]) == 5)
})

test_that("Koreans don't play hockey!", {
	expect_false(gday("seoul"))
})


test_that("Input team name as a string!", {
	expect_error(gday(111))
	expect_error(gday(canucks))
})
