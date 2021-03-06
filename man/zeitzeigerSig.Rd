% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zeitzeiger_fit.R
\name{zeitzeigerSig}
\alias{zeitzeigerSig}
\title{Estimate significance of periodicity by permutation testing.}
\usage{
zeitzeigerSig(x, time, fitMeanArgs = list(rparm = NA, nknots = 3),
  nIter = 200, dopar = TRUE)
}
\arguments{
\item{x}{Matrix of measurements, with observations in rows and features in columns.
Missing values are allowed.}

\item{time}{Vector of values of the periodic variable for the observations, where 0
corresponds to the lowest possible value and 1 corresponds to the highest possible value.}

\item{fitMeanArgs}{List of arguments to pass to \code{bigspline}.}

\item{nIter}{Number of permutations.}

\item{dopar}{Logical indicating whether to process features in parallel.
Use \code{\link[doParallel]{registerDoParallel}} to register the parallel backend.}
}
\value{
Vector of p-values.
}
\description{
\code{zeitzeigerSig} estimates the statistical significance of the periodic
smoothing spline fit. At each permutation, the time vector is scrambled and then
zeitzeigerFit is used to fit a periodic smoothing spline for each feature as a
function of time. The p-value for each feature is calculated based on the
of permutations that had a signal-to-noise ratio at least as large as the
observed signal-to-noise ratio, adjusted by the method of Phipson and Smyth (2010).
Make sure to first register the parallel backend using \code{registerDoParallel}.
For genome-scale data, this function will be very slow.
}
\seealso{
\code{\link{zeitzeigerFit}}
}
