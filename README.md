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

Read the [Basic functions vignette](https://nwfsc-math-bio.github.io/rCAX/articles/basics.html) to get started. There are two main functions `rcax_nosa()` and `rcax_tables()`. `rcax_nosa()` downloads a NOSA table. `rcax_tables()` downloads the CAX table names and ids.

To filter (subset) the query, you use a filter list and passed into the table functions as `flist`. Example, to retrieve only NOSA data for popid 7, use
```
library(rCAX)
fl <- list(popid=7)
a <- rcax_nosa(flist=fl)
```

## Contributing

Fork and put in a pull request.

## Reference

The core API functions in this package are modeled off [rredlist](https://github.com/ropensci/rredlist). The rest of the functions were written by EE Holmes.

<hr>

### Disclaimer

This repository is a scientific product and is not official communication of the National Oceanic and Atmospheric Administration, or the United States Department of Commerce. All NOAA GitHub project content is provided on an ‘as is’ basis and the user assumes responsibility for its use. Any claims against the Department of Commerce or Department of Commerce bureaus stemming from the use of this GitHub project will be governed by all applicable Federal law. Any reference to specific commercial products, processes, or services by service mark, trademark, manufacturer, or otherwise, does not constitute or imply their endorsement, recommendation or favoring by the Department of Commerce. The Department of Commerce seal and logo, or the seal and logo of a DOC bureau, shall not be used in any manner to imply endorsement of any commercial product or activity by DOC or the United States Government.

### License

This content was created by U.S. Government employees as part of their official duties. This content is not subject to copyright in the United States (17 U.S.C. §105) and is in the public domain within the United States of America. Additionally, copyright is waived worldwide through the CC0 1.0 Universal public domain dedication.




