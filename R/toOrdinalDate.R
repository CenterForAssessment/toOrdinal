`toOrdinalDate` <-
function(
    date=NULL,
	language="English") {

	return(sapply(date, toOrdinalDate_INTERNAL, language, USE.NAMES=FALSE))

} ### END toOrdinalDate
