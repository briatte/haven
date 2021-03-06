#' Zap label
#'
#' Removes label, leaving unlabelled vectors as is. Use this if you want to
#' simply drop all `label` attributes from a data frame.
#'
#' @param x A vector or data frame
#' @family zappers
#' @export
#' @examples
#' x1 <- labelled(1:5, c(good = 1, bad = 5))
#' x1
#' zap_label(x1)
#'
#' x2 <- labelled_spss(c(1:4, 9), c(good = 1, bad = 5), na_values = 9)
#' x2
#' zap_label(x2)
#'
#' # zap_label also works with data frames
#' df <- tibble::tibble(x1, x2)
#' df
#' zap_label(df)
zap_label <- function(x) {
  UseMethod("zap_label")
}

#' @export
zap_label.default <- function(x) {
  x
}

#' @export
zap_label.haven_labelled <- function(x) {
  attr(x, "label") <- NULL
  x
}

#' @export
zap_label.data.frame <- function(x) {
  x[] <- lapply(x, zap_label)
  x
}
