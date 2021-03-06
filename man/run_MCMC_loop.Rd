% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mcmc.R
\name{run_MCMC_loop}
\alias{run_MCMC_loop}
\title{Wrapper to run multiple parallel MCMC chains until convergence}
\usage{
run_MCMC_loop(
  startTab,
  data,
  mcmcPars,
  filenames,
  CREATE_POSTERIOR_FUNC,
  mvrPars,
  PRIOR_FUNC,
  seed,
  run_parallel = FALSE
)
}
\arguments{
\item{startTab}{the parameter table controlling information 
such as bounds, initial values etc.
Because the different chains have different initial values, this is a list 
where each element is of the form of parTab in run_MCMC, but the
values column has different starting values.
startTab is actually a list of n of these where n is the number of parallel chains}

\item{data}{the data frame of data to be fitted}

\item{mcmcPars}{named vector with parameters for the MCMC procedure. 
mandatory: iterations, popt, opt_freq, thin, burnin, adaptive_period, save_block
optional: max_total_iterations, max_adaptive_period, adaptiveLeeway}

\item{filenames}{character vector:
the full filepaths at which the parallel MCMC chains should be saved. 
"_chain.csv" will be appended to the end of this, 
so filenames should have no file extensions
the length of filenames will be the number of parallel chains run.}

\item{CREATE_POSTERIOR_FUNC}{pointer to posterior function creator used to 
calculate a likelihood. See the main example - 
this should return your likelihood function (that only takes a single vector 
of parameters as an argument).}

\item{mvrPars}{a list of parameters if using a multivariate proposal. 
Must contain an initial covariance matrix, weighting for adapting cov matrix,
 and an initial scaling parameter (0-1)
mvrPars is acutally a list of n of these where n is the number of parallel chains}

\item{PRIOR_FUNC}{user function of prior for model parameters. 
Should take values, names and local from param_table}

\item{run_parallel}{logical vector of length 1. If TRUE, run in parallel on cluster}
}
\value{
a list with: 1) convergence diagnostics; 2) the output from run_MCMC
(the first loop around)
}
\description{
Runs run_MCMC, calculates convergence diagnostics, 
repeats until convergence or maximum number of iterations reached
currently only works for univariate proposals
}
