rCAX 1.0.3
===================

* updated urls to nwfsc-cb from nwfsc-math-bio when Math Bio GitHub was merged into the CB org.
* updated the license to GPL-3

rCAX 1.0.2
===================

* Added info on accessing an API key saved in a `.Renviron` file in the `api-get.Rmd` vignette.
* Added CC0 License file to repo

rCAX 1.0.1
===================

* First production release.
* Updated CITATION with DOI; updated DESCRIPTION with better title

rCAX 0.10.0
===================

* merged `rcax_hli()` and `rcax_hli_xport()`
* a message terms of use is not written when the package is loaded
* documentation: cleaned up `basics.Rmd`, only have API reference for the base API functions, edited the Readme. Added `cax.Rmd` with more details on the CAX database.
* renamed `rcax_tables()` to `rcax_datasets()` to match pycax package
* Added "About CAX" vignette `cax.Rmd`
* Some clean-up related to spelling check

rCAX 0.9.0
===================
https://github.com/nwfsc-cb/rCAX/releases/tag/v0.9.0

* Removed API key info as rCAX now includes an internal read-only key
* Add plot to `basics.Rmd`
* Allow cols and sortcols in `rcax_table_query()` to be numbers, although the results might be non-intuitive for `rcax_hli_xport()` since the number will refer to the column order in the table before the columns are sorted into the order found in the downloaded Excel files.

rCAX 0.8.0
===================
https://github.com/nwfsc-cb/rCAX/releases/tag/v0.8.0

* Condensed all the `_xport` functions into one function `rcax_hli_xport()` with argument `hli` to specify which HLI.
* Condensed all the individual HLI functions into one function `rcax_hli()` with argument `hli` to specify which HLI.
* Cleaned up the API vignette as it was out of date. Updated `basics.Rmd` given the changes to the functions.
* Added `rcax_table_name()` to look up the table based on XPort versus base and for a HLI short code.
* Added `rcax_table_cols()` and `rcax_table_sortcols()` to return these based on XPort versus base and for a HLI short code.
* Added 'hli' and 'hli_id' to the `cax_column_definitions` internal data.
* Added CITATION

rCAX 0.7.0
===================
https://github.com/nwfsc-cb/rCAX/releases/tag/v0.7.0

* Added a setup vignette for how to download and install the package.
* Removed `rcax_key()`. Not needed. Cleaned up some {rredlist} refs.
* Added `rcax_version()` to print the installed versus GitHub version.
* Added `cax_column_definitions` from the definitions tab in the Excel files output by the HLI Tabular Query.
* `type="colnames"` now returns a data frame with a name and definition column.
* Added documentation for the internal data.
* Added RCMD check badge and workflow, did some minor cleanup to pass check.

rCAX 0.6.0
===================
https://github.com/nwfsc-cb/rCAX/releases/tag/v0.6.0

* Added `rcax_pni_xport()`, `rcax_rpers_xport()`, `rcax_juvout_xport()`, `rcax_presmolt_xport()`, `rcax_presmolt()`, `rcax_pni()`, `rcax_sar()`, `rcax_rpers()`, `rcax_presmolt()`
* Added template roxygen for all XPort and base table functions. Now details and description elements are identical. 
* Dynamically find a NMFS PopID or PopID for the examples so that the examples never return an empty table.
* in `rcax_table_query()` set rownames to NULL in returned tables
* Added `ggplot2` to Suggests in DESCRIPTION file since I use it in some examples and will use in vignettes.
* removed {stringr} and `|>` dependency
* Added a check that all the `flist` names appear in the table. Requires an extra GET call but the call will fail otherwise if cols do not match.

rCAX 0.5.0
===================
https://github.com/nwfsc-math-mbio/rCAX/releases/tag/v0.5.0

* Added `rcax_termsofuse()` and a Terms of Use vignette. Add more links in Readme to StreamNet data use policies.
* Added `rcax_nosa_xport()` which is the data table available on https://www.streamnet.org/data/hli/ when one downloads a NOSA table
* Added `rcax_sar_xport()` which is the data table available on https://www.streamnet.org/data/hli/ when one downloads a SAR table
* Made `rcax_table_query()` more robust if the cols passed in do not match what is in the table. It will print a warning and only show cols that do appear. Also I added `tolower(cols)` and `tolower(sortcols)` so that these are case insensitive.
* Added `nosa_xport_colnames` to `sysdata.rda`. This is somewhat fragile since StreamNet might change the column names. The code to create the system data is in `inst/docs`.

rCAX 0.4.0
===================
https://github.com/nwfsc-math-mbio/rCAX/releases/tag/v0.4.0

* added more sysdata: `caxpops` The Populations table. I had to download table from [StreamNet](https://www.streamnet.org/cap/current-hli/current-pop/) since the "Populations" table query is throwing an error). Also added `caxesu`: ESU_DPS names and `caxsuperpops`: The SuperPopulations table.
* created `rcax_table_query()` as the base function for all the table query functions. That way I am not repeating the same code for each table.
* added info to `rcax_table_query()` documentation about the possible query parameters.
* added the `rcax_filter()` function to allow filtering the tables. Added examples in `basics.Rmd`.

rCAX 0.3.0
===================

* Add the tables vignette.
* Add CAX table dataframe to `sysdata.rda`

rCAX 0.2.0
===================
https://github.com/nwfsc-math-mbio/rCAX/releases/tag/v0.2.0

* Cleaned up `rcax_nosa()` and figured out that you can pass in popid as a query parameter. Subset the columns.
* Make `rcax_tables()` to get the table ids that we need for queries.

rCAX 0.1.0
===================
https://github.com/nwfsc-math-mbio/rCAX/releases/tag/v0.1.0

* Got the API get function working
