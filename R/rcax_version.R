#' Get the CAX API version
#'
#' @export
#' @param ... Curl options passed to [crul::verb-GET]
#' @return API version as character string
#' @examples \dontrun{
#' rcax_version()
#' }
rcax_version <- function(...) {
  rl_parse(rcax_GET("version", NULL, ...), TRUE)$version
}
