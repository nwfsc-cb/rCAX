#' Return NOSA table
#' 
#' Returns NOSA table sorted by popid and spawningyear. The default
#' columns to return are "recoverydomain", "esu_dps", "commonpopname",
#'  "commonname", "run", "popid", "majorpopgroup", "spawningyear", "tsaij", "tsaej", 
#'  "nosaij", "nosaej"
#'    
#'  `rcax_nosa()` will download 1000 records from the NOSA table. You will 
#'  probably want to make a filtered query by passing in value to filter on 
#'  via `flist`. See `rcax_filter()`. Examples for the NOSA table:
#'  * `rcax_nosa(flist=list(popid=7)` return values for popid 7.
#'  * `rcax_nosa(flist=list(esu_dps="Salmon, Chinook (Snake River spring/summer-run ESU)")` return values for one ESU. Use `rCAX:::caxesu` to see a list of ESU_DPS names.
#' @details 
#' The NOSA table_id is "4EF09E86-2AA8-4C98-A983-A272C2C2C7E3" and 
#'  is set automatically using a saved data frame from a `rcax_tables()` call. The table is saved in `R/sysdata.rda`.
#'  
#' @export
#' @template info
#' @template tableargs
#' @seealso `rcax_nosa_xport()`, `rcax_table_query()`, `rcax_filter()`, `rcax_key()`
#' @examples 
#' a <- rcax_nosa(flist=list(popid=7))
#' a[, c("popid", "spawningyear", "nosaij", "nosaej")] |> head()
#' 
#' # to print the first 5 column names
#' rcax_nosa(type="colnames")[1:5]
#' 
rcax_nosa <- function(
    tablename = "NOSA",
    flist = NULL,
    qlist = NULL, 
    cols = c("recoverydomain", "esu_dps", "commonpopname", "commonname", "run", "popid", "majorpopgroup", "spawningyear", "tsaij", "tsaej", "nosaij", "nosaej"),
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
