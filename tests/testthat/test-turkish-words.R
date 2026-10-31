word <- function(n) toOrdinal(n, language = "Turkish", convert_to = "ordinal_word")

test_that("Turkish ordinal words follow vowel harmony", {
  expect_equal(word(1:10), c("birinci", "ikinci", "\u00FC\u00E7\u00FCnc\u00FC", "d\u00F6rd\u00FCnc\u00FC",
    "be\u015Finci", "alt\u0131nc\u0131", "yedinci", "sekizinci", "dokuzuncu", "onuncu"))
})

test_that("Turkish compounds inflect only the last word", {
  expect_equal(word(c(0, 20, 21, 100, 101, 200, 345)),
    c("s\u0131f\u0131r\u0131nc\u0131", "yirminci", "yirmi birinci", "y\u00FCz\u00FCnc\u00FC",
      "y\u00FCz birinci", "iki y\u00FCz\u00FCnc\u00FC",
      "\u00FC\u00E7 y\u00FCz k\u0131rk be\u015Finci"))
})

test_that("ordinal words beyond 999 are refused", {
  expect_error(word(1000), "999")
})

test_that("ordinal words for other languages are refused, not guessed", {
  expect_error(toOrdinal(1, "English", "ordinal_word"), "not implemented")
  expect_error(toOrdinal(1, "French", "ordinal word"), "not implemented")
})

test_that("convert_to accepts spaces, underscores and any case", {
  expect_equal(toOrdinal(1, "Turkish", "Ordinal Word"), "birinci")
})
