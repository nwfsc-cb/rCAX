#' Get nosa table
#'
#' @export
#' @param table_id table id eg 4EF09E86-2AA8-4C98-A983-A272C2C2C7E3
#' @param ... other query params. Enter as abc=1, def=2, etc.

#' @template all
#' @template info
#' @examples \dontrun{
#' rcax_nosa("4EF09E86-2AA8-4C98-A983-A272C2C2C7E3")
#' rcax_nosa_()
#' }
rcax_nosa <- function(table_id, key = NULL, parse = TRUE, ...) {
  assert_is(table_id, 'character')
  assert_is(parse, 'logical')
  rcax_parse(rcax_nosa_(table_id, key, ...), parse)
}

#' @export
#' @rdname rcax_nosa
rcax_nosa_ <- function(table_id, key = NULL, ...) {
  assert_is(table_id, 'character')
  assert_is(key, 'character')
  rcax_GET("ca", key, query=qlist(list(table_id=table_id), ...))
}
