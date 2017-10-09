`toOrdinalDate` <-
function(
    date=NULL,
	language="English") {


        ### ENGLISH

		if (toupper(language)=="ENGLISH") {
            if (is.null(date)) tmp.date <- Sys.time() else tmp.date <- as.Date(date)
            return(paste0(format(tmp.date, '%B'), " ", toOrdinal(as.numeric(format(tmp.date, '%d'))), ", ",  format(tmp.date, '%Y')))
        }

        ### OTHER LANGUAGES

} ### END toOrdinalDate
