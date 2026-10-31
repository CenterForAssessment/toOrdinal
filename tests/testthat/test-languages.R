ord <- function(n, language) toOrdinal(n, language = language)

test_that("Dutch handles 0-30", {
  expect_equal(ord(0:30, "DUTCH"), c("0ste", "1ste", "2de", "3de", "4de", "5de", "6de", "7de",
    "8ste", "9de", "10ste", "11de", "12de", "13de", "14de", "15de", "16de", "17de", "18de",
    "19de", "20ste", "21ste", "22de", "23de", "24de", "25de", "26de", "27de", "28ste",
    "29de", "30ste"))
})

test_that("French uses 're' for 1 and 'e' otherwise", {
  expect_equal(ord(c(1, 2, 3, 11, 21, 100), "French"), c("1re", "2e", "3e", "11e", "21e", "100e"))
})

test_that("German handles 0-20 and larger numbers", {
  expect_equal(ord(0:20, "GERMAN"), c(paste0(0:19, "te"), "20ste"))
  expect_equal(ord(c(21, 100), "German"), c("21ste", "100ste"))
})

test_that("German_alt and Turkish numbers use a period", {
  expect_equal(ord(c(1, 25), "german_alt"), c("1.", "25."))
  expect_equal(ord(c(1, 25), "Turkish"), c("1.", "25."))
})

test_that("Spanish apocopates 1 and 3, but not 11", {
  expect_equal(ord(c(1, 2, 3, 4, 5, 11, 13, 21, 23, 111), "Spanish"),
               c("1.er", "2.\u00BA", "3.er", "4.\u00BA", "5.\u00BA", "11.\u00BA", "13.er",
                 "21.er", "23.er", "111.\u00BA"))
})

test_that("Swedish handles 0-40 and 101-112", {
  expect_equal(ord(0:40, "swedish"), c("0:e", "1:a", "2:a", paste0(3:20, ":e"), "21:a", "22:a",
    paste0(23:30, ":e"), "31:a", "32:a", paste0(33:40, ":e")))
  expect_equal(ord(c(101, 102, 111, 112), "swedish"), c("101:a", "102:a", "111:e", "112:e"))
})

test_that("language matching ignores case", {
  expect_equal(toOrdinal(2, "dUtCh"), "2de")
})
