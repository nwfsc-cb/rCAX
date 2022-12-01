#' @title rCAX
#' @description CAX R Client
#' @section ids
#'
#' @section Authentication:
#' You will need to request a pull key from StreamNet. You will use the same key for all your requests. 
#' Instructions for requesting a key are here [StreamNet](https://www.streamnet.org/resources/exchange-tools/rest-api-documentation/) 
#' Make sure to specify what you will do with the key and that you only need pull access.
#' After getting your key set it as CAX_KEY in your .Renviron file. Paste this text into that file.
#' 
#' CAX_KEY='youractualkeynotthisstring'
#' 
#' To find (and create if necessary) your .Renviron file, use `usethis::edit_r_environ()` 
#' then open that file and paste in the key text. 
#' After you edit the file, you will need to restart R. If you are in RStudio use Session > Restart R.
#' 
#' Keep this key private. You can pass the key in to each function via the
#' key parameter, but it's better to store the key as a
#' environment variable (CAX_KEY).
#'
#' @section Citing the CAX data:
#' 
#'
#' @importFrom jsonlite fromJSON
#' @name rCAX-package
#' @aliases rCAX
#' @docType package
#' @keywords package
NULL
