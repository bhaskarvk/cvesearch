#' Gets details of a CVE
#'
#' @param cveid character string.
#' @param endpoint URL
#' @return The details of \code{cveid}.
#' @examples
#' getCVE("CVE-2010-3333")
#' @export
getCVE <- function(cveid, endpoint='http://cve.circl.lu/api/cve/') {
  h <- httr::GET(sprintf('%s%s',endpoint,cveid))
  httr::stop_for_status(h)
  httr::content(h,as='parsed', type='application/json')
}

#' Gets a list of latest CVEs
#'
#' @param endpoint URL
#' @return A list of latest CVEs
#' @examples
#' getLatestCVEs()
#' @export
getLatestCVEs <- function(endpoint='http://cve.circl.lu/api/last') {
  h <- httr::GET(endpoint)
  httr::stop_for_status(h)
  httr::content(h,as='parsed', type='application/json')
  resp <- httr::content(h,as='parsed', type='application/json')
  resp$results
}

#' Gets a list of CVE vendors
#'
#' @param endpoint URL
#' @return A list of CVE vendors
#' @examples
#' getCVEVendors()
#' @export
getCVEVendors <- function(endpoint='http://cve.circl.lu/api/browse') {
  h <- httr::GET(endpoint)
  httr::stop_for_status(h)
  httr::content(h,as='parsed', type='application/json')
  resp <- httr::content(h,as='parsed', type='application/json')
  unlist(resp$vendor)
}

#' Gets a list of vendor products
#'
#' @param vendor character string
#' @param endpoint URL
#' @return A list of products for \code{vendor}
#' @examples
#' getVendorProducts('microsoft')
#' @export
getCVEProducts <- function(vendor,endpoint='http://cve.circl.lu/api/browse') {
  h <- httr::GET(sprintf('%s/%s',endpoint,vendor))
  httr::stop_for_status(h)
  resp <- httr::content(h,as='parsed', type='application/json')
  unlist(resp$product)
}

#' Gets a list of CVEs for given vendor/product combo
#'
#' @param vendor character string
#' @param product character string
#' @param endpoint URL
#' @return A list of CVEs for given vendor/product combo
#' @examples
#' getCVEs("microsoft", "office")
#' @export
getCVEs <- function(vendor, product, endpoint='http://cve.circl.lu/api/search') {
  h <- httr::GET(sprintf('%s/%s/%s',endpoint, vendor, product))
  httr::stop_for_status(h)
  httr::content(h,as='parsed', type='application/json')
}

#' Gets information about CVE database
#'
#' @param endpoint URL
#' @return  information about CVE database
#' @examples
#' getCVEDBInfo()
#' @export
getCVEDBInfo <- function(endpoint='http://cve.circl.lu/api/dbInfo') {
  h <- httr::GET(endpoint)
  httr::stop_for_status(h)
  httr::content(h,as='parsed', type='application/json')
}
