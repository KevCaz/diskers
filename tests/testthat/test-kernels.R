library(recruitR)
context("Test kernels")


p2 <- 2*+pi
res1 <- integrate(function(x) x*kern_gaussian(x,2), 0, Inf)$value*p2
res2 <- integrate(function(x) x*kern_exponential(x,2), 0, Inf)$value*p2
res3 <- integrate(function(x) x*kern_exponential_power(x,2,3), 0, Inf)$value*p2
res4 <- integrate(function(x) x*kern_2Dt(x,2,3), 0, Inf)$value*p2
res5 <- integrate(function(x) x*kern_lognormal(x,2,4), 0, Inf)$value*p2


test_that("checking integration", {
  expect_equal(round(res1, 4), 1)
  expect_equal(round(res2, 4), 1)
  expect_equal(round(res3, 4), 1)
  expect_equal(round(res4, 4), 1)
  expect_equal(round(res5, 4), 1)
})

test_that("checking errors", {
  expect_error(kern_gaussian(0, 0))
  expect_error(kern_exponential(0, 0))
  expect_error(kern_exponential_power(0, 0, 2))
  expect_error(kern_2Dt(0, 0, 2))
  expect_error(kern_lognormal(0, 0, 2))
})

test_that("checking list of kernels", {
  expect_equal(kernels(), 0)
})
