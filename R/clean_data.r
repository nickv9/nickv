#' Remove NA columns
#'
#' @param df
#'
#' @return a data frame that only includes columns with at least one value
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

#' Remove columns with no variance
#'
#' @param df
#'
#' @return a data frame where zero variance columns are removed
#' @export
#'
#' @examples
#' remove_no_variance_columns(df)
remove_no_variance_columns <- function(df) {

    unique_values <- purrr::map(df, function(x) length(unique(x)))

    no_var_cols <- names(which(unique_values == 1))

    df %>%
        select(-no_var_cols)
}
