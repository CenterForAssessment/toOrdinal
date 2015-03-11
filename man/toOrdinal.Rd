\name{toOrdinal}
\alias{toOrdinal}
\title{Cardinal to ordinal number conversion function}
\description{Function for converting cardinal to ordinal numbers by adding a language specific ordinal indicator (http://en.wikipedia.org/wiki/Ordinal_indicator) to the number.
}
\usage{
toOrdinal(                                                  
	cardinal_number,                                          
	language="English")                                 
}

\arguments{
  \item{cardinal_number}{Postive integer (cardinal number) to be converted to an ordinal number. For example 1 becomes 1st, 2 becomes 2nd, ...
  }
  \item{language}{OPTIONAL. Language (defaults to English) indicating what language rules to use in conversion to ordinal number.
  } 
} 


\details{Typical use of the function is to submit a positive integer for conversion to an ordinal number in the language specified. See examples.
}

\value{Function returns the ordinal number (as a character string). 
}

\author{Damian W. Betebenner \email{dbetebenner@nciea.org} }

\examples{
toOrdinal(1)  ## 1st
toOrdinal(1, language="French") ## 1re

sapply(1:20, toOrdinal) ## 1st, 2nd, 3rd, ...
sapply(1:20, toOrdinal, language="French") ## 1re, 2e, 3e, ...
}

\keyword{ misc }
\keyword{ models }
