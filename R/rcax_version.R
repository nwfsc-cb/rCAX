#' Look up the rCAX versions
#' 
#' Get the version installed and the version on GitHub.
#' 
#' @return returns the GitHub version invisibly
#' @export
#' @examples
#' rcax_version()
#' 
rcax_version <- function(){
  cli <- crul::HttpClient$new(
    url = "https://api.github.com/repos/nwfsc-math-bio/rCAX/releases/latest",
    opts = list(useragent = rcax_ua())
  )
  temp <- cli$get()
  temp$raise_for_status()
  x <- temp$parse("UTF-8")
  err_catcher(x)
  vers <- jsonlite::fromJSON(rawToChar((temp$content)))$tag_name
  vers <- substring(vers, 2, last = 1000000L)
  
  cat(paste("Installed:", utils::packageVersion("rCAX"), "   Version on GitHub:", vers, "\n"))
  invisible(vers)
}

