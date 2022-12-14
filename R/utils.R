# These functions are from 
# https://github.com/ropensci/rredlist

ct <- function(l) Filter(Negate(is.null), l)

err_catcher <- function(x) {
  xx <- jsonlite::fromJSON(x)
  if (any(vapply(c("message", "error"), function(z) z %in% names(xx),
                 logical(1)))) {
    stop(xx[[1]], call. = FALSE)
  }
}

space <- function(x) gsub("\\s", "%20", x)

assert_is <- function(x, y) {
  if (!is.null(x)) {
    if (!inherits(x, y)) {
      stop(deparse(substitute(x)), " must be of class ",
           paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}

assert_n <- function(x, n) {
  if (!is.null(x)) {
    if (!length(x) == n) {
      stop(deparse(substitute(x)), " must be length ", n, call. = FALSE)
    }
  }
}

assert_not_na <- function(x) {
  if (!is.null(x)) {
    if (any(is.na(x))) {
      stop(deparse(substitute(x)), " must not be NA", call. = FALSE)
    }
  }
}

nir <- function(path_name, path_id, name = NULL, id = NULL, region = NULL) {

  # only one of name OR id
  stopifnot(xor(!is.null(name), !is.null(id)))

  # check types
  assert_is(name, 'character')
  assert_is(id, c('integer', 'numeric'))
  assert_is(region, 'character')

  # can't be NA
  assert_not_na(name)
  assert_not_na(id)
  assert_not_na(region)

  # check lengths - only length 1 allowed for all
  assert_n(name, 1)
  assert_n(id, 1)
  assert_n(region, 1)

  # construct path
  path <- if (!is.null(name)) {
    file.path(path_name, space(name))
  } else {
    file.path(path_id, id)
  }
  if (!is.null(region)) {
    path <- file.path(path, "region", space(region))
  }

  return(path)
}

qlist <- function(x, ...) {
  return(c(x, ...))
}

.onAttach <- function(lib, pkg){
  msg <- "Access and use of data in the CAX databases requires acceptance of the terms of use: rcax_termsofuse()."
  packageStartupMessage(msg)      
  invisible()
}
