% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/qstats.R
\name{qstats}
\alias{qstats}
\title{Calculate basic statistics on a quantitative variable}
\usage{
qstats(formula, data, ..., .level = 0.95, .wide = FALSE)
}
\arguments{
\item{formula}{indicating which variables are to be used. See details.}

\item{data}{the data table containing the variables}

\item{...}{the names of the statistics desired. Default: the favorite
statistics from \code{fav_stats()} in the mosaic package.}

\item{.level}{the confidence or coverage level (default: 0.95)}

\item{.wide}{format the output in a nice way for human reading. The default
is to output a tidy data table with one row for each of the groups
defined by the categorical variables on the right side of the formula.}
}
\description{
Does a tidy calculation of basic stats. "Tidy" means that \code{qstats()} takes a
data table as input and produces a data table as output. The output will have one column
for each of the statistics requested as well as columns for any grouping variables.
}
\details{
Use a one-sided formula if there is only one quantitative variable involved
or a two-sided formula with the quantitative variable on the left
and categorical variables on the right. Note that \code{qstats()} uses only the formula to define
splitting into groups and ignores any grouping imposed by \code{dplyr::group_by()}.
It is unlike \code{dplyr::summarise()} in that respect.  QUESTION: Should this be configured to work
both with \code{group_by()} and the formula, using all the variables mentioned.

Available statistics:
\itemize{
\item \code{min}, \code{Q1}, \code{median}, \code{mean}, \code{Q3}, \code{max}, \code{sd}, \code{n}, \code{missing}. When no specific statistics are named, these will be the output.
\item Intervals giving the high and low values:
\itemize{
\item \code{coverage}: covers the central 95% of the data
\item \code{mean.conf}: confidence interval on the mean
\item \code{median.conf}: confidence interval on the median
\item \code{sd.conf}: confidence interval on the standard deviation
}
\item Just one end of the interval, use a name like \code{sd.conf.low}
}
}
\examples{
mtcars \%>\% qstats( ~ hp, mean, median, sd.conf)
mtcars \%>\% qstats(hp ~ cyl, mean, median, sd.conf)
mtcars \%>\% qstats(hp ~ cyl)


}
