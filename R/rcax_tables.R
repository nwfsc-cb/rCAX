#' Get the list of CAX tables with ids
#' 
#' @export
#' @param cols the columns to return. default is name, description and id
#' @template all
#' @template info
#' @examples \dontrun{
#' rcax_tables()
#' }
rcax_tables <- function(key = NULL, parse = TRUE, cols = c("name", "id", "description"), ...) {
  assert_is(parse, 'logical')
  tab <- rcax_parse(rcax_tables_(key, ...), parse)$tables
  tab[,cols]
}

#' @export
#' @rdname rcax_nosa
rcax_tables_ <- function(key = NULL, ...) {
  assert_is(key, 'character')
  rcax_GET("ca/tables", key, ...)
}
