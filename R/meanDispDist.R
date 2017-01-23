#' @name meanDispDist
#' @title Mean Dispersal Ditances
#' @description Mean dispersal distance for five disersal kernel commonly used to model seeds dispersal.
#'
#' @author
#' Kevin Cazelles
#'
#' @param name a character names of the dispersal kernel chosen.
#' @param scal a real positive number giving the scale parameter of the kernel.
#' @param shap a real positive number giving the shape parameter of the kernel.
#'
#' @details
#' Currently valid names are \code{gaussian}, \code{exponential},
#' \code{exponential_power}, \code{k2Dt} and \code{lognormal}.
#'
#' @return The mean dispersal distance.
#'
#' @examples
#' seqx <- seq(0,10,0.01)
#' plot(seqx, kern_lognormal(seqx,3,.2), type='l')
#' @references
#' Nathan, R., Klein, E., Robledo-Arnuncio, J.J. and Revilla, E. (2012) 
#' Dipsersal Kernels: Review in _Dispersal Ecology and Evolution_. Oxford University Press.
#' @export
meanDispDist <- function(name, scal, shap = NULL) {
    switch(name, gaussian = meanDispDist_gaussian(scal = scal), exponential = meanDispDist_exponential(scal = scal), 
        exponential_power = meanDispDist_exponential_power(scal = scal, shap = shap), 
        k2Dt = meanDispDist_2Dt(scal = scal, shap = shap), lognormal = meanDispDist_lognormal(scal = scal, 
            shap = shap))
}

#' @describeIn kernels Exponential kernel.
#' @export
meanDispDist_gaussian <- function(dist, scal) {
    0.5 * scal * sqrt(pi)
}

#' @describeIn kernels Exponential kernel.
#' @export
meanDispDist_exponential <- function(dist, scal) {
    2 * scal
}

#' @describeIn kernels Dispersal kernels from the exponential-power family.
#' @export
meanDispDist_exponential_power <- function(dist, scal, shap) {
    stopifnot(!is.null(shap))
    scal * gamma(3/shap)/gamma(2/shap)
}

#' @describeIn kernels 2Dt kernel.
#' @export
meanDispDist_2Dt <- function(dist, scal, shap) {
    stopifnot(!is.null(shap))
    if (shap < 1.5) {
        out <- Inf
    } else {
        out <- 0.5 * scal * sqrt(pi) * gamma(shap - 1.5)/gamma(shap - 1)
    }
    return(out)
}

#' @describeIn kernels Lognormal kernel.
#' @export
meanDispDist_lognormal <- function(dist, scal, shap) {
    stopifnot(!is.null(shap))
    scal * exp(0.5 * shap * shap)
}
