#' Refresh data
#'
#' @param verbose Should messages about what's going on be displayed?
#'
#' @return A tibble of the most up to date per-day data on cases of COVID-19 in France, ordered by date descending.
#' @export
#'
#' @examples
#' \donttest{
#' refresh_covid19france()
#' }
refresh_covid19france <- function(verbose = TRUE) {
  if (verbose) message(glue::glue("Downloading raw data from {url}."))

  read_data() %>%
    clean_data() %>%
    average_data() %>%
    enlongen_data()
}
