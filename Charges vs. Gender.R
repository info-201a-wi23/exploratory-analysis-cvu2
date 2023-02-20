ins_df <- read.csv("~/Desktop/INFO201/exploratory-analysis-cvu2/insurance.csv", stringsAsFactors = FALSE)

library("ggplot2")
library("scales")
library("dplyr")

mean_charges <- ins_df %>% 
  group_by(children) %>% 
  summarise(charges = mean(charges))

ggplot(data = mean_charges)+
  geom_col(aes(x = children, y = charges, fill = children)) +
  scale_x_continuous(breaks = seq(0,5,1))+
  scale_y_continuous(labels = label_number_si()) +
  ggtitle("Average Charges in Relation to Amount of Children")
  