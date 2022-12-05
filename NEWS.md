rCAX 0.4.0
===================

* added more sysdata: caxpops The Populations table. I had to download table from (StreamNet pop page)[https://www.streamnet.org/cap/current-hli/current-pop/] since the "Populations" table query is throwing an error), caxesus ESU_DPS names, caxsuperpops The SuperPopulations table.
* created `rcax_table_query()` as the base function for all the table query functions. That way I am not repeating the same code for each table.
* added info to `rcax_table_query()` documentation about the possible query params.
* added the `rcax_filter()` function to allow filtering the tables. Added examples in basics.Rmd.

rCAX 0.3.0
===================

* Add the tables vignette.
* Add CAX table dataframe to sysdata.rda

rCAX 0.2.0
===================

* Cleaned up `rcax_nosa()` and figured out that you can pass in popid as a query param. Subset the columns.
* Make `rcax_tables()` to get the table ids that we need for queries.

rCAX 0.1.0
===================

* Got the API get function working
