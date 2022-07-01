# Title: Learning R
# Author: Ambika Chopra
# Last edited on: 23/6/2022
# Purpose: Document analysis and learning process of working with R

#loading libraries
library(dplyr)
library(tidyverse)
library(ggplot2)
library(ggthemes)
library(githubinstall)
library(rlang)

# set working directory
getwd()
setwd("/Users/ambikachopra/learning_stats")

# Read in the data file (.csv)
titanic <- read.csv("data/Titanic.csv")

# exploring the data set: checking # of observations, variable types, summary stats
summary(titanic)
summarise(titanic)
sapply(titanic, class)

# recoding and labeling variables to run summary stats
titanic$Survived <- as.factor(titanic$Survived)
titanic$Sex <- as.factor(titanic$Sex)

# run summary again on recoded data set
summary(titanic)

#checking for missing values
is.na(titanic)
sum(is.na(titanic))

#557 missing values

#summary notes: 
#There are a total of 1313 observations in the data set. Five variables (columns): Names, traveling class, age, sex, and survival status
#Variable age has 557 missing values. No other missing values in the data set. 
#The female to male ratio us almost 1:2, i.e, there are double the number of males in the data set than females.
#863 passengers died ("0"), while 450 passengers in the data survived("1")

#note: for csv file, used this command to understand distribution within a variable (class, gender, etc.)
table(titanic$PClass)
table(titanic$Sex)

#to look at survival rates by class
table(titanic$PClass[titanic$Survived == 1])

#checking survival propotion by gender and class
prop.table(table(titanic$Sex, titanic$Survive),1)
prop.table(table(titanic$PClass, titanic$Survive),1)

#plotting survival rate using barplot

#step1: created two different data frames to bifurcate survived v/s non survived
titanic_survivor <- titanic[titanic$Survived==1,]
titanic_nosurvivor <- titanic[titanic$Survived==0,]

#step2: plotting bar graphs
barplot(table(titanic_survivor$Sex))
barplot(table(titanic_nosurvivor$Sex))

#Alternate: plotting survival rates within the same graphs
barplot(prop.table(table(titanic$Sex, titanic$Survive),1))
barplot(prop.table(table(titanic$PClass, titanic$Survive),1))

#using ggplot to plot survival by gender and by class
survival_gender <- ggplot(titanic)
survival_gender <- ggplot(titanic, aes(Survived,fill = Sex))+
  geom_bar(colour = "black", position = "dodge")+
  xlab("Passenger Survived") + 
  ylab("Total Passengers") +
  ggtitle("Barplot to represent Passenger Count who Survived vs who Died")

survival_class <- ggplot(titanic)
survival_class <- ggplot(titanic, aes(Survived, fill= PClass))+
  geom_bar(colour = "black", position = "dodge")+
  xlab("Passenger Survived") + 
  ylab("Total Passengers") +
  ggtitle("Barplot to represent Passenger Count who Survived vs who Died")

#customising themes of the plot
survival_gender2 <- ggplot(titanic)
survival_gender2 <- ggplot(titanic, aes(Survived,fill=Sex))+
  geom_bar(colour = "black", position = "dodge")+
  xlab("Passenger Survived") + 
  ylab("Total Passengers") +
  ggtitle("Barplot to represent Passenger Count who Survived vs who Died")
theme_economist_white()

#installing bfa theme for making plots
githubinstall("benmazzotta/bfaggtheme")
library(bfaggtheme)


