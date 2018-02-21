library(ggplot2)
library(knitr)

# create a series of x values
xvals = seq(0, 100, 0.01)

plot(pnorm(xvals, mean=4, sd=2), pnorm(xvals, mean=2, sd=2), xlim = c(0, 1), ylim = c(0, 1), type = "l",  xlab = "false alarm", ylab = "hit", col = 'blue')
abline(0, 1, col= "black")
lines(pnorm(xvals, mean=6, sd=2), pnorm(xvals, mean=2, sd=2), col='green')
lines(pnorm(xvals, mean=5, sd=2), pnorm(xvals, mean=2, sd=2), col='red')
lines(pnorm(xvals, mean=8, sd=2), pnorm(xvals, mean=2, sd=2), col='yellow')
points(0.045,0.44, cex=4,pch=16,col="red")
legend("topleft", legend = c("d1","d1.5","d2","d3") , pch = 15, bty = 'n', col = c("blue",'red',"green",'yellow'))

