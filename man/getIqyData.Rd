% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/iqyFunctions.R
\name{getIqyData}
\alias{getIqyData}
\title{Title}
\usage{
getIqyData(url)
}
\arguments{
\item{url}{A valid url string for a report in Informer, usually generated using parseIqyUrl}
}
\value{
a data.frame of results from querying Informer.
}
\description{
Title
}
\examples{
 \dontrun{
path <- file("https://raw.githubusercontent.com/cawenz/HCephemera/main/buildings.iqy")
url <- parseIqyUrl(path)
x <- getIqyData(url)
close(path)}
}
