#' Get EscData table
#' 
#' Returns EscData table sorted by refid and countdate. 
#'  
#'  The EscData table_id is "F11B5228-F716-487B-807D-0DD04B96EEB8" and 
#'  is set automatically using a saved data frame from a `rcax_tables()` call. The table is saved in `R/sysdata.rda`.
#'  
#'  `rcax_escdata()` will download 1000 records. 
#'  
#' @export
#' @template tableargs
#' @template info
#' @examples 
#' # First 5 columns of first 5 results
#' rcax_escdata(cols = NULL, qlist=list(limit=5))[,1:5]
#' 
#' # to print the first 5 column names
#' rcax_escdata(type="colnames")[1:5]

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
