toOrdinal
===========

Cardinal to ordinal number function
---------------------------------------

The function **toOrdinal** is used to convert a cardinal number (e.g., 9) into its ordinal counterpart (e.g., 9th). Because such conversions are language specific, feel free to clone and make
a pull request with the additional specifications for other languages.[![Build Status](https://travis-ci.org/centerforassessment/toOrdinal.svg?branch=master)](https://travis-ci.org/centerforassessment/toOrdinal)


Currently the package implements English, French and German. For example,

* English: toOrdinal(1) returns '1st'
* German: toOrdinal(1, language="German") returns '1te'
* French: toOrdinal(1, language="French") returns '1er'

To install the latest stable release from [CRAN](http://cran.r-project.org/package=toOrdinal)
---------------------------

```R
install.packages("toOrdinal")
require(toOrdinal)
```


Install latest development release from [Github](https://github.com/CenterForAssessment/toOrdinal/) :octocat:
----------------------------------------------

```R
install.packages("devtools")
require(devtools)
install_github("CenterForAssessment/toOrdinal")
require(toOrdinal)
```

To install from Github you might need: Windows: Rtools (http://cran.r-project.org/bin/windows/Rtools/), OS X: xcode (from the app store),
Linux: apt-get install r-base-dev (or similar).
