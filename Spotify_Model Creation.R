#Reading the Dataset
project_data <- read.csv('E:/Masters Program/Semester 1/Data, Statistical Models and Objects/Final Project/data.csv')
project_data2 <- subset(project_data, select = -c(song_title,artist,target,X))

#Importing library glmnet to perform Lasso Regression
library(glmnet)
model_1=model.matrix(valence ~. , data=project_data2)
cv.lasso <- cv.glmnet(model_1,project_data2$valence,type.measure = "mse",alpha = 1)
cv.lasso
plot(cv.lasso)
Lambda.best <- cv.lasso$lambda.min
predict(cv.lasso, s = Lambda.best, type = "coefficients")

model1 <- lm(valence ~ ., data=project_data2)
summary(model1)
library(DescTools)
VIF(model1)