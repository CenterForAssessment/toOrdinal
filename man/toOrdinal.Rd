\name{toOrdinal}
\alias{toOrdinal}
\title{Random Names Function}
\description{
Function to generate random gender and ethnicity correct first and/or last names. Names are chosen proportionally based upon their probability of appearing in a large scale data base of real names.
Function to generate random gender and ethnicity correct first and/or/last names. The function probabilistically samples from the embedded toOrdinalData dataset to provide a realistic list of 
first and/or last names. 
}
\usage{
toOrdinal(                                                  
	cardinal_number,                                          
	language="English")                                 
}

\arguments{
  \item{n}{Postive integer (cardinal number) to be converted to an ordinal number. For example 1 becomes 1st, 2 becomes 2nd, ...
  }
  \item{language}{OPTIONAL. Language (defaults to English) indicating what language rules to use in conversion to ordinal number.
  } 
} 


\details{Typical use of the function is to submit an integer for conversion to an ordinal number in the language specified.
}

\value{Function returns a character vector containing the ordinal number. 
}

\author{Damian W. Betebenner \email{dbetebenner@nciea.org} }

\examples{
toOrdinal(1)  ## Returns a single character vector with ordinal number, default is in English
toOrdinal(1, language="French")

\keyword{ misc }
\keyword{ models }
