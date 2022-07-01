#Playing around with iris dataset to conduct summary stats and analysis

#assigning a data frame to the inbuilt data set
my_iris <- iris

#checking the class of the dataset
class(my_iris)

#summarizing classes of the df
summary(my_iris)

#investigating structure of the df
str(my_iris)
head(my_iris)
glimpse(my_iris)

#plotting a few basic graphs with the df
barplot (table(my_iris$Petal.Width))

table(my_iris$Sepal.Length, my_iris$Species) 

hist(my_iris$Petal.Length)
hist(my_iris$Petal.Length, breaks = 5)
