library(recruitR)
context("Test mean Dispersal kernel")


p2 <- 2*pi
sc <- 1
sh <- 2
res1 <- integrate(function(x) x*x*kern_gaussian(x,sc), 0, Inf)$value*p2
res2 <- integrate(function(x) x*x*kern_exponential(x,sc), 0, Inf)$value*p2
res3 <- integrate(function(x) x*x*kern_exponential_power(x,sc,sh), 0, Inf)$value*p2
res4 <- integrate(function(x) x*x*kern_2Dt(x,sc,sh), 0, Inf)$value*p2
res5 <- integrate(function(x) x*x*kern_lognormal(x,sc,sh), 0, Inf)$value*p2


test_that("checking integration", {
  expect_equal(round(res1, 4L), round(meanDispDist("gaussian", scal=sc),4))
  expect_equal(round(res2, 4L), round(meanDispDist("exponential", scal=sc),4))
  expect_equal(round(res3, 4L), round(meanDispDist("exponential_power", scal=sc, shap=sh),4))
  expect_equal(round(res4, 4L), round(meanDispDist("k2Dt", scal=sc, shap=sh),4))
  expect_equal(round(res5, 2L), round(meanDispDist("lognormal", scal=sc, shap=sh),2))
})

# test_that("checking errors", {
#   expect_error(kern_gaussian(0, 0))
#   expect_error(kern_exponential(0, 0))
#   expect_error(fkern_exponential_power(0, 0, 2))
#   expect_error(kern_2Dt(0, 0, 2))
#   expect_error(kern_lognormal(0, 0, 2))
# })
#
