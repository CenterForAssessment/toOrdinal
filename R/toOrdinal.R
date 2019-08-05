toOrdinal <- function(cardinal_number, language = c("ENGLISH", "FRENCH", "GERMAN", "GERMAN_ALT", "SPANISH", "SWEDISH"), convert_to = "ordinal_number") {
  assertive.numbers::assert_all_are_non_negative(cardinal_number, na_ignore = TRUE)
  assertive.numbers::assert_all_are_whole_numbers(cardinal_number, na_ignore = TRUE)
  language <- toupper(language)
  language <- match.arg(language)
  convert_to <- match.arg(convert_to)
  suffix_fn <- get(paste0("get_suffix_", tolower(language)))
  suffix <- suffix_fn(cardinal_number)
  ordinal_number <- paste0(cardinal_number, suffix)
  ordinal_number[is.na(cardinal_number)] <- NA_character_
  ordinal_number
}

get_ones <- function(cardinal_number) {
  stringi::stri_sub(cardinal_number, -1, -1)
}

get_tens <- function(cardinal_number) {
  ifelse(
    nchar(cardinal_number) == 1,
    "0",
    stringi::stri_sub(cardinal_number, -2, -2)
  )
}

get_suffix_english <- function(cardinal_number) {
  ones <- get_ones(cardinal_number)
  tens <- get_tens(cardinal_number)
  suffix <- rlang::rep_along(cardinal_number, "th")
  suffix[tens != "1" & ones == "1"] <- "st"
  suffix[tens != "1" & ones == "2"] <- "nd"
  suffix[tens != "1" & ones == "3"] <- "rd"
  suffix
}

get_suffix_french <- function(cardinal_number) {
  ones <- get_ones(cardinal_number)
  suffix <- rlang::rep_along(cardinal_number, "e")
  suffix[ones == "1"] <- "re"
  suffix
}

get_suffix_german <- function(cardinal_number) {
  tens <- get_tens(cardinal_number)
  suffix <- rlang::rep_along(cardinal_number, "ste")
  suffix[tens %in% c("0", "1")] <- "te"
  suffix
}

get_suffix_german_alt <- function(cardinal_number) {
  suffix <- rlang::rep_along(cardinal_number, ".")
  suffix
}

get_suffix_spanish <- function(cardinal_number) {
  ones <- get_ones(cardinal_number)
  suffix <- rlang::rep_along(cardinal_number, ".\u00BA")
  suffix[ones %in% c("1", "3")] <- ".er"
  suffix
}

get_suffix_swedish <- function(cardinal_number) {
  ones <- get_ones(cardinal_number)
  tens <- get_tens(cardinal_number)
  suffix <- rlang::rep_along(cardinal_number, ":e")
  suffix[tens != "1" & ones %in% c("1", "2")] <- ":a"
  suffix
}
