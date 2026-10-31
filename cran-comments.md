## Release summary

This is an update from 1.4-0.0 to 1.5-0.0. It fixes several defects in Spanish and Turkish ordinals and in `toOrdinalDate()`, makes `toOrdinal()` validate its input, removes the `pkgsearch` and `crayon` dependencies (the startup message now uses `cli`, is interactive-only, waits at most two seconds and can be switched off), moves documentation to roxygen2 and tests to testthat 3e, and requires R >= 4.1. Behaviour changes are listed in NEWS.md.

## Test environments

* local macOS (aarch64), R release: `R CMD check --as-cran`
* GitHub Actions: ubuntu-latest (release, oldrel-1, devel), macos-latest (release), windows-latest (release)
* win-builder (release, devel): to be run before submission

## R CMD check results

0 errors | 0 warnings | 0 notes

## Reverse dependencies

Checked the CRAN reverse dependencies Clustering, impactr, randomNames, smoothic and SGP against this version with `R CMD check`: no new problems.
