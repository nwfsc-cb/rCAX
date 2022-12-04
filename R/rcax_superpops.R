#' Get SuperPopulations table
#' 
#' Returns SuperPopulations table
#'  
#'  The SuperPopulations table_id is "009A08FE-6479-44FC-9B6F-01C55E2C8BA3" and 
#'  is set automatically using a saved data frame from a `rcax_tables()` call. The table is saved in `R/sysdata.rda`.
#'  
#'  `rcax_superpops()` will download 1000 records. 
#'  
#' @export
#' @template all
#' @template commonargs
#' @template info
#' @examples 
#' # to get all columns and print the column names
#' a <- rcax_superpops(cols = NULL)
#' colnames(a)
#' 
#' @references 
#' This function is modeled off the functions in \url{https://github.com/ropensci/rredlist}
#' 
rcax_superpops <- function(
    popid = NULL,
    extra = NULL, 
    table_id = NULL,
    key = NULL, parse = TRUE, recordloc = "records",
    cols = NULL, 
    type = c("data.frame", "colnames"), 
    tablename = "NOSA", 
    sortcols = c("popid"), ...) {
  # error checking
  assert_is(table_id, 'character')
  assert_is(extra, 'list')
  assert_is(parse, 'logical')
  
  # get the table_id for the table
  if(is.null(table_id)) table_id = subset(rCAX:::caxtabs, name=="SuperPopulations")$id
  
  # set up query list
  query_list <- list(table_id = table_id)
  if(!is.null(popid)) query_list$popid <- popid
  if(!is.null(extra)) query_list <- c(query_list, extra)
  
  # Make API call; returns a list
  tab <- rcax_parse(rcax_GET("ca", key, query=query_list, ...), parse)
  # The list record that we want
  tab <- tab[[recordloc]]
  
  # if type is colnames, return that
  if(type=="colnames") return(colnames(tab))
  
  # if type is data.frame, filter and sort
  for(i in sortcols)
    if(sortcols[i] %in% colnames(tab)) tab <- tab[order(tab[sortcols[i]]),]
  if("popid" %in% colnames(tab)) tab <- tab[order(tab$popid),]
  if(!is.null(cols)) tab <- tab[,cols]
  tab
}

# Not used; this would return just the json
rcax_superpops_ <- function(table_id, extra = NULL, key = NULL, ...) {
  assert_is(table_id, 'character')
  assert_is(key, 'character')
  rcax_GET("ca", key, query=c(list(table_id=table_id), extra), ...)
}
