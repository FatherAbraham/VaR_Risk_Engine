##pre-requisite packages

require("quantmod")
require(PerformanceAnalytics)


portfolio <- c("AA", "AXP", "BA", "BAC", "CAT", "CSCO")
begin <- Sys.Date() - 252 ## doesn't actually get 252 entries so the logic here needs improving
end <- Sys.Date()   ## we can just use the last(dataset, 252) function, once we have a large enough dataset
tickers <- getSymbols(portfolio, from = begin, to = end, auto.assign = TRUE)

dataset <- Ad(get(tickers[1]))

##for AA
dataset_AA <- dataset[,1]

##calculate returns

##could probebly do with turning into percentage....
returns_AA <- Return.calculate(dataset_AA, method=c("simple"))

##show timeseries using quantmod package
chartSeries(returns_AA)

##from Performance Analytics, plot histogram
chart.Histogram(returns_AA, methods = c("add.risk"))
chart.VaRSensitivity(returns_AA)

##next step, look for the 5th percentile, 95% of the time we don't lose more than this
##doesn't tell us about the magnitude of our loss (consult the essay)

##sort returns by gain, order descending

returns_AA.m <- as.matrix(returns_AA)
sorted <- returns_AA.m[order(returns_AA.m[,1])]

##calculate the 95% percentile <- Double-check this!
quantile(returns_AA.m[order(returns_AA.m[,1])], c(.95), na.rm=TRUE)


##different resultset from above

## what about skew and kurtosis






##do I need to merge the Adjusted Closed, I want to be able to sort....

for (i in 2:length(tickers)) {
dataset <- merge(dataset, Ad(get(tickers[i])))
}



