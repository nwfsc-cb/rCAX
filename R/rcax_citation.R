#' Get the citation CAX version
#'
#' @export
#' @return API citation as character string
#' @examples
#' rcax_citation()
#' 
rcax_citation <- function() {
  print(citation("rCAX"), bibtex=FALSE)
  cat(
    'To cite the CAX HLI data, see citation information at:\n\n  Citing StreamNet Content, Database Queries <https://www.streamnet.org/resources/citing-sn/>'
  )
}
