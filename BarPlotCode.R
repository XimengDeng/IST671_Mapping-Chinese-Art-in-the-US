library(tidyverse)
library(httr)
library(ggplot2)


url <- "https://docs.google.com/spreadsheets/d/1HzemHEQdIYgomtxlhEZtfs3DjjU9Bj-rh9_T5Qoe0rQ/export?format=csv&id=1HzemHEQdIYgomtxlhEZtfs3DjjU9Bj-rh9_T5Qoe0rQ&gid=0"
data <- read.csv(url)


data$NumberCollections[is.na(data$NumberCollections)] <- 0
data$NumberOnView[is.na(data$NumberOnView)] <- 0

data$NotOnView <- data$NumberCollections - data$NumberOnView

ggplot(data, aes(x = reorder(Museum, -NumberCollections))) +  
  geom_bar(aes(y = NumberCollections), stat = "identity", fill = "steelblue") +
  geom_bar(aes(y = NumberOnView), stat = "identity", fill = "lightblue") +
  labs(title = "Museum Collections and On View Items") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 6))  

