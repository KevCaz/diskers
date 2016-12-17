Overview
========

Description
-----------

**'recruitR'**: A R package including useful functions for tree recruitment analyses.

At this stage, I have simply I picked up 5 common seeds dispersal kernel in which all are isotropic:

1.  Nathan, R., Klein, E., Robledo-Arnuncio, J. J. & Revilla, E. in Dispersal Ecology and Evolution 186–210 (Oxford University Press, 2012). [doi:10.1093/acprof:oso/9780199608898.003.0015](https://doi.org/10.1093/acprof:oso/9780199608898.003.0015)

<!-- -->

    ## Loading recruitR

    ## Warning in setup_ns_exports(pkg, export_all): Objects listed as exports,
    ## but not present in namespace: kernels

Current statut
--------------

Last 'README' update: 2016-12-16

[![Travis](https://travis-ci.org/KevCaz/recruitR.svg?branch=master)](https://travis-ci.org/KevCaz/recruitR) [![Build status](https://ci.appveyor.com/api/projects/status/sk3sbvusvcyy0at0?svg=true)](https://ci.appveyor.com/project/KevCaz/recruitr/build/1.0.7) [![codecov](https://codecov.io/gh/KevCaz/recruitR/branch/master/graphs/badge.svg)](https://codecov.io/gh/KevCaz/recruitR)

Using the package
=================

Installation
------------

To get the current development version from Github using R, use the [*devtools*](http://cran.r-project.org/web/packages/devtools/index.html) package:

``` r
if (!require("devtools'")) install.packages("devtools")
devtools::install_github("KevCaz/recruitR")
library(recruitR)
```

Examples
--------

### Using a kernel

A simple call to one on the kernel:

``` r
kern_gaussian(4, 3)
#> [1] 0.005977623
```

Simple plots:

1.  Gaussian kernel:

``` r
seqx <- seq(0,10,0.001)
plot(seqx, kern_gaussian(seqx, .5), type='l')
```

![](inst/unnamed-chunk-3-1.png)

1.  Log\_normal kernel:

``` r
plot(seqx, kern_lognormal(seqx, 3, .2), type='l')
```

![](inst/unnamed-chunk-4-1.png)

1.  Exponential\_powerl kernel:

``` r
plot(seqx, kern_exponential_power(seqx,2,3), type='l')
```

![](inst/unnamed-chunk-5-1.png)
