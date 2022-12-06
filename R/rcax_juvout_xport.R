#' Return Juvenile Outmigration table from CAP Fish HLIs Tabular Query
#'  
#' @export
#' @template info
#' @template tableargs
#' @template xportfuns
#' @seealso `rcax_nosa_xport()`, `rcax_table_query()`, `rcax_filter()`, `rcax_key()`
#' @examples 
#' # return NMFS_PopID of first record
#' # Note the part after $ is case sensitive
#' id <- rcax_juvout_xport(qlist=list(limit=1))$nmfs_popid
#' 
#' a <- rcax_juvout_xport(
#'          flist=list(nmfs_popid=id),
#'          cols=c("nmfs_popid", "outmigrationyear", "totalnatural")
#'          )
#' head(a)
#' 
#' # First 3 columns
#' rcax_juvout_xport(qlist=list(limit=3))[,1:3]
#' 
#' # to print the first 5 column names
#' rcax_juvout_xport(type="colnames")[1:5]
#' 
#' # to print the first 5 column names as they appear
#' # in Excel files downloaded from https://www.streamnet.org/data/hli/
#' tab <- rcax_juvout_xport(qlist=list(limit=1))
#' colnames(tab)[1:5]
#' 
rcax_juvout_xport <- function(
    tablename = "XPortCA_JuvenileOutmigrants_01",
    flist = NULL,
    qlist = NULL, 
    cols = NULL,
    sortcols = c("outmigrationyear", "popid"),
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
  if(is.null(cols)) cols <- c(juvout_xport_colnames, "species", "publish", "agency", "hli_id")
  
  # API call and table filtering and sorting
  rcax_table_query(
    tablename = tablename, 
    flist = flist, qlist = qlist, 
    cols = cols, sortcols = sortcols,
    type = type, 
    GETargs = list(recordloc = "records"), ...)
  
}
