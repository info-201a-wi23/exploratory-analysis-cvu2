library(ggplot2)
library(dplyr)

medical_data <- read.csv("/Users/yanjiarui/Desktop/insurance.csv")

charge_children <- medical_data %>% group_by(children) %>%
  summarise(charges = mean(charges))

ggplot(charge_children, aes(children, charges, fill = children)) + 
  geom_col() + 
  ggtitle("Relationship between charges and numbers of children")

