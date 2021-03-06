% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{quantitative_scenarios}
\alias{quantitative_scenarios}
\title{Information security risk scenarios}
\format{An object of class \code{tbl_df} (inherits from \code{tbl}, \code{data.frame}) with 56 rows and 17 columns.}
\usage{
quantitative_scenarios
}
\description{
A dataset of quantified information security risk scenarios, with parameters
describing the distribution of each input.
}
\details{
\describe{
  \item{scenario}{full text description of the risk scenario}
  \item{scenario_id}{id of the scenario, primary key}
  \item{tcomm}{full text name of threat community}
  \item{domain_id}{domain abbreviation}
  \item{controls}{comma seperated list of control ids that apply to this scenario}
  \item{lm_l}{loss magnitude - low}
  \item{lm_ml}{loss magnitude - most likely}
  \item{lm_h}{loss magnitude - high}
  \item{lm_conf}{loss magnitude - confidence}
  \item{tc_l}{threat capability - low}
  \item{tc_ml}{threat capability - most likely}
  \item{tc_h}{threat capability - high}
  \item{tc_conf}{threat capability - confidence}
  \item{tef_l}{threat event frequency - low}
  \item{tef_ml}{threat event frequency - most likely}
  \item{tef_h}{threat event frequency - high}
  \item{tef_conf}{threat event frequency - confidence}
}
}
\keyword{datasets}
