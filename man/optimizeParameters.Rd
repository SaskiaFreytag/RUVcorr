% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/optimizeParameters.R
\name{optimizeParameters}
\alias{optimizeParameters}
\title{Optimize parameters of removal of unwanted variation.}
\usage{
optimizeParameters(
  Y,
  kW.hat = seq(5, 25, 5),
  nu.hat = c(0, 10, 100, 1000, 10000),
  nc_index,
  methods = c("all", "fnorm", "wrong.sign"),
  cpus = 1,
  parallel = FALSE,
  check.input = FALSE
)
}
\arguments{
\item{Y}{An object of the class \code{simualteGEdata}.}

\item{kW.hat}{A vector of integers for \code{kW} in \code{RUVNaiveRidge}.}

\item{nu.hat}{A vector of values for \code{nu} in \code{RUVNaiveRidge}.}

\item{nc_index}{A vector of indices of the negative controls 
used in \code{RUVNaiveRidge}.}

\item{methods}{The method used for quality assessment; 
if \code{method="fnorm"} the squared Frobenius norm is used;
if \code{method="wrong.sign"} the percentage of wrongly 
estimated signs is calculated if \code{method="all"}
both are calculated.}

\item{cpus}{A number specifiying how many workers to use for parallel computing.}

\item{parallel}{Logical: if \code{TRUE} parallel computing is used.}

\item{check.input}{Logical; if \code{TRUE} all input is checked; 
not advisable for large simulations.}
}
\value{
\code{optimizeParameters} returns output of the class 
\code{optimizeParameters}.
An object of class \code{optimizeParameters} is a list containing the
 following components:
  \describe{
    \item{\code{All.results}}{A matrix of output of the quality assessment for all combinations of input parameters.}
    \item{\code{Compare.raw}}{A vector of the quality assessment for the uncorrected data.}
    \item{\code{Optimal.parameter}}{A matrix or a vector giving the optimal parameter combination.}
  }
}
\description{
\code{optimizeParameters} returns the optimal parameters to be 
used in the removal of unwanted variation procedure when using simulated data.
}
\details{
The simulated data is cleaned using removal of unwanted variation with all 
combinations of the input parameters. The quality of each cleaning is judged by the
Frobenius Norm of the correlation as estimated from the cleaned data and the known data
or the percentage of correlations with estimated to have the wrong sign.
}
\examples{
Y<-simulateGEdata(500, 500, 10, 2, 5, g=NULL, Sigma.eps=0.1, 
250, 100, intercept=FALSE, check.input=FALSE)
opt<-optimizeParameters(Y, kW.hat=c(1,5,10), nu.hat=c(100,1000), nc_index=251:500, 
methods=c("fnorm"), cpus=1, parallel=FALSE, check.input=TRUE)
opt
}
\seealso{
\code{\link{assessQuality}}, \code{\link{RUVNaiveRidge}}, 
\code{\link{funcPara}}
}
\author{
Saskia Freytag
}
