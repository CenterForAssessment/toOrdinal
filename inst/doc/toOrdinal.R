## ----include = FALSE-----------------------------------------------------
library(toOrdinal)
knitr::opts_chunk$set(
    collapse = TRUE,
    comment = ">",
    fig.dpi = 96
			)

## ------------------------------------------------------------------------
toOrdinal(5)

## ------------------------------------------------------------------------
toOrdinal(5, language="German")
toOrdinal(5, language="French")
toOrdinal(5, language="Spanish")
toOrdinal(5, language="Swedish")

## ------------------------------------------------------------------------
sapply(1:10, toOrdinal)

