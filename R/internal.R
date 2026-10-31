.supported_languages <- c(
  "DUTCH", "ENGLISH", "FRENCH", "GERMAN", "GERMAN_ALT", "SPANISH", "SWEDISH", "TURKISH"
)

.check_language <- function(language) {
  if (!is.character(language) || length(language) != 1L || is.na(language)) {
    stop("'language' must be a single character string.", call. = FALSE)
  }
  language <- toupper(language)
  if (!language %in% .supported_languages) {
    stop("Language ", language, " is not supported. Supported languages: ",
         paste(.supported_languages, collapse = ", "), call. = FALSE)
  }
  language
}

.check_convert_to <- function(convert_to) {
  if (!is.character(convert_to) || length(convert_to) != 1L || is.na(convert_to)) {
    stop("'convert_to' must be a single character string.", call. = FALSE)
  }
  convert_to <- gsub("_", " ", toupper(convert_to))
  if (!convert_to %in% c("ORDINAL NUMBER", "ORDINAL WORD")) {
    stop("'convert_to' must be 'ordinal_number' or 'ordinal_word'.", call. = FALSE)
  }
  convert_to
}

# A whole number as digits, never in scientific notation (100000 is "100000", not "1e+05").
.digits <- function(n) formatC(n, format = "f", digits = 0)

.ordinal_suffix <- function(n, language) {
  last1 <- n %% 10
  last2 <- n %% 100
  switch(language,
    DUTCH = if (last2 >= 11 && last2 <= 19) "de" else if (last1 %in% c(0, 1, 8)) "ste" else "de",
    ENGLISH = if (last2 %in% c(11, 12, 13)) "th" else
      c("th", "st", "nd", "rd", "th", "th", "th", "th", "th", "th")[last1 + 1],
    FRENCH = if (n == 1) "re" else "e",
    GERMAN = if (n <= 19) "te" else "ste",
    GERMAN_ALT = ".",
    # "primer" and "tercer" before a masculine noun; "und\u00E9cimo" (11) takes none.
    SPANISH = if (last2 != 11 && last1 %in% c(1, 3)) ".er" else ".\u00BA",
    SWEDISH = if (last2 %in% c(11, 12) || last1 %in% c(0, 3:9)) ":e" else ":a",
    TURKISH = "."
  )
}

# ── Turkish ordinal words (0-999) ───────────────────────────────────────────
.turkish_ordinal_word <- function(n) {
  if (n > 999) {
    stop("Ordinal words above 999 are not currently supported.", call. = FALSE)
  }
  word <- .turkish_cardinal_word(n)
  paste0(.turkish_ordinal_stem(word), .turkish_ordinal_suffix(word))
}

.turkish_cardinal_word <- function(n) {
  ones <- c("", "bir", "iki", "\u00FC\u00E7", "d\u00F6rt", "be\u015F", "alt\u0131", "yedi", "sekiz", "dokuz")
  tens <- c("", "on", "yirmi", "otuz", "k\u0131rk", "elli", "altm\u0131\u015F", "yetmi\u015F", "seksen", "doksan")
  if (n == 0) return("s\u0131f\u0131r")
  h <- n %/% 100
  t <- (n %% 100) %/% 10
  o <- n %% 10
  parts <- c(
    if (h == 1) "y\u00FCz" else if (h > 1) paste(ones[h + 1], "y\u00FCz"),
    if (t > 0) tens[t + 1],
    if (o > 0) ones[o + 1]
  )
  paste(parts, collapse = " ")
}

# "d\u00F6rt" softens its final consonant before a vowel: d\u00F6rd\u00FCnc\u00FC.
.turkish_ordinal_stem <- function(word) {
  if (grepl("d\u00F6rt$", word)) sub("t$", "d", word) else word
}

# Four-way vowel harmony; a stem ending in a vowel takes -nc- rather than -inc-.
.turkish_ordinal_suffix <- function(word) {
  chars <- strsplit(word, "")[[1]]
  vowels <- c("a", "\u0131", "o", "u", "e", "i", "\u00F6", "\u00FC")
  last_vowel <- utils::tail(chars[chars %in% vowels], 1)
  harmonic <- if (last_vowel %in% c("a", "\u0131")) "\u0131"
    else if (last_vowel %in% c("o", "u")) "u"
    else if (last_vowel %in% c("e", "i")) "i"
    else "\u00FC"
  ends_in_vowel <- utils::tail(chars, 1) %in% vowels
  paste0(if (!ends_in_vowel) harmonic, "nc", harmonic)
}
