library("dplyr")
library("stringr")
library("ggplot2")
library("scales")



num_children <- Insurance_df %>% group_by(children) %>% summarize(num = n())

pie_chart <- ggplot(data = num_children, aes(x="", y= num, fill=factor(children))) + 
  geom_bar(width = 1, stat = "identity") +
  coord_polar("y", start=0) +
  ggtitle("Distribution of demographics with the number of children") + 
  scale_fill_manual(values = c("#005fad", "#6fa5fc", "#a3c6ff", "#bad4ff", "#e3ecfa", "#f2f5fa"))