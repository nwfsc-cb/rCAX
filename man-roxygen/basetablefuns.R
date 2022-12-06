#' @description 
#' Returns the base HLI table which is missing the
#'  additional metadata (such as NMFS_PopID and update dates) found in the XPort tables.
#'  
#'  The query will download 1000 records by default; you can change
#' this by passing in `qlist=list(limit=1100)` for example. To make a
#' filtered query e.g. for one ESU or popid) pass in the `flist`
#' argument. Field names and values are case insensitive, e.g.
#' `POPID`, `popid` and `PopID` return the same result. 
#' If your filter value is not in the table, the returned table 
#' will be empty. Examples:
#'  * `flist=list(popid=7)` return values for popid 7.
#'  * `flist=list(esu_dps="Salmon, Chinook (Snake River spring/summer-run ESU)")` return values for one ESU. Use `rCAX:::caxesu` to see a list of ESU_DPS names.
#'  
#' @details 
#' The table_id is set automatically using a saved data frame from a `rcax_tables()` call. The table is saved in `R/sysdata.rda`.
#' 
#'  If you want to see only the column names use 
#'  `type="colnames`.
