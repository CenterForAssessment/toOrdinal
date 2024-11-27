### toOrdinal_INTERNAL
`toOrdinal_INTERNAL` <- 
function(cardinal_number, 
		language = "English", 
		convert_to = "ordinal_number") {

	### Tests of arguments
	if (floor(cardinal_number) != cardinal_number || cardinal_number < 0) {
	    stop("Number supplied to 'toOrdinal' must be a non-negative integer.", call. = FALSE)
	}

	supported_languages <- c("DUTCH", "ENGLISH", "FRENCH", "GERMAN", "GERMAN_ALT", "SPANISH", "SWEDISH", "TURKISH")
	if (!toupper(language) %in% supported_languages) {
	    stop(paste("Language", language, "is not supported. Supported languages:", 
	               paste(supported_languages, collapse = ", ")), call. = FALSE)
 	}

	### ORDINAL_NUMBER
	if (gsub("_", " ", toupper(convert_to))=="ORDINAL NUMBER") {

		# Suffix handling by language
		suffix <- switch(toupper(language),
			"DUTCH" = {
				suffix <- if (cardinal_number %% 100 >= 11 && cardinal_number %% 100 <= 19) {
					"de" # Numbers from 11 to 19 always use "de"
				} else if (cardinal_number %% 10 == 1 || cardinal_number %% 10 == 8 || cardinal_number %% 10 == 0) {
					"ste" # Numbers ending in 1, 8, or 0 use "ste"
				} else {
					"de" # All other cases use "de"
				}
			},
			"ENGLISH" = {
				tmp <- strTail(as.character(cardinal_number), 2)
				if (tmp %in% c("11", "12", "13")) "th" else {
					last <- strTail(tmp, 1)
					c("st", "nd", "rd", "th")[(match(last, c("1", "2", "3", "0"), nomatch = 4))]
				}
			},
				"FRENCH" = if (cardinal_number == 1) "re" else "e",
				"GERMAN" = if (cardinal_number <= 19) "te" else "ste",
			"GERMAN_ALT" = ".",
			"SPANISH" = {
				last <- strTail(as.character(cardinal_number), 1)
				if (last %in% c("1", "3")) ".er" else "..\u00BA"
			},
			"SWEDISH" = {
				tmp_1char <- strTail(as.character(cardinal_number), 1)
				tmp_2char <- strTail(as.character(cardinal_number), 2)
				if (tmp_2char %in% c("11", "12") || tmp_1char %in% c("0", "3", "4", "5", "6", "7", "8", "9")) ":e" else ":a"
			},
			"TURKISH" = {
				"."
			},
			stop("Language logic not implemented.")
		) ### END switch

		return(paste0(cardinal_number, suffix))
	} ### END if "ORDINAL_NUMBER"

	if (gsub("_", " ", toupper(convert_to))=="ORDINAL WORD") {

			# Suffix handling by language
		ordinal_word <- switch(toupper(language),
			"DUTCH" = {
				stop("Language logic not implemented.")
			},
			"ENGLISH" = {
				stop("Language logic not implemented.")
			},
			"FRENCH" = {
				stop("Language logic not implemented.")
			},
			"GERMAN" = {
				stop("Language logic not implemented.")
			},
			"GERMAN_ALT" = {
				stop("Language logic not implemented.")
			},
			"SPANISH" = {
				stop("Language logic not implemented.")
			},
			"SWEDISH" = {
				stop("Language logic not implemented.")
			},
			"TURKISH" = {
				word <- get_turkish_number_word(cardinal_number)
			    return(paste0(word, turkish_ordinal_suffix(word)))
			},
			stop("Language logic not implemented.")
		) ### END switch
	} ### END if "ORDINAL_WORD"
} ### END toOrdinal_INTERNAL

### toOrdinalDate_INTERNAL
`toOrdinalDate_INTERNAL` <-
function(
    date=NULL,
	language="English") {

        ### ENGLISH

		if (toupper(language)=="ENGLISH") {
            if (is.null(date)) tmp.date <- Sys.time() else tmp.date <- as.Date(date)
            return(paste0(format(tmp.date, '%B'), " ", toOrdinal(as.numeric(format(tmp.date, '%d'))), ", ",  format(tmp.date, '%Y')))
        }

        ### OTHER LANGUAGES

} ### END toOrdinalDate_INTERNAL

### strTail
`strTail` <- 
function(
	string,
	n_char = 1) {

  # Ensure n_char is an integer and within valid bounds
  if (!is.numeric(n_char) || n_char != as.integer(n_char)) {
    stop("n_char must be an integer.")
  }

  # Apply the function to each element of the vector
  result <- sapply(string, function(str) {
    if (!is.character(str)) stop("Each element must be a character string.")

    string_len <- nchar(str)

    if (abs(n_char) > string_len && n_char > 0) n_char <- string_len
    if (abs(n_char) > string_len && n_char < 0) n_char <- -string_len

    if (n_char < 0) substr(str, -n_char + 1, string_len)
    else substr(str, max(1, string_len - n_char + 1), string_len)
  })

  names(result) <- NULL  # Remove names from the result
  return(result)
} ### END strTail

# Function to get Turkish word for number
get_turkish_number_word <- function(number) {
	turkish_number_words <- c(
		"1" = "bir", "2" = "iki", "3" = "\u00FC\u00E7", "4" = "d\u00F6rt", "5" = "be\u015F",
		"6" = "alt\u0131", "7" = "yedi", "8" = "sekiz", "9" = "dokuz", "10" = "on",
		"20" = "yirmi", "30" = "otuz", "40" = "k\u0131rk", "50" = "elli",
		"60" = "altm\u0131\u015F", "70" = "yetmi\u015F", "80" = "seksen", "90" = "doksan",
		"100" = "y\u00FCz", "200" = "iki y\u00FCz", "300" = "\u00FC\u00E7 y\u00FCz", "400" = "d\u00F6rt y\u00FCz",
		"500" = "be\u015F y\u00FCz", "600" = "alt\u0131 y\u00FCz", "700" = "yedi y\u00FCz",
		"800" = "sekiz y\u00FCz", "900" = "dokuz y\u00FCz"
	)
  
  if (number %in% as.numeric(names(turkish_number_words))) {
    return(turkish_number_words[as.character(number)])
  } else if (number < 1000) {
    hundreds <- as.character(floor(number / 100) * 100)
    remainder <- number %% 100
    if (remainder == 0) {
      return(turkish_number_words[hundreds])
    } else {
      return(paste(turkish_number_words[hundreds], get_turkish_number_word(remainder)))
    }
  } else {
    stop("Numbers above 999 are not currently supported.")
  }
} ### END get_turkish_number_word

# Turkish ordinal suffix logic
`turkish_ordinal_suffix` <- 
function(
	word) {

	vowels <- c("a", "\u0131", "o", "u", "e", "i", "\u00F6", "\u00FC")
    last_vowel <- tail(unlist(strsplit(word, ""))[unlist(strsplit(word, "")) %in% vowels], 1)

	if (last_vowel %in% c("a", "\u0131")) {
		suffix <- "\u0131nc\u0131"
	} else if (last_vowel %in% c("o", "u")) {
		suffix <- "uncu"
	} else if (last_vowel %in% c("e", "i")) {
		suffix <- "inci"
	} else if (last_vowel %in% c("\u00F6", "\u00FC")) {
		suffix <- "\u00FCnc\u00FC"
	}

    return(suffix)
  } ### END turkish_ordinal_suffix