#' Get nosa table for a popid
#' 
#' Returns nosa table sorted by popid and spawningyear. The default
#' columns to return are "recoverydomain", "esu_dps", "commonpopname",
#'  "commonname", "run", "popid", "majorpopgroup", "spawningyear", 
#'  "nosaij", "nosaej"
#'  
#'  The NOSA table_id is "4EF09E86-2AA8-4C98-A983-A272C2C2C7E3"
#'  
#'  `rcax_nosa()` will download 1000 records from the NOSA table. You will 
#'  probably want to make a filtered query by passing in value for a specific popid, e.g. `rcax_nosa(popid=7)`
#'  
#' @export
#' @param table_id table id eg 4EF09E86-2AA8-4C98-A983-A272C2C2C7E3
#' @param popid a popid number
#' @param extra extra query params or column values. Enter as a list, e.g. list(pageno=7)
#' @param cols column names to return. Use cols=NULL if you want all columns
#' @template all
#' @template info
#' @examples 
#' a <- rcax_nosa(popid=7)
#' a[, c("popid", "spawningyear", "nosaij", "nosaej")]
#' 
#' a <- rcax_nosa()
#' head(a)
#' 
#' # to get all columns and print the column names
#' # a <- rcax_nosa(cols = NULL)
#' # colnames(a)
#' 
#' @references 
#' This function is modeled off the functions in \url{https://github.com/ropensci/rredlist}
#' 
rcax_nosa <- function(
    table_id = "4EF09E86-2AA8-4C98-A983-A272C2C2C7E3", 
    popid = NULL,
    extra = NULL, key = NULL, parse = TRUE, 
    cols = c("recoverydomain", "esu_dps", "commonpopname", "commonname", "run", "popid", "majorpopgroup", "spawningyear", "nosaij", "nosaej"), ...) {
  # error checking
  assert_is(table_id, 'character')
  assert_is(extra, 'list')
  assert_is(parse, 'logical')
  
  # set up query list
  query_list <- list(table_id = table_id)
  if(!is.null(popid)) query_list$popid <- popid
  if(!is.null(extra)) query_list <- c(query_list, extra)
  
  # Make API call; for NOSA data is in records
  tab <- rcax_parse(rcax_GET("ca", key, query=query_list, ...), parse)
  tab <- tab$records
  
  # filter and sort
  if("spawningyear" %in% colnames(tab)) tab <- tab[order(tab$spawningyear),]
  if("popid" %in% colnames(tab)) tab <- tab[order(tab$popid),]
  if(!is.null(cols)) tab <- tab[,cols]
  tab
}

# Not used; this would return just the json
rcax_nosa_ <- function(table_id, extra = NULL, key = NULL, ...) {
  assert_is(table_id, 'character')
  assert_is(key, 'character')
  rcax_GET("ca", key, query=c(list(table_id=table_id), extra), ...)
}
