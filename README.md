# Search CVEs from R

A simple wrapper around CVE search APIs provided by [CIRCL](https://www.circl.lu/services/cve-search/).
By default uses the REST API Endpoint `http://cve.circl.lu/api`, but you can run your own cvesearch using this [code](https://github.com/cve-search/cve-search).

## Examples

```r
devtools::install_github('bhaskarvk/cvesearch')
library(cvesearch)
getLatestCVEs()
getCVEVendors()
getCVEProducts('microsoft')
getCVEs('microsoft','office')

# To pass your own endpoint url, use the endpoint argument
getLatestCVEs(endpoint='<Your-custom-URL>') 
```

## NOTEs

For now there is hardly any post processing done on the response. So in most cases you get a parsed JSON i.e. a list (of lists / scalars / vectors).

## CHANGE LOG


2016-02-26: 0.1.0 - First Release.
