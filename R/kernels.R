#' Kernels functions
#'
#' Common seeds isotropic dispersal kernels.
#'
#' @author
#' Kevin Cazelles
#'
#' @param distance: a real positive number giving the dispersal distance.
#' @param scal: scale parameter a real positive number giving the shape parameter of the Kernel.
#' @param shap: shape parameter a real positve number used as the power of the kernel.
#' @param opt: a real positive number related with the optimal sistance for dispersion.
#'
#' @examples
#' seqx <- seq(0,10,0.001)
#' plot(seqx, kern_lognormal(seqx,3,.2), type='l')


#' @describeIn kernels Gaussian kernel.
#' @export
kern_gaussian <- function(dist, scal) {
    stopifnot(dist >= 0 & scal > 0)
    scal2 <- scal * scal
    return(1/(pi * scal2) * exp(-(dist * dist)/scal2))
}


#' @describeIn kernels Exponential kernel.
#' @export
kern_exponential <- function(dist, scal) {
    stopifnot(dist >= 0 & scal > 0)
    return(1/(2 * pi * scal * scal) * exp(-dist/scal))
}


#' @describeIn kernels Dispersal kernels from the exponential-power family.
#' @export
kern_exponentiel_power <- function(dist, scal, shap) {
    stopifnot(dist >= 0 & scal > 0 & shap > 0)
    gam <- gamma(2/shap)
    return(shap/(2 * pi * scal * scal * gam) * exp(-(dist/scal)^shap))
}


#' @describeIn kernels 2Dt kernel.
#' @export
kern_2Dt <- function(dist, scal, shap) {
    stopifnot(dist >= 0 & scal > 0 & shap > 1)
    scal2 <- scal * scal
    return((shap - 1)/(pi * scal2) * (1 + dist * dist/scal2)^-shap)
}

#' @describeIn kernels Lognormal kernel.
#' @export
kern_lognormal <- function(dist, scal, shap) {
    stopifnot(dist >= 0 & scal > 0 & shap > 0)
    pipi <- 2 * pi
    cst <- 1/(pipi * sqrt(pipi) * shap * dist * dist)
    return(cst * exp(-(0.5 * log(dist/scal) * log(dist/scal))/(shap * shap)))
}
