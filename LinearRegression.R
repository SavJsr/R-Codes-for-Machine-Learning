#Installing the necessary libraries
library(tidyverse)
library(data.table)

#Load the census dataset array
setwd("C:/Users/vishw/Desktop/Lectures/Data Science/ProfLary ML/Lecture-3/rscripts")
census <- fread('population.csv')

#Specify x values (year)
x <- census$Year

#Specify y values (population)
y <- census$Pop

#Modelling the Data for linear fit
model1 <- lm( y ~ poly(x,1)) #Linear fit

#Predicting the model
predictedmodel1 <- predict(model1)

#Plotting the prdicted values for different polynomials with actual data,
#to study the fit
plot(x,y, xlab = "Time (Years)", ylab = "Population", cex.lab = 1.3, pch=24)
lines(x, predictedmodel1, col = "blue", lwd = 1)

# Add a legend
legend("topright", 
       legend = c("Original", "Linear fit"), 
       lty = c(NA,1), pch = c(24,NA),col = c( "black","blue"))

#Finding correlation coefficients
R <- cor(predictedmodel1,census$Pop)

#Scatter Plot between estimated and actual population values
scatter.smooth(y,predictedmodel1)

