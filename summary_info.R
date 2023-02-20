library(tidyverse)
library(dplyr)
insurance_data <- read.csv('https://raw.githubusercontent.com/stedy/Machine-Learning-with-R-datasets/master/insurance.csv')
summary_info <- list()
summary_info$num_observations <- nrow(insurance_data)
summary_info$max_average_charge_region <- insurance_data %>%
  group_by(region) %>%
  summarize(average_charges = round(mean(charges),0)) %>%
  filter(average_charges == max(average_charges, na.rm = T)) %>%
  select(region,average_charges)
summary_info$max_average_charge_sex <- insurance_data %>%
  group_by(sex) %>%
  summarize(average_charges = round(mean(charges),0)) %>%
  filter(average_charges == max(average_charges, na.rm = T)) %>%
  select(sex, average_charges)
summary_info$max_average_charge_smoker <- insurance_data %>%
  group_by(smoker) %>%
  summarize(average_charges = round(mean(charges),0)) %>%
  filter(average_charges == max(average_charges, na.rm = T)) %>%
  select(smoker,average_charges)
summary_info$max_average_charge_children <- insurance_data %>%
  group_by(children) %>%
  summarize(average_charges = round(mean(charges),0)) %>%
  filter(average_charges == max(average_charges, na.rm = T)) %>%
  select(children,average_charges)


insurance_data <- insurance_data %>% mutate(rounded_age = round((age / 10), 0))
insurance_data <- insurance_data %>% mutate(age_scope = paste0((round((age / 10), 0) * 10 - 5), "~", round((age / 10), 0) * 10 + 4))

summary_info$max_average_charge_age <- insurance_data %>%
  group_by(age_scope) %>% 
  summarize(average_charges = round(mean(charges),0)) %>%
  filter(average_charges == max(average_charges, na.rm = T)) %>%
  select(age_scope,average_charges)

