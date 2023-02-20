library(tidyverse)
library(dplyr)
insurance_data <- read.csv('https://raw.githubusercontent.com/stedy/Machine-Learning-with-R-datasets/master/insurance.csv')
insurance_data2 <- subset(insurance_data, select = c(region, charges))
region_table <-insurance_data2 %>% 
  group_by(region) %>% 
  summarize(average_charges = round(mean(charges),0))

region_table <- region_table%>% arrange(desc(average_charges))


view(region_table)
