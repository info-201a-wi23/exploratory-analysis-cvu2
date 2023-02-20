library(ggplot2)
library(dplyr)

medical_data <- read.csv("https://raw.githubusercontent.com/stedy/Machine-Learning-with-R-datasets/master/insurance.csv")

ggplot(medical_data, aes(x=age, y=charges, color=smoker, shape=smoker)) +
  geom_point()+
  geom_smooth(method=lm, se=FALSE, fullrange=TRUE)+
  ggtitle("Whether people smoke can be an indicator \n for the amount of charges")
