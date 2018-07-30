#' Read Excel cells to a dataframe
#'
#' @param header copy headers?
#' @param ...
#'
#' @export
#'
#' @examples
#' read.excel(df, header = TRUE)
read.excel <- function(header=TRUE,...) {
  read.table("clipboard",sep="\t",header=header,...)
}

#' Write dataframe to clipboard for pasting to Excel
#'
#' @param y a dataframe
#' @param row.names Include row names?
#' @param col.names Include col names?
#' @param ...
#'
#' @export
#'
#' @examples
#' write.excel(df, row.names = FALSE, col.names = TRUE)
write.excel <- function(y,row.names=FALSE,col.names=TRUE,...) {
  write.table(y,"clipboard",sep="\t",row.names=row.names,col.names=col.names,...)
}
