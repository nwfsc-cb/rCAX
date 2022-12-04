#' Print message re how to get CAX API key
#'
#' @description Provides instruction on how to store the key.
#'
#' @details Contact Streamnet to request a pull key or guest key. https://www.streamnet.org/resources/exchange-tools/rest-api-documentation/
#' 
#' After getting your key set it as CAX_KEY in your `.Renviron` file by pasting this text into that file. `CAX_KEY='youractualkeynotthisstring'`
#' 
#' To find (and create if necessary) your `.Renviron` file, use `usethis::edit_r_environ()`  then open that file and paste in the key text above. After you edit the file, you will need to restart R. If you are in RStudio use Session > Restart R.
#'
#' @export
#'
rcax_key <- function(){
  message("You will need to request a pull key from StreamNet. Instructions here https://www.streamnet.org/resources/exchange-tools/rest-api-documentation/ \n\nAfter getting your key set it as CAX_KEY in your .Renviron file. Paste this text into that file.\n CAX_KEY='youractualkeynotthisstring'\n To find (and create if necessary) your .Renviron file, use `usethis::edit_r_environ()` then open that file and paste in the key text.\n\nAfter you edit the file, you will need to restart R. If you are in RStudio use Session > Restart R.")

  invisible("https://www.streamnet.org/resources/exchange-tools/rest-api-documentation/")
}
