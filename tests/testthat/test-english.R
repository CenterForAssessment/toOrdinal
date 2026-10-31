test_that("English handles 0-40", {
  expected <- c("0th", "1st", "2nd", "3rd", "4th", "5th", "6th", "7th", "8th", "9th",
    "10th", "11th", "12th", "13th", "14th", "15th", "16th", "17th", "18th", "19th",
    "20th", "21st", "22nd", "23rd", "24th", "25th", "26th", "27th", "28th", "29th",
    "30th", "31st", "32nd", "33rd", "34th", "35th", "36th", "37th", "38th", "39th", "40th")
  expect_equal(toOrdinal(0:40), expected)
})

test_that("English teens stay 'th' at any magnitude", {
  expect_equal(toOrdinal(c(101, 102, 111, 112, 113, 121)),
               c("101st", "102nd", "111th", "112th", "113th", "121st"))
})

test_that("large numbers are not written in scientific notation", {
  expect_equal(toOrdinal(100000), "100000th")
  expect_equal(toOrdinal(1e6 + 1), "1000001st")
})
