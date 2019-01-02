## ----setup, echo = FALSE-------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(
  purl = NOT_CRAN,
  eval = NOT_CRAN,
  fig.align = "center",
  comment = "#> "
)
library(diskers)

## ----listkernels---------------------------------------------------------
kernels()

## ---- results = 'hold'---------------------------------------------------
kern_gaussian(4, 3)
kern_exponential(4, 3)
#
kern_2Dt(4, 3, 2)
kern_exponential_power(4, 3, 2)
kern_lognormal(4, 3, 2)

## ---- results = 'hold'---------------------------------------------------
meanDispDist('gaussian', 3)
meanDispDist('exponential', 3)
meanDispDist('lognormal', 3, 2)
meanDispDist('k2Dt', 3, 2)
meanDispDist('exponential_power', 3, 2)
meanDispDist('lognormal', 3, 2)

## ---- fig.width = 6, fig.height = 6--------------------------------------
seqx <- seq(0, 10, 0.001)
par(las = 1, bty = 'L')
plot(seqx, kern_gaussian(seqx, .5), type='l', lwd=2, col='#0366d6', xlab='Distance', ylab='Density')

## ----  fig.width = 6,  fig.height = 6------------------------------------
par(las = 1, bty = 'l')
plot(seqx, kern_lognormal(seqx, 3, .2), type='l', lwd=2, col='#0366d6', xlab='Distance', ylab='Density')

## ---- fig.width = 6, fig.height = 6--------------------------------------
par(las = 1, bty = 'l')
plot(seqx, kern_exponential_power(seqx,2,3), type='l', lwd=2, col='#0366d6', xlab='Distance', ylab='Density')

