
# covid19france

<!-- badges: start -->

[![Travis build
status](https://travis-ci.org/Covid19R/covid19france.svg?branch=master)](https://travis-ci.org/Covid19R/covid19france)
[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![CRAN
status](https://www.r-pkg.org/badges/version/covid19france)](https://CRAN.R-project.org/package=covid19france)
<!-- badges: end -->

This package provides per-day data on COVID-19 cases in France.

The data is an average over all of the sources provided by
[opencovid19-fr](https://github.com/opencovid19-fr/data). (README in
English available
[here](https://github.com/opencovid19-fr/data/blob/master/README.en.md).)

## Installation

``` r
# install.packages("devtools")
devtools::install_github("Covid19R/covid19france")
```

## Data

``` r
library(covid19france)
```

Get the full dataset:

``` r
(france <- refresh_covid19france())
#> Downloading raw data from https://raw.githubusercontent.com/opencovid19-fr/data/master/dist/chiffres-cles.csv.
#> # A tibble: 23,508 x 7
#>    date       location location_type location_standa… location_standa… data_type
#>    <date>     <chr>    <chr>         <chr>            <chr>            <chr>    
#>  1 2020-04-05 Ain      county        DEP-01           department       confirmed
#>  2 2020-04-05 Ain      county        DEP-01           department       dead     
#>  3 2020-04-05 Ain      county        DEP-01           department       icu      
#>  4 2020-04-05 Ain      county        DEP-01           department       hospital…
#>  5 2020-04-05 Ain      county        DEP-01           department       recovered
#>  6 2020-04-05 Ain      county        DEP-01           department       discover…
#>  7 2020-04-05 Aisne    county        DEP-02           department       confirmed
#>  8 2020-04-05 Aisne    county        DEP-02           department       dead     
#>  9 2020-04-05 Aisne    county        DEP-02           department       icu      
#> 10 2020-04-05 Aisne    county        DEP-02           department       hospital…
#> # … with 23,498 more rows, and 1 more variable: value <int>
```

To switch to a wider format, you can use `tidyr`:

``` r
france %>% 
  tidyr::pivot_wider(
    names_from = "data_type"
  ) %>% 
  dplyr::select(
    1, 6:ncol(.), everything()
  )
#> # A tibble: 3,918 x 11
#>    date       confirmed  dead   icu hospitalized recovered discovered location
#>    <date>         <int> <int> <int>        <int>     <int>      <int> <chr>   
#>  1 2020-04-05        NA    24    30          112        86         NA Ain     
#>  2 2020-04-05        NA   100    39          221       182         NA Aisne   
#>  3 2020-04-05        NA     8    16           45        59         NA Allier  
#>  4 2020-04-05        NA     3     7           31        44         NA Alpes-d…
#>  5 2020-04-05        NA    43    78          219       171         NA Alpes-M…
#>  6 2020-04-05        NA    26    15           93       131         NA Ardèche 
#>  7 2020-04-05        NA     4    18           73        23         NA Ardennes
#>  8 2020-04-05        NA     1     5           18        10         NA Ariège  
#>  9 2020-04-05        NA    34    23          148        27         NA Aube    
#> 10 2020-04-05        NA    27    18           95        63         NA Aude    
#> # … with 3,908 more rows, and 3 more variables: location_type <chr>,
#> #   location_standardized <chr>, location_standardized_type <chr>
```

For more info on the dataset:

``` r
get_info_covid19france()
#> # A tibble: 1 x 10
#>   data_set_name package_name function_to_get… data_details data_url license_url
#>   <chr>         <chr>        <chr>            <chr>        <chr>    <chr>      
#> 1 covid19france covid19fran… refresh_covid19… Open Source… https:/… https://gi…
#> # … with 4 more variables: data_types <chr>, location_types <chr>,
#> #   spatial_extent <chr>, has_geospatial_info <lgl>
```

## Contributing

Please submit [issues](https://github.com/Covid19R/covid19france/issues)
and [pull requests](https://github.com/Covid19R/covid19france/pulls)
with any package improvements\!

Please note that the ‘covid19france’ project is released with a
[Contributor Code of Conduct](https://github.com/Covid19R/covid19france/blob/master/CODE_OF_CONDUCT.md). By contributing to
this project, you agree to abide by its terms.
