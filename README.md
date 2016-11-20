    ## Loading recruitR

Last 'README' update: 2016-11-19

[![Travis](https://travis-ci.org/KevCaz/graphicsutils.svg?branch=master)](https://travis-ci.org/KevCaz/recruitr)
[![Build
status](https://ci.appveyor.com/api/projects/status/sk3sbvusvcyy0at0?svg=true)](https://ci.appveyor.com/project/KevCaz/recruitr)
[![codecov](https://codecov.io/gh/KevCaz/graphicsutils/branch/master/graph/badge.svg)](https://codecov.io/gh/KevCaz/graphicsutils)

Installation
============

To get the current development version from Github, use the
[*devtools*](http://cran.r-project.org/web/packages/devtools/index.html)
package.

    if (!require("recruitR'")) install.packages("recruitR'")
    devtools::install_github("KevCaz/recruitR'")
    library(recruitR)

Seeds dispersal kernels
=======================

I picked up 5 common seeds dispersal kernel in:

1.  Nathan, R., Klein, E., Robledo-Arnuncio, J. J. & Revilla, E. in
    Dispersal Ecology and Evolution 186–210 (Oxford University
    Press, 2012).
    [doi:10.1093/acprof:oso/9780199608898.003.0015](https://doi.org/10.1093/acprof:oso/9780199608898.003.0015)

<!-- -->

    seqx <- seq(0,10,0.001)
    kern_gaussian(seqx, .5)
    plot(seqx, kern_gaussian(seqx, .5), type='l')
    plot(seqx, kern_lognormal(seqx, 3, .2), type='l')
    plot(seqx, kern_exponentiel_power(seqx,2,3), type='l')
