#Install Package
install.packages("e1071")

#Load Library
library(e1071)

#Installing the necessary libraries
library(tidyverse)
library(data.table)

#Load the cars dataset array
setwd("C:/Users/vishw/Desktop/Lectures/Data Science/ProfLary ML/Lecture-4/rscripts")
cars <- fread('cars.csv')

cars <- na.omit(cars)

X <- cbind(cars$Horsepower,cars$Weight) 

#Regression with SVM
modelsvm <- svm(MPG~X,cars,na.action=na.omit)

#Predict using SVM regression
predYsvm <- predict(modelsvm,cars)

#Plotting the regression line
plot(cars$MPG,cars$MPG,type="l")
points(cars$MPG~predYsvm,
     data=cars,
     pch=16,
     col="blue",
     xlab="Estimated MPG",
     ylab="Actual MPG",
     main="SVM Model")

#To be added the kernel function to be used to train the data and then see the difference.





