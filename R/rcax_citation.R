#' Get the citation CAX version
#'
#' @export
#' @return API citation as character string
#' @examples \dontrun{
#' rcax_citation()
#' }
rcax_citation <- function(...) {
  sprintf('Coordinated Assessments. Version %s <https://www.streamnet.org/home/data-maps/fish-hlis/>')
}
