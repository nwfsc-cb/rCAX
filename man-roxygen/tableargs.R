#' @param tablename (character) The CAX name for the table; ignored if `GETargs$table_id` passed in. 
#' @param flist A filter for the query. See details and `rcax_filter()`
#' @param qlist Additional query params. See `rcax_table_query()` for details.
#' @param cols column names to return. Use cols=NULL if you want all columns
#' @param sortcols The columns to sort on for the returned table. The order of sortcols indicates the order of sorting. Start with the smallest group and work outwards, e.g. `c("spawningyear", "popid", "MPG")`
#' @param type whether to return the table ("data.frame") or colnames with definitions ("colnames"). Default is to return the table as a data frame.
#' @param GETargs A list of arguments for the `rcax_GET()` call. These do not normally need to be specified by the user. `table_id` This is the CAX table id. It is looked up using `tablename` and `rCAX:::caxpops` (an internal dataset). `recordloc` This is the name of the record we want in the list returned from the GET call. `key` is the API key. See \code{vignette("setup", package = "rCAX")} for API key details.
#' @return data frame if `type="data.frame"` (default) and the colnames if `type="colnames"`
