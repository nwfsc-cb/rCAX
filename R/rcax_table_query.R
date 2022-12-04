#' Returns a filtered table or colnames 
#' 
#' This is the base function for queries to most of the CAX tables, e.g. `rcax_nosa()`
#' Default queries will download 1000 records. You will 
#'  want to make a filtered query by passing in `flist` as a list with the column name values to filter on.
#'  
#' @export
#' @template all
#' @template info
#' @template commonargs
#' @examples 
#' a <- rcax_nosa(popid=7)
#' a[, c("popid", "spawningyear", "nosaij", "nosaej")]
#' 
#' @references 
#' This function is modeled off the functions in \url{https://github.com/ropensci/rredlist}
#' 
rcax_table_query <- function(
    tablename = NULL,
    extra = NULL, 
    flist = list(),
    cols = NULL,
    sortcols = NULL,
    type = c("data.frame", "colnames"), 
    GETargs = list(table_id = NULL, recordloc = "records", key = NULL, parse = TRUE), ...) {
  # error checking
  type <- match.arg(type)
  assert_is(tablename, 'character')
  assert_is(flist, 'list')
  assert_is(extra, 'list')
  assert_is(GETargs, 'list')
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
  
  # get the table_id
  if(is.null(tablename) & is.null(GETargs$table_id))
    stop("Need either tablename or GETargs$table_id specified.")
  if(is.null(GETargs$table_id)) table_id = subset(rCAX:::caxtabs, name==tablename)$id
  if(is.null(GETargs$table_id))
    stop("Something wrong. GETargs$table_id is NULL. Perhaps tablename is misspelled? Check the CAX table names from a call to `rcax_tables()`. Alternatively the sysdata `caxtabs` might be out of date. In which case, you will need to look up the correct table_id and pass that into `GETargs`.")
    
  # set up query list
  query_list <- list(table_id = GETargs$table_id)
  if(!is.null(extra)) query_list <- c(query_list, extra)
  # if just returning colnames, set limit to 1
  if(type=="colnames") query_list$limit <- 1
  
  # Make API call
  tab <- rcax_parse(rcax_GET("ca", key, query=query_list, ...), GETargs$parse)
  tab <- tab[[GETargs$recordloc]]
  
  # if type is colnames, return that
  if(type=="colnames") return(colnames(tab))
  
  # if type is data.frame, filter and sort
  for(i in sortcols)
    if(sortcols[i] %in% colnames(tab)) tab <- tab[order(tab[sortcols[i]]),]
  if(!is.null(cols)) tab <- tab[,cols]
  tab
}

