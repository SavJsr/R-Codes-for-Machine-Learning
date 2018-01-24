#Fit a Logistic Regression Model  
#Make a logistic binomial model of the probability of smoking 
#as a function of age, weight, and sex, using a two-way interactions model.

#Installing the necessary libraries
library(tidyverse)
library(data.table)

#Load the hospital dataset array
setwd("C:/Users/vishw/Desktop/Lectures/Data Science/ProfLary ML/Lecture-3/rscripts")
hospital <- fread('hospital.csv')

#Convert the smoker variable as categorical (R will read it as numeric)
hospital$Smoker <- as.factor(hospital$Smoker)

#Specify the model using a formula that allows up to two-way interactions
# between the variables age, weight, and sex. Smoker is the response
# variable.

modelspec = 'Smoker ~ Age*Weight*Sex - Age:Weight:Sex'

#Fit a logistic binomial model.
model <- glm(modelspec,family=binomial(link='logit'),data=hospital)
summary(model)

# All of the p-values (under pValue) are large. This means none of the
# coefficients are significant.
