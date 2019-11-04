testdf <- data.frame("word" = c("atemlos"), "freq" = 4)
dat <- head(d, n=1)
test_that("atemlos 4", {expect_identical(dat, testdf)})