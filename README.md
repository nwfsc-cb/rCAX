rCAX
========

`rCAX` is an R client for the [Coordinated Assessments API](https://www.streamnet.org/resources/exchange-tools/rest-api-documentation/). 

## Installation

Development version

```r
remotes::install_github("nwfsc-math-bio/rCAX")
```

## Using

First you need to get a pull api key from StreamNet. Then run `usethis::edit_r_environ()` to find or create your `.Renviron` file. Open that file and paste in `CAX_KEY = "whateveryourkeyis"`. Then restart R (Session > Restart R in RStudio).

There are just two functions at the moment `rcax_nosa()` and `rcax_tables()`. `rcax_nosa()` download a NOSA table. `rcax_tables()` downloads the tables names and ids.

```
a <- rcax_nosa()
```

## Contributing

Fork and put in a pull request.

First to-dos

* Figure out how to download the whole table.  `rcax_nosa()` is just getting a few lines.
* Edit `rcax_nosa()` so it returns something with a better format. Right now just a list.

## Meta

* Please [report any issues or bugs](https://github.com/nwfsc-math-bio/rCAX/issues).
* License: MIT
* Get citation information for `rCAX` in R doing `citation(package = 'rCAX')`
* Please note that this package is released with a [Contributor Code of Conduct](https://ropensci.org/code-of-conduct/). By contributing to this project, you agree to abide by its terms.

