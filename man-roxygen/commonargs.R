#' @param tablename (character) The CAX name for the table; ignored if `GETargs$table_id` passed in. 
#' @param popid (character or number) A NMFS_POPID for a population
#' @param cols column names to return. Use cols=NULL if you want all columns
#' @param sortcols The columns to sort on for the returned table. The order of sortcols indicates the order of sorting. Start with the smallest group and work outwards, e.g. `c("spawningyear", "popid", "MPG")`
#' @param type whether to return the table ("data.frame") or colnames ("colnames"). Default is to return the table as a data frame.
#' @param extra extra query params or column values. Enter as a list, e.g. list(pageno=7)
#' @param GETargs A list of arguments for the GET call. These are set automatically and do not normally need to be specified by the user. `table_id` This is the CAX table id returned from `rcax_table()`. It is looked up using `tablename`. `recordloc` This is the name of the record we want in the list returned from the GET call. `key` the API key. Normally stored in `.Renviron` by can be passed in. `parse` must be TRUE.
