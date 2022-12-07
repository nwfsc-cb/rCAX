#' Return RperS base table
#'  
#' @export
#' @template info
#' @template tableargs
#' @template basetablefuns
#' @seealso `rcax_rpers_xport()`, `rcax_table_query()`, `rcax_filter()`, `rcax_key()`
#' @examples 
#' # return popid of first record
#' # Note the part after $ is case sensitive
#' id <- rcax_rpers(qlist=list(limit=1))$popid
#' 
#' a <- rcax_rpers(
#'          flist=list(popid=id),
#'          cols=c("popid", "broodyear", "rpers")
#'          )
#' head(a)
#' 
#' # First 3 columns
#' rcax_rpers(qlist=list(limit=3))[,1:3]
#' 
#' # to print the first 5 column names
#' rcax_rpers(type="colnames")[1:5]
#' 
#' # to print the first 5 column names as they appear
#' # in Excel files downloaded from https://www.streamnet.org/data/hli/
#' tab <- rcax_rpers(qlist=list(limit=1))
#' colnames(tab)[1:5]
#' 
rcax_rpers <- function(
    tablename = "RperS",
    flist = NULL,
    qlist = NULL, 
    cols = NULL,
    sortcols = c("broodyear", "popid"),
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
