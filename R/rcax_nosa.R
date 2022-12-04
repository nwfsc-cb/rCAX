#' Get nosa table for a popid
#' 
#' Returns nosa table sorted by popid and spawningyear. The default
#' columns to return are "recoverydomain", "esu_dps", "commonpopname",
#'  "commonname", "run", "popid", "majorpopgroup", "spawningyear", 
#'  "nosaij", "nosaej"
#'  
#'  The NOSA table_id is "4EF09E86-2AA8-4C98-A983-A272C2C2C7E3" and 
#'  is set automatically using a saved data frame from a `rcax_tables()` call. The table is saved in `R/sysdata.rda`.
#'  
#'  `rcax_nosa()` will download 1000 records from the NOSA table. You will 
#'  probably want to make a filtered query by passing in value for a specific popid, e.g. `rcax_nosa(popid=7)`
#'  
#' @export
#' @param table_id not normally needed as this is set automatically to the table id for NOSA using the table saved from `rcax_table()`. But you can set it if needed.
#' @template all
#' @template info
#' @template commonargs
#' @examples 
#' a <- rcax_nosa(popid=7)
#' a[, c("popid", "spawningyear", "nosaij", "nosaej")]
#' 
#' a <- rcax_nosa()
#' head(a)
#' 
#' # to get all columns and print the column names
#' # a <- rcax_nosa(cols = NULL)
#' # colnames(a)
#' 
#' @references 
#' This function is modeled off the functions in \url{https://github.com/ropensci/rredlist}
#' 
rcax_nosa <- function(
    popid = NULL,
    cols = c("recoverydomain", "esu_dps", "commonpopname", "commonname", "run", "popid", "majorpopgroup", "spawningyear", "nosaij", "nosaej"),
    sortcols = c("spawningyear", "popid"),
    type = c("data.frame", "colnames"), 
    extra = NULL, 
    GETargs = list(tablename = "NOSA", table_id = NULL, recordloc = "records", key = NULL, parse = TRUE), ...) {
  # error checking
  type <- match.arg(type)
  assert_is(table_id, 'character')
  assert_is(extra, 'list')
  assert_is(GETargs, 'list')
  assert_is(parse, 'logical')
  # Update GETargs list with any values that the user passed in
  if (!missing(GETargs)) {
    formal.args <- formals(sys.function(sysP <- sys.parent()))
    defaultlist <- eval(formal.args[[as.character(substitute(GETargs))]], 
                    envir = sys.frame(sysP))
    
    for(i in names(GETargs)){
      if(!(i %in% names(defaultlist))) stop(paste(i, "is not a value in GETargs."))
      defaultlist[[i]] <- GETargs[[i]]
    }
    GETargs <- defaultlist
  }
  
  # get the table_id for the NOSA table
  if(is.null(table_id)) table_id = subset(rCAX:::caxtabs, name==tablename)$id
  
  # set up query list
  query_list <- list(table_id = table_id)
  if(!is.null(popid)) query_list$popid <- popid
  if(!is.null(extra)) query_list <- c(query_list, extra)
  # if just returning colnames, set limit to 1
  if(type=="colnames") query_list$limit <- 1
  
  # Make API call; for NOSA data is in records
  tab <- rcax_parse(rcax_GET("ca", key, query=query_list, ...), parse)
  tab <- tab$records
  
  # if type is colnames, return that
  if(type=="colnames") return(colnames(tab))
  
  # if type is data.frame, filter and sort
  for(i in sortcols)
    if(sortcols[i] %in% colnames(tab)) tab <- tab[order(tab[sortcols[i]]),]
  if(!is.null(cols)) tab <- tab[,cols]
  tab
}

# Not used; this would return just the json
rcax_nosa_ <- function(table_id, extra = NULL, key = NULL, ...) {
  assert_is(table_id, 'character')
  assert_is(key, 'character')
  rcax_GET("ca", key, query=c(list(table_id=table_id), extra), ...)
}
