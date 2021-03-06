% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zeitzeiger_predict.R
\name{zeitzeigerPredict}
\alias{zeitzeigerPredict}
\title{Predict corresponding time for test observations.}
\usage{
zeitzeigerPredict(xTrain, timeTrain, xTest, spcResult,
  fitMeanArgs = list(rparm = NA, nknots = 3), constVar = TRUE,
  fitVarArgs = list(rparm = NA), nSpc = NA, betaSv = FALSE,
  timeRange = seq(0, 1, 0.01))
}
\arguments{
\item{xTrain}{Matrix of measurements for training data, observations in rows
and features in columns.}

\item{timeTrain}{Vector of values of the periodic variable for training observations,
where 0 corresponds to the lowest possible value and 1 corresponds to the highest
possible value.}

\item{xTest}{Matrix of measurements for test data, observations in rows
and features in columns.}

\item{spcResult}{Result from \code{zeitzeigerSpc}.}

\item{fitMeanArgs}{List of arguments to pass to \code{bigspline} for fitting mean of each SPC.}

\item{constVar}{Logical indicating whether to assume constant variance as a function
of the periodic variable.}

\item{fitVarArgs}{List of arguments to pass to \code{bigspline} for fitting variance of each SPC.
Unused if \code{constVar==TRUE}.}

\item{nSpc}{Vector of the number of SPCs to use for prediction. If \code{NA} (default),
\code{nSpc} will become \code{1:K}, where \code{K} is the number of SPCs in \code{spcResult}.
Each value in \code{nSpc} will correspond to one prediction for each test observation.
A value of 2 means that the prediction will be based on the first 2 SPCs.}

\item{betaSv}{Logical indicating whether to use the singular values of the SPCs
as weights in the likelihood calculation.}

\item{timeRange}{Vector of values of the periodic variable at which to calculate likelihood.
The time with the highest likelihood is used as the initial value for the MLE optimizer.}
}
\value{
\item{timeDepLike}{3-D array of likelihood, with dimensions for each test observation,
each element of \code{nSpc}, and each element of \code{timeRange}.}
\item{mleFit}{List (for each element in \code{nSpc}) of lists (for each test observation)
of \code{mle2} objects.}
\item{timePred}{Matrix of predicted times for test observations by values of \code{nSpc}.}
}
\description{
\code{zeitzeigerPredict} predicts the value of the periodic variable
for test observations, given training data and SPCs. This function
calls \code{\link[bbmle]{mle2}}.
}
\seealso{
\code{\link{zeitzeigerFit}}, \code{\link{zeitzeigerSpc}}
}
