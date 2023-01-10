#' Internal data used by functions
#'
#' rCAX has a number of internally stored data (in `sysdata.rda`) that are 
#' used by the functions. If the user wants to use these, preface the name 
#' with `rCAX:::`. For example, `rCAX:::caxesu` shows the list of ESU/DPS names.
#' 
#' Internal data
#' * `caxsuperpops`: the SuperPopulations table
#' * `caxtabs`: the API table names and their table_ids. Used to look up table_id
#' * `caxpops`: the Populations table
#' * `caxesu`: the list of ESU/DPS names. Useful for filtering.
#' * `nosa_xport_colnames`, `sar_xport_colnames`, `pni_xport_colnames`, `rpers_xport_colnames`, `presmolt_xport_colnames`, `juvout_xport_colnames`: the column names that appear in the HLI Tabular Query output so that rCAX `_xport` functions produce the same columns in the same order.
#' * `cax_column_definitions`: a data frame with column name and definitions. Produced from the HLI Tabular Query Excel files
#' @docType data
#' @keywords datasets
#' @name internal_data
#' @examples
#' rCAX:::caxesu
NULL

#' ESU/DPS names
#' 
#' An internal dataset of the ESU/DPS names. Useful for filtering.
#'
#' @docType data
#' @keywords datasets
#' @name caxesu
#' @examples
#' rCAX:::caxesu
NULL

#' CAX API table names and table_id
#' 
#' An internal dataset output from a call to "ca/tables" per [REST API documentation](https://www.streamnet.org/resources/exchange-tools/rest-api-documentation/). It is a data frame with a number of columns. The name and id columns are the ones used internally.
#'
#' @docType data
#' @keywords datasets
#' @name caxtabs
#' @examples
#' tab <- rCAX:::caxtabs
#' head(tab[,c("name", "id")])
NULL

#' Column names and definitions
#' 
#' An internal dataset with column name and definitions. Produced from the 
#' [CAX HLI Tabular Query](https://www.streamnet.org/data/hli) Excel file definition tabs. It is a data frame with name and definition.
#'
#' @docType data
#' @keywords datasets
#' @name cax_column_definitions
#' @examples
#' head(rCAX:::cax_column_definitions)
NULL
