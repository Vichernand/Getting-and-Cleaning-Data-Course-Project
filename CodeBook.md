---
title: "Getting and Cleaning Data Course Project"
author: "Vicente Hernandez"
date: "9/1/2020"
output:
  html_document: default
  pdf_document: default
---
##Extracting and creating one data frame

The first thing to do is extract the diferent files in diferent data frames according to the data of each file (Activity data of tests, Activity data of training, Subject data of tests, Subject data of training, Features data of tests and Features data of training). Then combine the data frames of of each type of data into one data frame (Activity data, Subject data and Features data). Then the names of the columns are changed and combined the three data frames into one.

```{r}
setwd("C:/Users/Vicenti/Desktop/Coursera/getdata_projectfiles_UCI HAR Dataset")
path_file <- file.path("UCI HAR Dataset")

dataActivityTest  <- read.table(file.path(path_file, "test" , "Y_test.txt" ),
                                header = FALSE)
dataActivityTrain <- read.table(file.path(path_file, "train", "Y_train.txt"),
                                header = FALSE)

dataSubjectTrain <- read.table(file.path(path_file, "train", "subject_train.txt"),
                               header = FALSE)
dataSubjectTest  <- read.table(file.path(path_file, "test" , "subject_test.txt"),
                               header = FALSE)

dataFeaturesTest  <- read.table(file.path(path_file, "test" , "X_test.txt" ),
                                header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_file, "train", "X_train.txt"),
                                header = FALSE)

dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path_file,"features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)
```
## Variables

The data of the remaining data frame corresponds to "Human Activity Recognition Using Smartphones", which means it is data obtained by the smartphones in order to classify the activy thet the user is executing (Walking, walking upstairs, walking downstairs, sitting, standing or laying).
So the data frame contains 563 different variables. This variables correspond to a number to identify the subject that carried the experiment, the activity that the subject was executing, the acceleration from the accelerometer, angular velocity from the gyroscope and vectors with time and frequency 
