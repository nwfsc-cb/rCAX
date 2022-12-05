#' Create filter to add to GET call
#' 
#' The table returned by an API query can be filtered using
#' the filter query param. The value of the param is JSON. An examples are
#' * `filter=[{"field":"popid","value":"7","type":"string"}]')`
#' * `filter=[{"field":"popid","value":[7,8],"type":"list"}]')`
#' * `filter=[{"field":"esu_dps","value":"Salmon, coho(Oregon Coast ESU)","type":"string"}]')`
#' 
#' @export
#' @param x list of property (column) names, values in this format `list(colname=value)`. If the property can take multiple values, this is passed in as `list(colname=c(value1, value2))`
#' 
#' @details 
#' The property names in `x` are the column names in a table being returned by `rcax_table_query()`. 
#' Note the values are not case sensitive. So a value of `Spring` will return the data with `Spring` and `spring`.
#' @examples 
#' rcax_filter(list(commonpopname="GRCAT"))
#' rcax_filter(list(popid=c(7,8)))
#' @return The JSON for the filter query param
#' @author 
#' EE Holmes

rcax_filter <- function(x){
 assert_is(x, 'list')
 df <- data.frame(field=names(x), value="tmp", type="string")
 for(i in 1:nrow(df)){
   val <- x[[i]]
   if(length(val)>1){
     val <- list(val)
     df$type[i] <- "list"
   }
   df$value[i] <- val
 }
 return(jsonlite::toJSON(df))
}

