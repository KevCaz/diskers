    ## Loading recruitR

Last 'README' update: 2016-11-20

![Travis](https://travis-ci.org/KevCaz/recruitR.svg?branch=master)
![Build
status](https://ci.appveyor.com/api/projects/status/sk3sbvusvcyy0at0?svg=true)
![codecov](https://codecov.io/gh/KevCaz/graphicsutils/branch/master/graph/badge.svg)

Installation
============

To get the current development version from Github, use the
[*devtools*](http://cran.r-project.org/web/packages/devtools/index.html)
package.

    if (!require("devtools'")) install.packages("devtools")
    devtools::install_github("KevCaz/recruitR")
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
