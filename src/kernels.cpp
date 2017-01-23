#include <Rcpp.h>
using namespace Rcpp;

#define PIPI_m3_2 0.0634936359342409697857 /*1/((2*pi)^3/2)*/

//' @name kernels
//' @title Common seed isotropic dispersal kernels.
//' @description This is a set of five disersal kernel commonly used to model seeds dispersal.
//'
//' @author
//' Kevin Cazelles
//'
//' @param dist a real positive number giving the dispersal distance.
//' @param scal a real positive number giving the scale parameter of the kernel.
//' @param shap a real positive number giving the shape parameter of the kernel.
//'
//' @return The pdf values at distance \code{dist}.
//'
//' @examples
//' seqx <- seq(0,10,0.01)
//' plot(seqx, kern_lognormal(seqx,3,.2), type='l')
//' @references
//' Nathan, R., Klein, E., Robledo-Arnuncio, J.J. and Revilla, E. (2012)
//' Dipsersal Kernels: Review in _Dispersal Ecology and Evolution_. Oxford University Press.
//' @export
// [[Rcpp::export]]
int kernels() {
  Rcpp::Rcout << std::endl << "Available kernels are:" << std::endl;
  Rcpp::Rcout << "kern_gaussian()" << std::endl;
  Rcpp::Rcout << "kern_exponential()" << std::endl;
  Rcpp::Rcout << "kern_exponential_power()" << std::endl;
  Rcpp::Rcout << "kern_2Dt()" << std::endl;
  Rcpp::Rcout << "kern_lognormal()" << std::endl;
  return(0);
}

//' @describeIn kernels Exponential kernel.
//' @export
// [[Rcpp::export]]
NumericVector kern_gaussian(NumericVector dist, double scal) {
    if (scal <= 0.0) {
      stop("Inadmissible value for scale prameter");
    }
    int i;
    double scal2 = scal*scal;
    NumericVector pdfval(dist.size());
    for (i=0; i<dist.size(); i++){
      pdfval[i] = M_1_PI * 1/scal2 * exp(-(dist[i] * dist[i])/scal2);
    }
    return(pdfval);
}


//' @describeIn kernels Exponential kernel.
//' @export
// [[Rcpp::export]]
NumericVector kern_exponential(NumericVector dist, double scal) {
    if (scal <= 0.0) {
      stop("Inadmissible value for scale prameter");
    }
    int i;
    NumericVector pdfval(dist.size());
    for (i=0; i<dist.size(); i++){
      pdfval[i] = .5*M_1_PI*1/(scal*scal) * exp(-dist[i]/scal);
    }
    return(pdfval);
}
//
//' @describeIn kernels Dispersal kernels from the exponential-power family.
//' @export
// [[Rcpp::export]]
NumericVector kern_exponential_power(NumericVector dist, double scal, double shap) {
  if (scal <= 0.0) {
    stop("Inadmissible value for scale prameter");
  }
  if (shap <= 0.0) {
    stop("Inadmissible value for shape prameter");
  }
  int i;
  NumericVector pdfval(dist.size());
  for (i=0; i<dist.size(); i++){
    pdfval[i] = .5*shap*M_1_PI*1/(scal*scal*tgamma(2/shap))*exp(-(pow(dist[i]/scal,shap)));
  }
  return(pdfval);
}
//
//' @describeIn kernels 2Dt kernel.
//' @export
// [[Rcpp::export]]
NumericVector kern_2Dt(NumericVector dist, double scal, double shap) {
  if (scal <= 0.0) {
    stop("Inadmissible value for scale prameter");
  }
  if (shap <= 1.0) {
    stop("Inadmissible value for shape prameter");
  }
  int i;
  double scal2 = scal * scal;
  NumericVector pdfval(dist.size());
  for (i=0; i<dist.size(); i++){
    pdfval[i] = (shap - 1)/(M_PI * scal2) * pow(1 + dist[i] * dist[i]/scal2, -shap);
  }
  return(pdfval);
}
//' @describeIn kernels Lognormal kernel.
//' @export
// [[Rcpp::export]]
NumericVector kern_lognormal(NumericVector dist, double scal, double shap) {
    if (scal <= 0.0) {
      stop("Inadmissible value for scale prameter");
    }
    if (shap <= 0.0) {
      stop("Inadmissible value for shape prameter");
    }
    int i;
    double shapinv = 1/shap;
    NumericVector pdfval(dist.size());
    for (i=0; i<dist.size(); i++){
      pdfval[i] = PIPI_m3_2*shapinv*1/(dist[i]*dist[i])*exp(-.5*shapinv*shapinv*(log(dist[i])-log(scal))*(log(dist[i])-log(scal)));
    }
    return(pdfval);
}
