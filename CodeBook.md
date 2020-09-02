---
title: "Getting and Cleaning Data Course Project"
author: "Vicente Hernandez"
date: "9/1/2020"
output:
  html_document: default
  pdf_document: default
---
# Getting and Cleaning Data Project

## Description
This is a Codebook for the Getting and Cleaning Data Project from Coursera that describes the variables, the data and transformations performed to clean up the data

## Source Data
Data can be found at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Data set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information
For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

## Modifications
The transformations made in the data set file follow the projects command:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

```{r}
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

