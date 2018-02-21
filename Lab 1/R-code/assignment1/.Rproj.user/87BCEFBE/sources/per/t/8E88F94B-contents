library(dplyr)
library(GGally)
library(lmodel2)
library(tidyverse)

df <- read.csv(file = "data.csv",header = TRUE)

newdf <- df %>% select(weight, age, height) %>% filter(age <40)


ggpairs(newdf[,c("weight", "age", "height")])

 
z = lm(weight~age, data=df)
#plot them
ggplot(newdf, aes(x=age, y=weight)) + geom_point() +     
  geom_abline(intercept = z$coefficients[1], 
              slope = z$coefficients[2])