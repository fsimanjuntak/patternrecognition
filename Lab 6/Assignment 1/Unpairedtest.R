library(dplyr)

non_smoke = c(18,22,21,17,20,17,23,20,22,21)
smoke = c(16,20,14,21,20,18,13,15,17,21)


t.test(non_smoke,  smoke,  alternative = c("greater"),paired = FALSE, var.equal = FALSE,
       conf.level = 0.95)