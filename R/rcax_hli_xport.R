#' Return tables from CAP Fish HLIs Tabular Query
#'  
#' @export
#' @param hli The HLI short name
#' @template info
#' @template tableargs
#' @template xportfuns
#' @seealso `rcax_hli()`, `rcax_table_query()`, `rcax_filter()`
#' @examples 
#' # return NMFS_PopID of second record
#' # Note the part after $ is case sensitive
#' id <- rcax_hli_xport("NOSA", qlist=list(limit=2))$nmfs_popid[2]
#' 
#' a <- rcax_hli_xport("NOSA",
#'          flist=list(nmfs_popid=id),
#'          cols=c("nmfs_popid", "spawningyear", "tsaej", "nosaej")
#'          )
#' head(a)
#' 
#' # First 3 columns
#' rcax_hli_xport("NOSA", qlist=list(limit=3))[,1:3]
#' 
#' # to print the first column names and definitions
#' head(rcax_hli_xport("NOSA", type="colnames"))
#' 
rcax_hli_xport <- function(
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
  
  tablename <- rcax_table_name(hli, type="xport")
  if(is.null(sortcols)) sortcols <- rcax_table_sortcols(hli, type="xport")
  if(is.null(cols)) cols <- rcax_table_cols(hli, type="xport")
  
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
