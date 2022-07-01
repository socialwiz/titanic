#loading required libraries

#install.package(tidyverse)
library(dplyr)
library(tidyverse)

# Getting the dataset

data("Titanic")
str(Titanic)

#summarizing the dataset
summary("Titanic")

# Calculate the survival rates of passengers by class and gender with the command margin.table
margin.table(Titanic,4)
margin.table(Titanic,2)

#Plot the survival rate of passangers by crew and class. 
barplot(margin.table(Titanic,4))
barplot(margin.table(Titanic,1))

#Plot the survival rates of passengers and crew by class. Repeat for gender
barplot(margin.table(Titanic,1),
        main = "Survival of Each Class",
        xlab = "Class",
        col = c("red","green")
)
legend("topleft",
       c("Not survived","Survived"),
       fill = c("red","green")
)

ggplot(Titanic, aes(Sex, Freq, fill=Survived))+ geom_bar(stat="identity")

