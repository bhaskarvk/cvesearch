% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cvesearch.R
\name{getCVE}
\alias{getCVE}
\title{Gets details of a CVE}
\usage{
getCVE(cveid, endpoint = "http://cve.circl.lu/api/cve/")
}
\arguments{
\item{cveid}{character string.}

\item{endpoint}{URL}
}
\value{
The details of \code{cveid}.
}
\description{
Gets details of a CVE
}
\examples{
getCVE("CVE-2010-3333")
}

