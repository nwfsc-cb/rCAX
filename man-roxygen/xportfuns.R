#' @description 
#' Returns the HLI table with some additional metadata (such as NMFS_PopID and update dates). 
#' This is the table that one can download from the 
#' [CAP Fish HLIs Tabular Query](https://www.streamnet.org/data/hli/). The HLI is specified using its short code: 
#' 
#' * NOSA: Natural Origin Spawner Abundance
#' * SAR: Smolt to Adult Ratios
#' * PNI: Proportionate Natural Influence of supplementation hatcheries
#' * RperS: Recruits per Spawner
#' * JuvOut: Juvenile Outmigrants
#' * PreSmolt: Presmolt Abundance
#'  
#'  The query will download 1000 records by default; you can change
#' this by passing in `qlist=list(limit=1100)` for example. To make a
#' filtered query e.g. for one ESU or popid) pass in the `flist`
#' argument. Field names and values are case insensitive, e.g.
#' `POPID`, `popid` and `PopID` return the same result. 
#' If your filter value is not in the table, the returned table 
#' will be empty. Examples:
#'  * `flist=list(popid=7)` return values for popid 7.
#'  * `flist=list(nmfs_popid=6)` return values for NMFS_PopID 6.
#'  * `flist=list(esu_dps="Salmon, Chinook (Snake River spring/summer-run ESU)")` return values for one ESU. Use `rCAX:::caxesu` to see a list of ESU_DPS names.
#'  
#' @details 
#' The XPORT tables have a few columns that do not appear in the 
#' Excel files that 
#' one can download from StreamNet because they come from the 
#' html form for the HLI Tablular Query for filtering the data: 
#' "species", "publish", "num", "hli", "agency", "esudps", "hli_id".
#'  "esudps" is a slight variant on
#'  "esu_dps" and is removed. "num" is a sort flag and is removed. "hli_id"
#'  is an internal reference id and is removed.
#'  "publish" will always be Yes but is left in. The other columns are
#'   left in. The colnames are re-sorted into the order found in the
#'    downloaded
#'  Excel files with the extra columns added to the end. 
#'  
#'  If you want to see the original columns in the original order, 
#'  use `type="colnames` and use the name column of that output as
#'  the value for the `cols` argument.
