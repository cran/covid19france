#' Get info about this dataset
#'
#' @return A tibble with information about where the data is pulled from, details about the dataset, what the data types are, etc.
#' @export
#'
#' @examples
#' \donttest{
#' get_info_covid19france()
#' }
get_info_covid19france <- function() {
  latest_data <-
    refresh_covid19france(verbose = FALSE)

  dplyr::tibble(
    data_set_name = "covid19france",
    package_name = "covid19france",
    function_to_get_data = "refresh_covid19france",
    data_details = "Open Source data from opencovid19-fr on distribution of confirmed Covid-19 cases and deaths in the US States. For more, see https://github.com/opencovid19-fr/data.",
    data_url = "https://raw.githubusercontent.com/opencovid19-fr/data/master/dist/chiffres-cles.csv",
    license_url = "https://github.com/opencovid19-fr/data/blob/master/LICENSE",
    data_types =
      latest_data %>%
        tidyr::drop_na(data_type) %>%
        dplyr::pull(data_type) %>%
        unique() %>%
        stringr::str_c(collapse = ", "),
    location_types =
      latest_data %>%
        tidyr::drop_na(location_type) %>%
        dplyr::pull(location_type) %>%
        unique() %>%
        stringr::str_c(collapse = ", "),
    spatial_extent = "country",
    has_geospatial_info = FALSE
  )
}
