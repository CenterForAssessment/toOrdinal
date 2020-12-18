context("Dutch tests")

test_that("toOrdinal correctly processes integers 0-30 in Dutch", {
  first_30 <- c("0de", "1ste", "2de", "3de", "4de", "5de", "6de", "7de", "8ste",
                "9de", "10de", "11de", "12de", "13de", "14de", "15de", "16de",
                "17de", "18de", "19de", "20ste", "21ste", "22ste", "23ste",
                "24ste", "25ste", "26ste", "27ste", "28ste", "29ste", "30ste")
  using_toOrdinal <- sapply(0:30, "toOrdinal", "DUTCH")

  expect_equal(
    first_30, using_toOrdinal
  )
})

test_that("toOrdinal correctly errors when given a negative integer.",{

  expect_error(
    toOrdinal(-1, "DUTCH"), "Number supplied to 'toOrdinal' must be a non-negative integer."
  )
})
