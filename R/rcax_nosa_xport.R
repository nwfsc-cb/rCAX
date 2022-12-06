#' Return NOSA table from CAP Fish HLIs Tabular Query
#' 
#' Returns NOSA with some additional metadata (such as NMFS_PopID and
#'  update dates). This is the table that one can download from the 
#'  [CAP Fish HLIs Tabular Query](https://www.streamnet.org/data/hli/).
#'    
#'  `rcax_nosa_xport()` will download 1000 records. You will 
#'  want to make a filtered query by passing in values to filter on 
#'  via `flist`. Keep in mind that the field names
#'  and values are case insensitive. Using `POPID`, `popid` and `PopID`
#'  will have the same effect. Examples:
#'  * `rcax_nosa_xport(flist=list(popid=7)` return values for popid 7.
#'  * `rcax_nosa_xport(flist=list(nmfs_popid=6)` return values for NMFS_PopID 6.
#'  * `rcax_nosa_xport(flist=list(esu_dps="Salmon, Chinook (Snake River spring/summer-run ESU)")` return values for one ESU. Use `rCAX:::caxesu` to see a list of ESU_DPS names.
#'  
#' @details 
#' The table_id is set automatically using a saved data frame from a `rcax_tables()` call. The table is saved in `R/sysdata.rda`.
#' 
#' The table has a few columns that do not appear in the Excel files that 
#' one can download from StreamNet: "species", "publish", "num", 
#' "hli", "agency", "esudps", "hli_id". "esudps" is a slight variant on
#'  "esu_dps" and is removed. "num" is a sort flag and is removed.
#'  "publish" will always be Yes but is left in. The other columns are left in. The colnames are resorted into the order found in the downloaded
#'  Excel files with the extra column added to the end.
#'  
#' @export
#' @template info
#' @template tableargs
#' @seealso `rcax_nosa()`, `rcax_table_query()`, `rcax_filter()`, `rcax_key()`
#' @examples 
#' a <- rcax_nosa_xport(
#'          flist=list(nmfs_popid=7),
#'          cols=c("nmfs_popid", "spawningyear", "tsaej", "nosaej")
#'          )
#' head(a)
#' 
#' # First 3 columns
#' rcax_nosa_xport(qlist=list(limit=3))[,1:3]
#' 
#' # to print the first 5 column names
#' rcax_nosa_xport(type="colnames")[1:5]
#' 
#' # to print the first 5 column names as they appear
#' # in Excel files downloaded from https://www.streamnet.org/data/hli/
#' tab <- rcax_nosa_xport(qlist=list(limit=1))
#' colnames(tab)[1:5]
#' 
rcax_nosa_xport <- function(
    tablename = "XPortCA_NOSA_01",
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
  if(is.null(cols)) cols <- c(nosa_xport_colnames, "species", "publish", "agency", "hli_id")
  
  # API call and table filtering and sorting
  rcax_table_query(
    tablename = tablename, 
    flist = flist, qlist = qlist, 
    cols = cols, sortcols = sortcols,
    type = type, 
    GETargs = list(recordloc = "records"), ...)
  
}
