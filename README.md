---
title: "README"
author: "Vicente Hernandez"
date: "9/2/2020"
output: html_document
---

## Part 1

The first part of the script creates one data frame containing all the data from the files of the experiment of "Human Activity Recognition Using Smartphones". Teh sript extracts all the data from teh files of the experiment, then it combines this data into data frames from the same type of data (activity data, Subject data and Features data), leaving 3 different data frames. Then this data frames are all combined into one data frame containing all the data (10299 entries and 563 variables).

## Part 2

The second part of the script extracts the name of tha variables that contains the words "mean" or "std" (for standard deviation), creating a list of the names of those variables. Then it is added the names "subject" and "activity" to conservate this variables too in the new data frame. Then a subset of the data frame is created containing only the variables "subject", "activity" and varibles that contain in the name "mean" or "std".

## Part 3

The values of the variable "activity" are replaced with the name of the activity of each entry. Meaning that now the variable is not a numerical that represents the activity, but the name of the activity that it was executed.

## Part 4

The names of the variables are changed to be more descriptive.
-Every variable name that starts with the letter "t", the "t" it is replaced with "time".
-Every variable name that starts with the letter "f", the "f" it is replaced with "frequency"
-Every variable name that contains "Acc", "Acc" it is replaced with "Accelerometer"
-Every variable name that contains "Gyro", "Gyro" it is replaced with "Gyroscope"
-Every variable name that contains "Mag", "Mag" it is replaced with "Magnitude"
-Every variable name that contains "BodyBody", "BodyBody" it is replaced with "Body"

## Part 5

A new independent data frame is created, this data frame is basically a summary of the previous data frame. It contains the mean of each variable, for each activy for each subject