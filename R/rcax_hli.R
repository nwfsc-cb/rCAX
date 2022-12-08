#' Return HLI base tables
#' 
#' @export
#' @param hli The HLI short name
#' @template info
#' @template tableargs
#' @template basetablefuns
#' @seealso `rcax_hli_xport()`, `rcax_table_query()`, `rcax_filter()`
#' @examples 
#' # return popid of first record
#' # Note the part after $ is case sensitive
#' id <- rcax_hli("NOSA", qlist=list(limit=1))$popid
#' 
#' a <- rcax_hli("NOSA", flist=list(popid=id))
#' a <- a[, c("popid", "spawningyear", "nosaij", "nosaej")]
#' head(a)
#' 
#' # to print the first column names and definitions
#' head(rcax_hli("NOSA", type="colnames"))
#' 
rcax_hli <- function(
    hli = c("NOSA", "SAR", "PNI", "PreSmolt", "JuvOut", "RperS"),
    flist = NULL,
    qlist = NULL, 
    cols = NULL,
    sortcols = NULL,
    type = c("data.frame", "colnames"), 
    GETargs = list(table_id = NULL, recordloc = "records", key = NULL, parse = TRUE), ...) {
  hli <- match.arg(hli)
  type <- match.arg(type)
  # Error checking. Most happens in rcax_table_query.
  assert_is(flist, 'list')
  assert_is(qlist, 'list')
  
  tablename <- rcax_table_name(hli, type="base")
  if(is.null(sortcols)) sortcols <- rcax_table_sortcols(hli, type="base")
  if(is.null(cols)) cols <- rcax_table_cols(hli, type="base")
  
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
