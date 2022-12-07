#' Returns a filtered table or colnames
#'
#' This is the base function for queries to most of the CAX tables, e.g. `rcax_nosa()`
#' Default queries will download 1000 records. You will
#'  want to make a filtered query by passing in `flist` as a list with the column name values to filter on.
#'
#' @details
#' The required query parameters are table_id and XAPIKEY. These are set from the information in `GETargs`. table_id is normally looked up from `rcax_tables()` using `tablename` and `XAPIKEY` is looked up from `CAX_KEY` in the user environment (saved in `.Renviron` file. See \code{vignette("setup", package = "rCAX")} for how to set the key.  The `qlist` argument is any additional query parameters. The following are some of the available extra (meaning not required) query parameters.
#' * page=num Integer of the page selected.
#' * per_page=num  Integer for the number of records per page.
#' * limit=num Maximum number of records to return. Default is 1000.
#' * agency=character Agency that submitted the record. You can designate one or more (comma-separated) agency acronyms: IDFG, WDFW, ODFW, CRITFC, CCT, NOAA.
#' * updated_since	Date since epoch in seconds: 2012-04-24 15:05:22 -0400 = 1335294322.
#' * popid Population id in NOSA tables.
#'
#' Filtering, i.e. subsetting, the query is specified using the `flist` argument.
#' This is a list with the column name and value. See `rcax_filter()` for the filtering code which writes the filter query parameter that is added to the GET query. See `rcax_filter()` for examples of how one passes in `flist`.
#'
#' @export
#' @template info
#' @template tableargs
#' @seealso `rcax_GET()`, `rcax_nosa()`, `rcax_escdata()`, `rcax_superpops()`
#' @examples
#' a <- rcax_table_query(tablename="NOSA", qlist = list(limit=5))
#' a[, c("popid", "spawningyear", "nosaij", "nosaej")]
#'
#' @references
#' This function was originally modeled off the functions in \url{https://github.com/ropensci/rredlist} but was greatly modified.
#'
rcax_table_query <- function(
    tablename = NULL,
    flist = NULL,
    qlist = NULL,
    cols = NULL,
    sortcols = NULL,
    type = c("data.frame", "colnames"),
    GETargs = list(table_id = NULL, recordloc = "records", key = NULL, parse = TRUE), ...) {
  # error checking
  type <- match.arg(type)
  assert_is(tablename, 'character')
  assert_is(flist, 'list')
  assert_is(qlist, 'list')
  assert_is(GETargs, 'list')
  # Update GETargs list with any values that the user passed in
  if (!missing(GETargs)) {
    formal.args <- formals(sys.function(sysP <- sys.parent()))
    defaultlist <- eval(formal.args[["GETargs"]],
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
  if(is.null(GETargs$table_id)) GETargs$table_id <- subset(rCAX:::caxtabs, name==tablename)$id
  if(is.null(GETargs$table_id))
    stop("Something wrong. GETargs$table_id is NULL. Perhaps tablename is misspelled? Check the CAX table names from a call to `rcax_tables()`. Alternatively the sysdata `caxtabs` might be out of date. In which case, you will need to look up the correct table_id and pass that into `GETargs`.")
  
  # error check the flist because it will return a 500 if col is bad
  if(type!="colnames" && !is.null(flist) && length(flist)!=0){
    tmp <- list(table_id = GETargs$table_id, limit=1)
    tabcols <- colnames(rcax_parse(rcax_GET("ca", GETargs$key, query = tmp, ...), TRUE)[[GETargs$recordloc]])
    if(!all(names(flist) %in% tabcols)){
      badcols <- names(flist)[!(names(flist) %in% tabcols)]
      stop(paste("Not all flist names appear in the table. The bad names are:", paste0(badcols, collapse=", "), "\n Use type='colnames' to print the column names."), call. = FALSE)
    }
  }
  
  # set up query list
  query_list <- list(table_id = GETargs$table_id)
  if(!is.null(qlist)) query_list <- c(query_list, qlist)
  # if just returning colnames, set limit to 1
  if(type=="colnames") 
    query_list$limit <- 1
  else
    if(!is.null(flist)) query_list <- c(query_list, list(filter=rcax_filter(flist)))
  
  # Make API call
  tab <- rcax_parse(rcax_GET("ca", GETargs$key, query=query_list, ...), GETargs$parse)
  tab <- tab[[GETargs$recordloc]]
  
  if(is.null(tab) || length(tab)==0){
    if(is.null(flist)) return("No data were returned")
    return("No data were returned. Check that you did not misspell a column name in your filter list (flist).")
  }
  
  # if type is colnames, return colnames and definitions if available
  if(type=="colnames"){
    coltab <- data.frame(name=colnames(tab), definition=NA)
    if(any(colnames(tab) %in% cax_column_definitions$name))
      coltab$definition <- cax_column_definitions$definition[match(colnames(tab), cax_column_definitions$name)]
    return(coltab)
  }
  
  # the colnames are all in lower case
  colnames(tab) <- tolower(colnames(tab))
  if(!is.null(cols)) cols <- tolower(cols)
  if(!is.null(sortcols)) sortcols <- tolower(sortcols)
  
  # if type is data.frame, filter and sort
  for(i in sortcols)
    if(i %in% colnames(tab)) tab <- tab[order(tab[[i]]),]
  if(!is.null(cols) && length(cols) > 0){
    if(!all(cols %in% colnames(tab))){
      warning(paste("Not all names in cols appear in the table. Removing ", paste0(cols[!(cols %in% colnames(tab))], collapse=", ")))
      cols <- cols[(cols %in% colnames(tab))]
    }
    if(length(cols)==0) return('The table includes no data. Did you specify cols that do not appear in the table? Use rcax_nosa_xport(type="colnames")" to see the colnames. Names are case insensitive.')
    tab <- tab[,cols]
  }
  if(!is.null(dim(tab))) rownames(tab) <- NULL
  tab
}

