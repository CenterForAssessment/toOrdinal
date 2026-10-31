# toOrdinal 1.5-0.0

## Bug fixes

* `toOrdinalDate()` with no argument now returns today's date. It returned `list()`.
* `toOrdinalDate()` with a language other than English now stops with an error. It returned `NULL`.
* Month names no longer depend on the session locale; they are always English.
* Spanish ordinal numbers no longer carry a doubled period: `toOrdinal(5, "Spanish")` is `"5.º"`, not `"5..º"`.
* Spanish `11`, `111`, ... now give `"11.º"` (`undécimo` takes no apocope) rather than `"11.er"`.
* Numbers of 100000 and above are no longer written in scientific notation (`"100000th"`, not `"1e+05th"`).
* Turkish ordinal words are fixed for numbers above 20 (numbers such as `21` previously recursed without end), for `0`, for vowel-final stems (`yedinci`, `altıncı`) and for `dördüncü`.

## Changes

* `toOrdinal()` returns `NA` for missing input and stops with a clear message for non-numeric input, an unsupported language, or an unknown `convert_to`. Ordinal words for languages other than Turkish stop with an error instead of returning `NULL`.
* The startup banner appears only in interactive sessions, waits at most two seconds for each web request and can be switched off with `options(toOrdinal.startup_message = FALSE)` or `TOORDINAL_QUIET=true`. It no longer needs **pkgsearch**, and **cli** replaces **crayon**.
* Documentation is generated with roxygen2 and the tests use testthat 3rd edition, with coverage for every language.
* A new website built with Quarto at <https://centerforassessment.github.io/toOrdinal/>.
* Requires R 4.1 or later.

# toOrdinal 1.3-0.0

* Updated GitHub-pages website and documentation
* Fixed minor bugs in code

# toOrdinal 1.2-0.0

* Added support for Dutch (Thanks @huisman)

# toOrdinal 1.1-0.0

* Updated GitHub-pages website and documentation
* Fixed minor bugs in code
* Adding toOrdinalDate that converts a ####-##-## date to a pretty format like December 25th, 2018

# toOrdinal 1.0-0.0

* Building GitHub-pages website and documentation

# toOrdinal 0.0-8

* Building GitHub-pages website and documentation

# toOrdinal 0.0-7

* Adding GERMAN_ALT that adds a 'full-stop' to the end of each non-negative integer.
* Added '0te' to GERMAN to deal with GERMAN zero.

# toOrdinal 0.0-6

* Fixing testthat error message for Swedish.

# toOrdinal 0.0-5

* Minor fix so English works with 0.

# toOrdinal 0.0-4

* Some tweak to make CRAN worthy post R 3.2.1.

# toOrdinal 0.0-3

* Added support for Swedish (Thanks Jeff Erickson).

# toOrdinal 0.0-2

* Added messages indicating language support.
* Added functionality to convert to ordinal word.

# toOrdinal 0.0-1

* Package Released.
