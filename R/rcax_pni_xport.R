#' Return PNI table from CAP Fish HLIs Tabular Query
#'    
#' @export
#' @template info
#' @template tableargs
#' @template xportfuns
#' @seealso `rcax_nosa_xport()`, `rcax_table_query()`, `rcax_filter()`, `rcax_key()`
#' @examples 
#' # return NMFS_PopID of first record
#' # Note the part after $ is case sensitive
#' id <- rcax_pni_xport(qlist=list(limit=1))$nmfs_popid
#' 
#' # Return the table for this id
#' a <- rcax_pni_xport(
#'          flist=list(nmfs_popid=id),
#'          cols=c("nmfs_popid", "spawningyear", "pniej")
#'          )
#' head(a)
#' 
#' # First 3 columns
#' rcax_pni_xport(qlist=list(limit=3))[,1:3]
#' 
#' # to print the first 5 column names
#' rcax_pni_xport(type="colnames")[1:5]
#' 
#' # to print the first 5 column names as they appear
#' # in Excel files downloaded from https://www.streamnet.org/data/hli/
#' tab <- rcax_pni_xport(qlist=list(limit=1))
#' colnames(tab)[1:5]
#' 
rcax_pni_xport <- function(
    tablename = "XPortCA_PNI_01",
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

  # If cols=NULL (return all cols), then sort them in the order that
  # the downloaded Excel files have in https://www.streamnet.org/data/hli
  if(is.null(cols)) cols <- c(pni_xport_colnames, "species", "publish", "agency", "hli_id")
  
  # API call and table filtering and sorting
  rcax_table_query(
    tablename = tablename, 
    flist = flist, qlist = qlist, 
    cols = cols, sortcols = sortcols,
    type = type, 
    GETargs = list(recordloc = "records"), ...)
  
}
