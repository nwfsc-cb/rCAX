#' Get SuperPopulations table
#' 
#' Returns SuperPopulations table
#'  
#'  The SuperPopulations table_id is "009A08FE-6479-44FC-9B6F-01C55E2C8BA3" and 
#'  is set automatically using a saved data frame from a `rcax_tables()` call. The table is saved in `R/sysdata.rda`.
#'  
#'  `rcax_superpops()` will download 1000 records. Pass in `flist` to filter.
#'  
#' @export
#' @template tableargs
#' @template info
#' @examples 
#' # to get all columns and print the column names
#' rcax_superpops(type="colnames")
#' 
#' # get one record
#' rcax_superpops(qlist=list(limit=1))
#' 
#' @seealso `rcax_table_query()`, `rcax_filter()`
#' 
rcax_superpops <- function(
    tablename = "SuperPopulations", 
    flist = NULL,
    qlist = NULL, 
    cols = NULL, 
    sortcols = c("popid"),
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
