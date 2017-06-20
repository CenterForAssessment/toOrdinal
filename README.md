toOrdinal
===========

[![Build Status](https://travis-ci.org/CenterForAssessment/toOrdinal.svg?branch=master)](https://travis-ci.org/CenterForAssessment/toOrdinal)
![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/centerforassessment/toOrdinal?branch=master&svg=true)](https://ci.appveyor.com/project/centerforassessment/toOrdinal)
[![Join the chat at https://gitter.im/CenterForAssessment/toOrdinal](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/CenterForAssessment/toOrdinal?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/toOrdinal)](http://cran.r-project.org/package=toOrdinal)
[![License](http://img.shields.io/badge/license-GPL%203-brightgreen.svg?style=flat)](https://github.com/CenterForAssessment/toOrdinal/blob/master/LICENSE.md)


# Overview

The function **toOrdinal** converts a cardinal number (e.g., 9) into its ordinal counterpart (e.g., 9th). Because such conversions are language specific,
the conversions are specific to a supported language. At present, the package implements English, French, German, Spanish, and Swedish. For example,

* English: toOrdinal(1) returns '1st'
* German: toOrdinal(1, language="German") returns '1te'
* French: toOrdinal(1, language="French") returns '1re'
* Spanish: toOrdinal(1, language="Spanish") returns '1.er'
* Swedish: toOrdinal(1, language="Swedish") returns '1:a'


# Installation

## From [CRAN](https://CRAN.R-project.org/package=toOrdinal)

To install the latest stable release of **toOrdinal** from [CRAN](https://CRAN.R-project.org/package=toOrdinal)

```R
install.packages("toOrdinal")
```

## From [Github](https://github.com/CenterForAssessment/toOrdinal/)

To install the development release of **toOrdinal** from [GitHub](https://github.com/CenterForAssessment/toOrdinal/):

```R
devtools::install_github("CenterForAssessment/toOrdinal")
```


# Usage

```
> toOrdinal(5)
[1] "5th"

> toOrdinal(5, language="German")
[1] "5te"

> toOrdinal(5, language="French")
[1] "5e"

> toOrdinal(5, language="Spanish")
[1] "5.º"

> toOrdinal(5, language="Swedish")
1] "5:e"
```


# Resources

* [toOrdinal GitHub Pages](https://CenterForAssessment.github.io/toOrdinal)
* [CRAN Repo](https://CRAN.R-project.org/package=toOrdinal)


# Contributors

The **randomNames** Package is crafted with :heart: by:

* [Damian Betebenner](https://github.com/dbetebenner)

I love feedback and am happy to answer questions. Feel free to clone and make a pull request with the specifications for other languages.
