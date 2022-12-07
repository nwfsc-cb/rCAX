#' Return NOSA base table
#' 
#'  
#' @export
#' @template info
#' @template tableargs
#' @template basetablefuns
#' @seealso `rcax_nosa_xport()`, `rcax_table_query()`, `rcax_filter()`
#' @examples 
#' # return popid of first record
#' # Note the part after $ is case sensitive
#' id <- rcax_nosa(qlist=list(limit=1))$popid
#' 
#' a <- rcax_nosa(flist=list(popid=id))
#' a <- a[, c("popid", "spawningyear", "nosaij", "nosaej")]
#' head(a)
#' 
#' # to print the first 5 column names
#' rcax_nosa(type="colnames")[1:5]
#' 
rcax_nosa <- function(
    tablename = "NOSA",
    flist = NULL,
    qlist = NULL, 
    cols = NULL,
    sortcols = c("spawningyear", "popid"),
    type = c("data.frame", "colnames"), 
    GETargs = list(table_id = NULL, recordloc = "records", key = NULL, parse = TRUE), ...) {
  # Error checking. Most happens in rcax_table_query.
  assert_is(flist, 'list')
  assert_is(qlist, 'list')
  
  if(("popid" %in% names(flist)) & ("popid" %in% names(qlist))){
     cat("popid appears in both flist and qlist. Ignoring the value in qlist.\n")
    qlist$popid <- NULL
  }

  # API call and table filtering and sorting
  rcax_table_query(
    tablename = tablename, 
    flist = flist, qlist = qlist, 
    cols = cols, sortcols = sortcols,
    type = type, 
    GETargs = list(recordloc = "records"), ...)
  
}
