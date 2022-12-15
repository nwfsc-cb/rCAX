#' Make a GET call to API
#' 
#' @details 
#' API Key: rCAX includes a "read-only" API key. Thus for normal 
#' read-only use, you
#' do not need an API key. If you need to use your
#' own key, see the instructions in \code{vignette("api_get", package = "rCAX")}.
#'  
#' User Agent String: `rcax_ua()` sets the user agent string that is passed
#' to the CAX REST API. If the rCAX package code is reused (for another 
#' package), make sure to change the user agent string to indicate that
#' the queries are from another package.
#' 
#' @export
#' @param path what to add after the base api path
#' @param query a list of query parameters with their values, e.g. `list(param=value)`
#' @param key A CAX API key. See details.
#' @param ... Curl options passed to \code{\link[crul]{HttpClient}}
#' @template apiref
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
#' "https://api.streamnet.org/api/v1"
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
#' @references 
#' This function is modeled off `rl_parse()` in \url{https://github.com/ropensci/rredlist}
rcax_parse <- function(x, parse) {
  jsonlite::fromJSON(x, TRUE)
}

#' Get the key from the user system environment variable
#' 
#' Saved in `CAX_KEY` in the `.Renviron` file. Alternatively it can be passed in.
#'
#' @param key the key
#' @export
#' @rdname check_key
#' @references 
#' This function is modeled off check_key() in \url{https://github.com/ropensci/rredlist}
check_key <- function(key){
  key <- rCAXkey
  tmp <- if (is.null(key)) Sys.getenv("CAX_KEY", "") else key
  if (tmp == "") {
    stop("need an API key for CAX data", call. = FALSE)
  } else {
    tmp
  }
}

#' @method print rcax_zzz
#' @export
print.rcax_zzz <- function(x, ...) cat("")

#' Make the user agent string
#'
#' @export
#' @examples 
#' rcax_ua()
#' @rdname rcax_ua
#' @references 
#' This function is modeled off `rl_ua()` in \url{https://github.com/ropensci/rredlist}
rcax_ua <- function() {
  versions <- c(
    paste0("r-curl/", utils::packageVersion("curl")),
    paste0("crul/", utils::packageVersion("crul")),
    paste0("rCAX/", utils::packageVersion("rCAX"))
  )
  paste0(versions, collapse = " ")
}

#' Return table name given the HLI short name
#' 
#' * NOSA: Natural origin spawner abundance
#' * SAR: SAR
#' * PNI: PNI
#' * RperS: Recruits per spawner
#' * JuvOut: Short for JuvenileOutmigrants.
#' * PreSmolt: Short for PresmoltAbundance.
#' 
#' @export
#' @param hli The HLI short name: NOSA, SAR, PNI, RperS, JuvOut, or PreSmolt
#' @param type XPort table or base table
#' @examples
#' rcax_table_name("NOSA", type="xport")
#' @rdname rcax_table_name
rcax_table_name <- function(hli, type=c("xport", "base")){
  type <- match.arg(type)
  if(type=="xport"){
    tab <- list(
      NOSA = "XPortCA_NOSA_01",
      SAR = "XPortCA_SAR_01",
      PNI = "XPortCA_PNI_01",
      JuvOut = "XPortCA_JuvenileOutmigrants_01",
      PreSmolt = "XPortCA_PresmoltAbundance_01",
      RperS = "XPortCA_RperS_01"
    )
  }
  if(type=="base"){
    tab <- list(
      NOSA = "NOSA",
      SAR = "SAR",
      PNI = "PNI",
      JuvOut = "JuvenileOutmigrants",
      PreSmolt = "PresmoltAbundance",
      RperS = "RperS"
    )
  }
  return(tab[[hli]])
}


