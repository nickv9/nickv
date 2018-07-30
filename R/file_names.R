#' Create a time stamped string to use to save files
#'
#' @param name_base the base of the file name
#' @param name_extension the file extension
#'
#' @export
#'
#' @examples
#' fname_stamped("data",".csv")
fname_stamped <- function(name_base, name_extension) {
  paste0(name_base,
         as.character(format(lubridate::now(), "_%Y%m%d_%H%M%S")),
         ".",
         name_extension
  )
}
