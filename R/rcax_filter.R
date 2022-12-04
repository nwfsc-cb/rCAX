#' Create filter to add to GET call
#' 
#'
#' @export
#' @param flist list of property (column) names, values in this format `list(colname=value)`
#' @param type (optional) a list with type for property names. If not passed in, the type will be inferred from the value in `flist`.
#' 
#' @details 
#' * Any spaces in the values in `flist` will be replaced with `%20`. This is done automatically but can also be done by the user.
#' * `type` The type of the value, for example "string" will be inferred from `class(flist$value)` but if you run into problems, you can pass in type for that property. It is not necessary to include all property names in `flist`. Only properties for which `class(flist$value)` is not producing the correct type.
#' * The property names in `flist` are the column names in a table being returned by `rcax_GET()`. 
#' @examples \dontrun{
#' rcax_GET("ca/tables")
#' }
#' @author 
#' EE Holmes

rcax_filter <- function(flist){
  
  tab = httr::GET('https://api.streamnet.org/api/v1/ca.json?table_id=4EF09E86-2AA8-4C98-A983-A272C2C2C7E3&XApiKey=C4F5F084-EBE3-4ED6-8AF1-125EC54E6E52&filter=[{"field":"esu_dps","value":"Salmon,%20coho%20(Oregon%20Coast%20ESU)","type":"string"}]')
  
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

