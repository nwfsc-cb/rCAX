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
#' @template all
#' @template commonargs
#' @template info
#' @examples 
#' # to get all columns and print the column names
#' # a <- rcax_escdata(cols = NULL)
#' # colnames(a)
#' 
#' @references 
#' This function is modeled off the functions in \url{https://github.com/ropensci/rredlist}
#' 
rcax_escdata <- function(
    extra = NULL, 
    table_id = NULL,
    key = NULL, parse = TRUE, 
    cols = NULL, ...) {
  # error checking
  assert_is(table_id, 'character')
  assert_is(extra, 'list')
  assert_is(parse, 'logical')
  
  # get the table_id for the table
  if(is.null(table_id)) table_id = subset(rCAX:::caxtabs, name=="EscData")$id
  
  # set up query list
  query_list <- list(table_id = table_id)
  if(!is.null(extra)) query_list <- c(query_list, extra)
  
  # Make API call
  tab <- rcax_parse(rcax_GET("ca", key, query=query_list, ...), parse)
  tab <- tab$records
  
  # filter and sort
  if("countdate" %in% colnames(tab)) tab <- tab[order(tab$countdate),]
  if("refid" %in% colnames(tab)) tab <- tab[order(tab$refid),]
  if(!is.null(cols)) tab <- tab[,cols]
  tab
}

# Not used; this would return just the json
rcax_escdata_ <- function(table_id, extra = NULL, key = NULL, ...) {
  assert_is(table_id, 'character')
  assert_is(key, 'character')
  rcax_GET("ca", key, query=c(list(table_id=table_id), extra), ...)
}
