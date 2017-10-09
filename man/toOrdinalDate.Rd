\name{toOrdinalDate}
\alias{toOrdinalDate}
\title{Convert date to ordinal calendar date}
\description{Function for converting a calendar date to it long, ordinal version.
}
\usage{
toOrdinalDate(
	date=NULL,
	language="English")
}

\arguments{
  \item{date}{Either NULL (the default which uses the current date returned via \code{Sys.date()} or a character string of the form \code{YYYY-MM-DD}.
  }
  \item{language}{OPTIONAL. Language (defaults to English) indicating what language rules to use in conversion to ordinal number.
  }
}


\details{Typical use of the function is to call the function with any argument to get the current date in long, ordinal form. See examples.
}

\value{Function returns the character string with the long, ordinal calendar date.
}

\author{Damian W. Betebenner \email{dbetebenner@nciea.org} }

\examples{
toOrdinalDate()
toOrdinalDate("2017-10-9") ## October 9th, 2017
toOrdinalDate("2017-10-09") ## October 9th, 2017
}

\keyword{ misc }
\keyword{ models }
