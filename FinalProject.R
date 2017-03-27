#=====================================================
# Practical Machine Learning - Final Project
#=====================================================

#Load neccessary packages
library(caret)
library(rattle)
library(rpart)
library(rpart.plot)
library(randomForest)
library(repmis)

#Load training and testing datasets
training <- read.csv("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv",header = T,na.strings = c("NA",""))
testing <- read.csv("https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv",header = T, na.strings = c("NA",""))
head(training);names(training)
names(testing)

#Delete comlumns with NA value
training <- training[,colSums(is.na(training))==0]
testing <- testing[,colSums(is.na(testing))==0]

#Split training data into training & validation
set.seed(1410)
intrain <- createDataPartition(training$classe, p = 0.7, list = F)
train <- training[intrain,]
valid <- training[-intrain,]

