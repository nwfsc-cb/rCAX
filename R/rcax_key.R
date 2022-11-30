#' Print message re how to get CAX API key
#'
#' @description Provides instruction on how to store the key.
#'
#' @details Contact Streamnet to request a pull key. https://www.streamnet.org/resources/exchange-tools/rest-api-documentation/
#'
#' @aliases rcax_use_cax
#'
#' @export
#'
rcax_use_cax <- function(){
  message("You will need to request a pull key from StreamNet. Instructions here https://www.streamnet.org/resources/exchange-tools/rest-api-documentation/ \n\nAfter getting your key set it as CAX_KEY in your .Renviron file. Paste this text into that file.\n CAX_KEY='youractualkeynotthisstring'\n To find (and create if necessary) your .Renviron file, use `usethis::edit_r_environ()` then open that file and paste in the key text.\n\nAfter you edit the file, you will need to restart R. If you are in RStudio use Session > Restart R.")

  invisible("https://www.streamnet.org/resources/exchange-tools/rest-api-documentation/")
}
