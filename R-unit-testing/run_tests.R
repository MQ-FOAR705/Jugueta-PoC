install.packages("testthat")
library(testthat)
source("script.R")
test_results <- test_dir("test_script.R", reporter="summary")
