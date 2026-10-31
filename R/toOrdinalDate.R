#' Convert dates to long, ordinal calendar dates
#'
#' Converts calendar dates to the long form with an ordinal day, for example
#' `"October 9th, 2017"`.
#'
#' Month names are always English, whatever the session locale, so the result
#' does not change from one machine to the next. English is the only language
#' implemented; any other `language` signals an error.
#'
#' @param date `NULL` (the default, today's date from [Sys.Date()]), a `Date` or
#'   `POSIXt` vector, or a character vector of dates such as `"2017-10-09"` or
#'   `"2017-10-9"`. Missing values return `NA`.
#' @param language A single string. Only `"English"` is implemented.
#'
#' @return A character vector with one element per date; one element for
#'   `date = NULL`.
#'
#' @examples
#' toOrdinalDate()
#' toOrdinalDate("2017-10-9")
#' toOrdinalDate(c("2022-11-21", "2019-1-3", "1976-2-2", "1965-2-18"))
#' @export
toOrdinalDate <- function(date = NULL, language = "English") {
  language <- .check_language(language)
  if (language != "ENGLISH") {
    stop("toOrdinalDate() currently supports English only; '", language,
         "' is not implemented.", call. = FALSE)
  }
  if (is.null(date)) date <- Sys.Date()
  d <- tryCatch(as.Date(date), error = function(e) {
    stop("'date' must be NULL, a Date, a POSIXt or a character string such as '2017-10-09'.",
         call. = FALSE)
  })
  day <- as.integer(format(d, "%d"))
  month <- as.integer(format(d, "%m"))
  out <- paste0(month.name[month], " ", toOrdinal(day), ", ", format(d, "%Y"))
  out[is.na(d)] <- NA_character_
  out
}
