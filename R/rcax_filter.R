#' Create filter to add to GET call
#' 
#' The table returned by an API query can be filtered using
#' the filter query parameter. The value of the parameter is JSON. Examples are
#' * `filter=[{"field":"popid","value":"7","type":"string"}]`
#' * `filter=[{"field":"popid","value":[7,8],"type":"list"}]`
#' * `filter=[{"field":"esu_dps","value":"Salmon, Chinook (Snake River spring/summer-run ESU)","type":"string"}]`
#' 
#' @export
#' @param x list of property (column) names, values in this format `list(colname=value)`. If the property can take multiple values, this is passed in as `list(colname=c(value1, value2))`
#' 
#' @details 
#' The property names in `x` are the column names in a table being returned by `rcax_table_query()`. 
#' Note the values are not case sensitive. So a value of `Spring` will return the data with `Spring` and `spring`.
#' 
#' {crul} properly formats the filter given the JSON. For reference, here
#' is a url example. Note that in the filter double quotes are required.
#' A single quote will not filter. 
#' ```
#' httr::GET('https://api.streamnet.org/api/v1/ca.json?table_id=4EF09E86-2AA8-4C98-A983-A272C2C2C7E3&XApiKey=C4F5F084-EBE3-4ED6-8AF1-125EC54E6E52&filter=[{"field":"esu_dps","value":"Salmon,%20coho%20(Oregon%20Coast%20ESU)","type":"string"}]')
#' ```
#' @examples 
#' rcax_filter(list(commonpopname="GRCAT"))
#' rcax_filter(list(popid=c(7,8)))
#' @return The JSON for the filter query parameter
rcax_filter <- function(x){
 assert_is(x, 'list')
 df <- data.frame(field=names(x), value="tmp", type="string")
 for(i in seq_len(nrow(df))){
   val <- x[[i]]
   if(length(val)>1){
     val <- list(val)
     df$type[i] <- "list"
   }
   df$value[i] <- val
 }
 return(jsonlite::toJSON(df))
}

