#' Get nosa table
#' 
#' Returns nosa table sorted by popid and spawningyear. The default
#' columns to return are "recoverydomain", "esu_dps", "commonpopname",
#'  "commonname", "run", "popid", "majorpopgroup", "spawningyear", 
#'  "nosaij", "nosaej"
#'  
#'  The NOSA table is "4EF09E86-2AA8-4C98-A983-A272C2C2C7E3"
#'
#' @export
#' @param table_id table id eg 4EF09E86-2AA8-4C98-A983-A272C2C2C7E3
#' @param extra extra query params. Enter as a list, e.g. list(pageno=1)
#' @param cols column names to return. Use cols=NULL if you want all columns
#' @template all
#' @template info
#' @examples 
#' head(rcax_nosa())
#' 
rcax_nosa <- function(table_id="4EF09E86-2AA8-4C98-A983-A272C2C2C7E3", extra = NULL, key = NULL, parse = TRUE, cols = c("recoverydomain", "esu_dps", "commonpopname", "commonname", "run", "popid", "majorpopgroup", "spawningyear", "nosaij", "nosaej"), ...) {
  assert_is(table_id, 'character')
  assert_is(extra, 'list')
  assert_is(parse, 'logical')
  tab <- rcax_parse(rcax_nosa_(table_id, extra, key, ...), parse)$records
  if("spawningyear" %in% colnames(tab)) tab <- tab[order(tab$spawningyear),cols]
  if("popid" %in% colnames(tab)) tab <- tab[order(tab$popid),cols]
}

#' @export
#' @rdname rcax_nosa
rcax_nosa_ <- function(table_id, extra = NULL, key = NULL, ...) {
  assert_is(table_id, 'character')
  assert_is(key, 'character')
  rcax_GET("ca", key, query=c(list(table_id=table_id), extra), ...)
}
