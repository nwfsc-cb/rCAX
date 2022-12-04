#' Get the list of CAX tables with ids
#' 
#' @export
#' @param cols the columns to return. default is name, description and id. use cols=NULL to get all the columns
#' @template info
#' @template getargs
#' @examples
#' a <- rcax_tables(cols=NULL)
#' colnames(a)
#' 
#' head(a[,1:2])
#' 
rcax_tables <- function(key = NULL, parse = TRUE, cols = c("name", "id", "description"), ...) {
  assert_is(parse, 'logical')
  
  # api call; output is in $tables
  tab <- rcax_parse(rcax_GET("ca/tables", key, ...), parse)$tables
  if(!is.null(cols)) tab <- tab[, cols]
  tab
}

# Not used but would return just json
rcax_tables_ <- function(key = NULL, ...) {
  assert_is(key, 'character')
  rcax_GET("ca/tables", key, ...)
}
