rCAX 0.6.0
===================

* Added `rcax_pni_xport()`, `rcax_rpers_xport()`, `rcax_juvout_xport()`, `rcax_presmolt_xport()`, `rcax_presmolt()`, `rcax_pni()`, `rcax_sar()`, `rcax_rpers()`, `rcax_presmolt()`
* Added template roxygen for all xport and basetable functions. Now details and description elements are identical. 
* Dynamically find a nmfs_id or popid for the examples so that the examples never return an empty table.
* in `rcax_table_query()` set rownames to NULL in returned tables
* Added `ggplot2` to Suggests in DESCRIPTION file since I use it in some examples and will use in vignettes.
* removed {stringr} and `|>` dependency
* Added a check that all the flist names appear in the table. Requires an extra GET call but the call will fail otherwise if cols do not match.

rCAX 0.5.0
===================
https://github.com/nwfsc-math-mbio/rCAX/releases/tag/v0.5.0

* Added `rcax_termsofuse()` and a Terms of Use vignette. Add more links in Readme to StreamNet data use policies.
* Added `rcax_nosa_xport()` which is the data table available on https://www.streamnet.org/data/hli/ when one downloads a NOSA table
* Added `rcax_sar_xport()` which is the data table available on https://www.streamnet.org/data/hli/ when one downloads a SAR table
* Made `rcax_table_query()` more robust if the cols passed in do not match what is in the table. It will print a warning and only show cols that do appear. Also I added `tolower(cols)` and `tolower(sortcols)` so that these are case insensitive.
* Added `nosa_xport_colnames` to `sysdata.rda`. This is somewhat fragile since SteamNet might change the column names. The code to create the system data is in `inst/docs`.

rCAX 0.4.0
===================
https://github.com/nwfsc-math-mbio/rCAX/releases/tag/v0.4.0

* added more sysdata: caxpops The Populations table. I had to download table from (StreamNet pop page)[https://www.streamnet.org/cap/current-hli/current-pop/] since the "Populations" table query is throwing an error). Also added caxesus: ESU_DPS names and caxsuperpops: The SuperPopulations table.
* created `rcax_table_query()` as the base function for all the table query functions. That way I am not repeating the same code for each table.
* added info to `rcax_table_query()` documentation about the possible query params.
* added the `rcax_filter()` function to allow filtering the tables. Added examples in basics.Rmd.

rCAX 0.3.0
===================

* Add the tables vignette.
* Add CAX table dataframe to sysdata.rda

rCAX 0.2.0
===================
https://github.com/nwfsc-math-mbio/rCAX/releases/tag/v0.2.0

* Cleaned up `rcax_nosa()` and figured out that you can pass in popid as a query param. Subset the columns.
* Make `rcax_tables()` to get the table ids that we need for queries.

rCAX 0.1.0
===================
https://github.com/nwfsc-math-mbio/rCAX/releases/tag/v0.1.0

* Got the API get function working
