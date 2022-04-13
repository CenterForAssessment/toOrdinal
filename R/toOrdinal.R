`toOrdinal` <-
function(
	cardinal_number,
	language="English",
	convert_to="ordinal_number") {

	return(sapply(cardinal_number, toOrdinal_INTERNAL, language, convert_to, USE.NAMES=FALSE))
} ### END toOrdinal
