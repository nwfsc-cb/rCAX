#' @param flist A filter for the query. See details and `rcax_filter()`
#' @param qlist Additional query parameters. See `rcax_table_query()` for details.
#' @param cols column names to return. Use cols=NULL if you want all columns. Names are case insensitive.
#' @param sortcols The columns to sort on for the returned table. The order of sortcols indicates the order of sorting. Start with the smallest group and work outwards, e.g. `c("spawningyear", "popid", "MPG")`. Names are case insensitive.
#' @param type whether to return the table ("data.frame") or colnames with definitions ("colnames"). Default is to return the table as a data frame.
#' @param GETargs A list of arguments for the `rcax_GET()` call. These do not need to be specified by the user unless the user wants to change the default values. `table_id` This is the CAX table id. It is looked up using `tablename` and `rCAX:::caxpops` (an internal dataset). If `table_id` is passed in via `GETargs`, it will override the default table id lookup. `recordloc` This is the name of the record we want in the list returned from the GET call. `key` is the API key.
#' @return data frame if `type="data.frame"` (default) and the colnames if `type="colnames"`
#' @param ... Curl options passed to \code{\link[crul]{HttpClient}}

