#' Remove NA columns
#'
#' @param df
#'
#' @return a data frame that only includes columns where at least one row has a value
#' @export
#'
#' @examples
#' remove_na_columns(df)
remove_na_columns <- function(df) {

    case_missing_rate <- data.frame(colMeans(is.na(df))) %>%
        tibble::rownames_to_column(var = "column") %>%
        dplyr::rename(missing_rate = 2)

    all_missing_cols <- case_missing_rate %>%
        dplyr::filter(missing_rate == 1.0) %>%
        dplyr::pull(column)

    df %>%
        dplyr::select(-all_missing_cols)
}
