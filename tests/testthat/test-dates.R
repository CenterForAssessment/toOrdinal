test_that("English dates convert", {
  expect_equal(toOrdinalDate("2017-10-09"), "October 9th, 2017")
  expect_equal(toOrdinalDate("2017-10-9"), "October 9th, 2017")
  expect_equal(toOrdinalDate(c("2022-11-21", "2019-1-3", "1976-2-2", "1965-2-18")),
    c("November 21st, 2022", "January 3rd, 2019", "February 2nd, 1976", "February 18th, 1965"))
})

test_that("teen days are 'th'", {
  expect_equal(toOrdinalDate(c("2024-03-11", "2024-03-12", "2024-03-13")),
    c("March 11th, 2024", "March 12th, 2024", "March 13th, 2024"))
})

test_that("Date and POSIXct inputs work", {
  expect_equal(toOrdinalDate(as.Date("2020-02-29")), "February 29th, 2020")
  expect_equal(toOrdinalDate(as.POSIXct("2020-02-29 12:00:00", tz = "UTC")), "February 29th, 2020")
})

test_that("the default is today and a single string", {
  today <- toOrdinalDate()
  expect_length(today, 1L)
  expect_match(today, "^[A-Z][a-z]+ [0-9]+(st|nd|rd|th), [0-9]{4}$")
})

test_that("month names do not depend on the locale", {
  skip_on_cran()
  old <- Sys.getlocale("LC_TIME")
  on.exit(Sys.setlocale("LC_TIME", old))
  ok <- suppressWarnings(Sys.setlocale("LC_TIME", "fr_FR.UTF-8"))
  skip_if(identical(ok, ""), "French locale not installed")
  expect_equal(toOrdinalDate("2017-10-09"), "October 9th, 2017")
})

test_that("missing dates give NA", {
  expect_equal(toOrdinalDate(c("2017-10-09", NA)), c("October 9th, 2017", NA))
})

test_that("other languages and bad dates are clear errors", {
  expect_error(toOrdinalDate("2017-10-09", "French"), "English only")
  expect_error(toOrdinalDate("not a date"), "'date' must be")
})
