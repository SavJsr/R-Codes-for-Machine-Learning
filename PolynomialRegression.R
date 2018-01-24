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

#Modelling the Data for different polynomials
model1 <- lm( y ~ poly(x,1)) #Linear fit
model2 <- lm( y ~ poly(x,2)) #Quadratic fit
model3 <- lm( y ~ poly(x,3)) #Cubic fit

#Predicting the models
predictedmodel1 <- predict(model1)
predictedmodel2 <- predict(model2)
predictedmodel3 <- predict(model3)

#plotting the prdicted values for different polynomials with actual data,
#to study the fit
plot(x,y, xlab = "Time (Years)", ylab = "Population", cex.lab = 1.3, pch=24)
lines(x, predictedmodel1, col = "blue", lwd = 1)
lines(x, predictedmodel2, col = "red",  lwd = 1)
lines(x, predictedmodel3, col = "darkgreen", lwd = 1)

# Add a legend
legend("topright", 
       legend = c("Original", "Linear", "Quadratic", "Cubic"), 
       lty = c(NA,1,1,1),inset=c(0,-0.20), pch = c(24,NA,NA,NA),col = c( "black","blue","red","darkgreen"))

#Finding correlation coefficients
R1 <- cor(predictedmodel1,census$Pop)
R2 <- cor(predictedmodel2,census$Pop)
R3 <- cor(predictedmodel3,census$Pop)

#Scatter Plot between estimated and actual population values
scatter.smooth(y,predictedmodel1)
scatter.smooth(y,predictedmodel2)
scatter.smooth(y,predictedmodel3)
