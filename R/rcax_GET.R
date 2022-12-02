#' Make a GET call to API
#' 
#'
#' @export
#' @param path what to add after the base api path
#' @param key the api key
#' @param ... extra info
#' @examples \dontrun{
#' rcax_GET("ca/tables")
#' }
#' @references 
#' This function is modeled off the functions in \url{https://github.com/ropensci/rredlist}

rcax_GET <- function(path, key = NULL, query=NULL, ...){
  cli <- crul::HttpClient$new(
    url = file.path(rcax_base(), path),
    opts = list(useragent = rcax_ua())
  )
  temp <- cli$get(query = c(query, list(XApiKey = check_key(key))), ...)
  temp$raise_for_status()
  x <- temp$parse("UTF-8")
  err_catcher(x)
  return(x)
}

#' Set the base API url
#'
#' @export
#' @rdname rcax_base
rcax_base <- function() "https://api.streamnet.org/api/v1"

#' Parse results from API call
#'
#' @param x what needs to be parsed
#' @param parse logical true/false
#' @export
#' @rdname rcax_parse
rcax_parse <- function(x, parse) {
  jsonlite::fromJSON(x, parse)
}

#' Check to make sure key looks ok
#'
#' @param key the key
#' @export
#' @rdname check_key
check_key <- function(key){
  tmp <- if (is.null(key)) Sys.getenv("CAX_KEY", "") else key
  if (tmp == "") {
    rcax_use_cax()
    stop("need an API key for CAX data", call. = FALSE)
  } else {
    tmp
  }
}

#' Make the user agent string
#'
#' @export
#' @rdname rcax_ua
rcax_ua <- function() {
  versions <- c(
    paste0("r-curl/", utils::packageVersion("curl")),
    paste0("crul/", utils::packageVersion("crul")),
    sprintf("rCAX/%s", utils::packageVersion("rCAX"))
  )
  paste0(versions, collapse = " ")
}
