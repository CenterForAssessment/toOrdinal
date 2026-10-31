test_that("negative, fractional and infinite numbers are rejected", {
  msg <- "Number supplied to 'toOrdinal' must be a non-negative integer."
  expect_error(toOrdinal(-1), msg, fixed = TRUE)
  expect_error(toOrdinal(1.5), msg, fixed = TRUE)
  expect_error(toOrdinal(Inf), msg, fixed = TRUE)
  expect_error(toOrdinal(-1, "GERMAN"), msg, fixed = TRUE)
})

test_that("non-numeric input is rejected with a clear message", {
  expect_error(toOrdinal("a"), "must be numeric")
  expect_error(toOrdinal(NULL), "must be numeric")
})

test_that("missing values pass through as NA", {
  expect_equal(toOrdinal(c(1, NA, 3)), c("1st", NA, "3rd"))
  expect_equal(toOrdinal(NA_real_), NA_character_)
})

test_that("zero-length input gives zero-length output", {
  expect_identical(toOrdinal(numeric(0)), character(0))
})

test_that("unsupported or malformed language is an error", {
  expect_error(toOrdinal(1, "Klingon"), "not supported")
  expect_error(toOrdinal(1, c("English", "French")), "single character string")
  expect_error(toOrdinal(1, NA_character_), "single character string")
  expect_error(toOrdinal(1, convert_to = "cardinal"), "ordinal_number")
})

test_that("integer input works", {
  expect_equal(toOrdinal(1:3), c("1st", "2nd", "3rd"))
})
