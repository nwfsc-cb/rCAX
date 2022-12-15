#' Get EscData table
#' 
#' Returns EscData table sorted by refid and countdate. 
#'  
#'  The EscData table_id is set automatically using a saved data frame from a `rcax_datasets()` call. The table is saved in `R/sysdata.rda`.
#'  
#'  `rcax_escdata()` will download 1000 records. 
#'  
#' @export
#' @param tablename The name of the table in the CAX API. See \code{vignette("CAX_Tables", package = "rCAX")}
#' @template tableargs
#' @examples 
#' # First 5 columns of first 5 results
#' rcax_escdata(cols = NULL, qlist=list(limit=5))[,1:5]
#' 
#' # to print the first column names and definitions
#' head(rcax_escdata(type="colnames"))

rcax_escdata <- function(
    tablename = "EscData", 
    flist = NULL,
    qlist = NULL, 
    cols = NULL, 
    sortcols = c("countdate", "refid"),
    type = c("data.frame", "colnames"), 
    GETargs = list(table_id = NULL, recordloc = "records", key = NULL, parse = TRUE),  ...) {
  
  # API call and table filtering and sorting
  rcax_table_query(
    tablename = tablename, 
    flist = flist, qlist = qlist, 
    cols = cols, sortcols = sortcols,
    type = type, 
    GETargs = list(recordloc = "records"), ...)
  
  
}
