#' Get nosa table for a popid
#' 
#' Returns nosa table sorted by popid and spawningyear. The default
#' columns to return are "recoverydomain", "esu_dps", "commonpopname",
#'  "commonname", "run", "popid", "majorpopgroup", "spawningyear", 
#'  "nosaij", "nosaej"
#'    
#'  `rcax_nosa()` will download 1000 records from the NOSA table. You will 
#'  probably want to make a filtered query by passing in value to filter on 
#'  via `flist`. See `rcax_filter()`. Examples for the NOSA table:
#'  * `rcax_nosa(flist=list(popid=7)` return values for popid 7.
#'  * `rcax_nosa(flist=list(esu_dps="Salmon, coho (Oregon Coast ESU)")` return values for one ESU See `caxpops$esu_dps` for ESU_DPS names.
#' @details 
#' The NOSA table_id is "4EF09E86-2AA8-4C98-A983-A272C2C2C7E3" and 
#'  is set automatically using a saved data frame from a `rcax_tables()` call. The table is saved in `R/sysdata.rda`.
#'  
#' @export
#' @template info
#' @template tableargs
#' @seealso `rcax_table_query()`, `rcax_filter()`, `rcax_key()`
#' @examples 
#' a <- rcax_nosa(qlist=list(popid=7))
#' a[, c("popid", "spawningyear", "nosaij", "nosaej")] |> head()
#' 
#' rcax_nosa() |> head()
#' 
#' # to print the first 5 column names
#' rcax_nosa(type="colnames")[1:5]
#' 
#' @references 
#' This function is modeled off the functions in \url{https://github.com/ropensci/rredlist}
#' 
rcax_nosa <- function(
    tablename = "NOSA",
    flist = NULL,
    qlist = NULL, 
    cols = c("recoverydomain", "esu_dps", "commonpopname", "commonname", "run", "popid", "majorpopgroup", "spawningyear", "nosaij", "nosaej"),
    sortcols = c("spawningyear", "popid"),
    type = c("data.frame", "colnames"), 
    GETargs = list(table_id = NULL, recordloc = "records", key = NULL, parse = TRUE), ...) {
  # Error checking. Most happens in rcax_table_query.
  assert_is(flist, 'list')
  assert_is(qlist, 'list')
  
  # If user passed in popid in flist, move this to extra so appears as a query param
  # Seems to work as a query param
  if(("popid" %in% names(flist)) & ("popid" %in% names(qlist)))
     cat("popid appears in both flist and qlist. Ignoring the value in qlist.\n")
  if("popid" %in% names(flist)){
    if(is.null(qlist)) qlist <- list(popid = flist$popid)
      else qlist$popid <- flist$popid
  }
  
  # API call and table filtering and sorting
  rcax_table_query(
    tablename = tablename, 
    flist = flist, qlist = qlist, 
    cols = cols, sortcols = sortcols,
    type = type, 
    GETargs = list(recordloc = "records"), ...)
  
}
