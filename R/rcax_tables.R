#' Get the list of CAX tables with ids
#' 
#' @export
#' @param cols the columns to return. default is name, description and id. use cols=NULL to get all the columns
#' @param GETargs A list of arguments for the `rcax_GET()` call. These do not need to be specified by the user unless the user wants to change the default values. `table_id` This is the CAX table id. It is looked up using `tablename` and `rCAX:::caxpops` (an internal dataset). If `table_id` is passed in via `GETargs`, it wil override the default table id lookup. `recordloc` This is the name of the record we want in the list returned from the GET call. `key` is the API key.
#' @param ... Curl options passed to \code{\link[crul]{HttpClient}}
#' @template info
#' @examples
#' a <- rcax_tables(cols=NULL)
#' colnames(a)
#' 
#' head(a[,1:2])
#' 
rcax_tables <- function(cols = c("name", "id", "description"), GETargs = list(table_id = NULL, recordloc = "records", key = NULL, parse = TRUE), ...) {
  assert_is(cols, c('integer', 'character'))
  
  # api call; output is in $tables
  tab <- rcax_parse(rcax_GET("ca/tables", GETargs$key, ...), GETargs$parse)$tables
  if(!is.null(cols)) tab <- tab[, cols]
  tab
}