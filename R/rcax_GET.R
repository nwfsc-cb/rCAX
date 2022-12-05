#' Make a GET call to API
#' 
#' @details You will need an API key to make GET queries. Contact Streamnet to request a pull key or guest key. https://www.streamnet.org/resources/exchange-tools/rest-api-documentation/
#' 
#' After getting your key set it as CAX_KEY in your `.Renviron` file by pasting this text into that file. `CAX_KEY='youractualkeynotthisstring'`
#' 
#' To find (and create if necessary) your `.Renviron` file, use `usethis::edit_r_environ()` 
#' then open that file and paste in the key text above.
#' After you edit the file, you will need to restart R. If you are in RStudio use Session > Restart R.
#' 
#' @export
#' @param path what to add after the base api path
#' @template info
#' @template getargs
#' @examples \dontrun{
#' rcax_GET("ca/tables")
#' }
#' @references 
#' This function is modeled off `rl_GET()` in \url{https://github.com/ropensci/rredlist}

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
#' @examples
#' rcax_base()
#' @rdname rcax_base
rcax_base <- function() "https://api.streamnet.org/api/v1"

#' Parse results from API call
#'
#' @param x what needs to be parsed
#' @param parse logical true/false
#' @seealso `rcax_GET()` for examples
#' @export
#' @rdname rcax_parse
rcax_parse <- function(x, parse) {
  jsonlite::fromJSON(x, parse)
}

#' Get the key from the user system environment variable
#' 
#' Saved in `CAX_KEY` in the `.Renviron` file. Alternatively it can be passed in.
#'
#' @param key the key
#' @export
#' @rdname check_key
#' @references 
#' This function is modeled off the functions in \url{https://github.com/ropensci/rredlist}
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
#' @examples 
#' rcax_ua()
#' @rdname rcax_ua
#' @references 
#' This function is modeled off the functions in \url{https://github.com/ropensci/rredlist}
rcax_ua <- function() {
  versions <- c(
    paste0("r-curl/", utils::packageVersion("curl")),
    paste0("crul/", utils::packageVersion("crul")),
    sprintf("rCAX/%s", utils::packageVersion("rCAX"))
  )
  paste0(versions, collapse = " ")
}
