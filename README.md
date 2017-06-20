toOrdinal
===========

[![Build Status](https://travis-ci.org/CenterForAssessment/toOrdinal.svg?branch=master)](https://travis-ci.org/CenterForAssessment/toOrdinal)
![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/centerforassessment/toOrdinal?branch=master&svg=true)](https://ci.appveyor.com/project/centerforassessment/toOrdinal)
[![Join the chat at https://gitter.im/CenterForAssessment/toOrdinal](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/CenterForAssessment/toOrdinal?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/toOrdinal)](http://cran.r-project.org/package=toOrdinal)
[![License](http://img.shields.io/badge/license-GPL%203-brightgreen.svg?style=flat)](https://github.com/CenterForAssessment/toOrdinal/blob/master/LICENSE.md)

Cardinal to ordinal number function
---------------------------------------

The function **toOrdinal** converts a cardinal number (e.g., 9) into its ordinal counterpart (e.g., 9th). Because such conversions are language specific, feel free to clone and make
a pull request with the specifications for other languages.

[![Build Status](https://travis-ci.org/CenterForAssessment/toOrdinal.svg?branch=master)](https://travis-ci.org/CenterForAssessment/toOrdinal) [![Join the chat at https://gitter.im/CenterForAssessment/toOrdinal](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/CenterForAssessment/toOrdinal?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/toOrdinal)](http://cran.r-project.org/package=toOrdinal)
[![License](http://img.shields.io/badge/license-GPL%203-brightgreen.svg?style=flat)](https://github.com/CenterForAssessment/toOrdinal/blob/master/LICENSE.md)


At present, the package implements English, French, German, Spanish, and Swedish. For example,

* English: toOrdinal(1) returns '1st'
* German: toOrdinal(1, language="German") returns '1te'
* French: toOrdinal(1, language="French") returns '1re'
* Spanish: toOrdinal(1, language="Spanish") returns '1.er'
* Swedish: toOrdinal(1, language="Swedish") returns '1:a'

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
