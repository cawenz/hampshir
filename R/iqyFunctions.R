#' Title
#'
#' @param path A path to a .iqy file created in Informer.
#'
#' @return String of the constructed url drawn from the .iqy file.
#' @export parseIqyUrl
#'
#' @examples
#' path <- "path/to/iqyfile.iqy"
#' parseIqyUrl(path)
parseIqyUrl <- function(path) {
  q <- readLines(path)
  qurl <- paste(q[3], q[4], sep = "?")
  return(qurl)
}


#' Title
#'
#' @param url A valid url, often the result of running parseIqyUrlthat will fetch current data from Informer.
#'
#' @return A data.frame containing the requested data. Missing values will be converted to NA.
#' @export getIqyData
#'
#' @examples
#' url <- "https://informer.hampshire.edu/reports/informer/query&token=fc72421f-d9eb-46e2-84a4-5a95c3d928e7&id=1687945229&locale=en_US&encoding=UTF-8&mvSelection=COMMA"
#' getIqyData(url)
getIqyData <- function(url){
  res <- httr2::request(url) |>
          httr2::req_perform() |>
            httr2::resp_body_string()

  table <- rvest::html_table(rvest::minimal_html(res),
                             header=T,
                             na.strings=""
                             )

  table[[1]]
}
