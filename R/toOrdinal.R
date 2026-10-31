#' Convert cardinal numbers to ordinal numbers or words
#'
#' Converts cardinal numbers to ordinal numbers by appending a language-specific
#' ordinal indicator (see <https://en.wikipedia.org/wiki/Ordinal_indicator>), or,
#' where implemented, to ordinal words.
#'
#' @section Supported languages:
#' `"Dutch"`, `"English"`, `"French"`, `"German"`, `"German_alt"`, `"Spanish"`,
#' `"Swedish"` and `"Turkish"`. Matching is case-insensitive. `"German_alt"` uses
#' the period convention (`1.`), as does Turkish for ordinal numbers.
#'
#' | Language | `1` | `2` | `3` | `11` |
#' |:---------|:----|:----|:----|:-----|
#' | English  | 1st | 2nd | 3rd | 11th |
#' | Dutch    | 1ste | 2de | 3de | 11de |
#' | French   | 1re | 2e | 3e | 11e |
#' | German   | 1te | 2te | 3te | 11te |
#' | Spanish  | 1.er | 2.º | 3.er | 11.º |
#' | Swedish  | 1:a | 2:a | 3:e | 11:e |
#' | Turkish  | 1. | 2. | 3. | 11. |
#'
#' @section Ordinal words:
#' `convert_to = "ordinal_word"` is implemented for Turkish, for numbers 0 to
#' 999. Other languages signal an error rather than returning a guess.
#'
#' @param cardinal_number A numeric vector of non-negative whole numbers. Missing
#'   values return `NA`.
#' @param language A single string naming the language whose rules are used.
#'   Defaults to `"English"`.
#' @param convert_to Either `"ordinal_number"` (the default: the number followed
#'   by its ordinal indicator) or `"ordinal_word"`. Underscores and spaces are
#'   interchangeable and case is ignored.
#'
#' @return A character vector the same length as `cardinal_number`.
#'
#' @examples
#' toOrdinal(1)
#' toOrdinal(1, language = "French")
#'
#' toOrdinal(1:20)
#' toOrdinal(1:25, language = "French")
#'
#' toOrdinal(c(11, 21, 100, 111))
#' toOrdinal(4, language = "Turkish", convert_to = "ordinal_word")
#' @export
toOrdinal <- function(cardinal_number,
                      language = "English",
                      convert_to = "ordinal_number") {
  language <- .check_language(language)
  convert_to <- .check_convert_to(convert_to)
  if (!is.numeric(cardinal_number)) {
    stop("Number supplied to 'toOrdinal' must be numeric.", call. = FALSE)
  }
  ok <- !is.na(cardinal_number)
  if (any(!is.finite(cardinal_number[ok]) | cardinal_number[ok] < 0 |
            cardinal_number[ok] != floor(cardinal_number[ok]))) {
    stop("Number supplied to 'toOrdinal' must be a non-negative integer.", call. = FALSE)
  }
  if (convert_to == "ORDINAL WORD" && language != "TURKISH") {
    stop("Ordinal words are not implemented for language '", language,
         "'. Only 'Turkish' is available.", call. = FALSE)
  }
  vapply(cardinal_number, function(n) {
    if (is.na(n)) return(NA_character_)
    if (convert_to == "ORDINAL NUMBER") {
      paste0(.digits(n), .ordinal_suffix(n, language))
    } else {
      .turkish_ordinal_word(n)
    }
  }, character(1), USE.NAMES = FALSE)
}
