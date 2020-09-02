####################################[Part 1]####################################
#Merges the training and the test sets to create one data set.

path_file <- file.path("UCI HAR Dataset")

#Activity Labels
dataActivityTest  <- read.table(file.path(path_file, "test" , "Y_test.txt" ),
                                header = FALSE)
dataActivityTrain <- read.table(file.path(path_file, "train", "Y_train.txt"),
                                header = FALSE)

#Subject Files
dataSubjectTrain <- read.table(file.path(path_file, "train", "subject_train.txt"),
                               header = FALSE)
dataSubjectTest  <- read.table(file.path(path_file, "test" , "subject_test.txt"),
                               header = FALSE)

#Data Files
dataFeaturesTest  <- read.table(file.path(path_file, "test" , "X_test.txt" ),
                                header = FALSE)
dataFeaturesTrain <- read.table(file.path(path_file, "train", "X_train.txt"),
                                header = FALSE)

#Merging the tables
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)
dataActivity<- rbind(dataActivityTrain, dataActivityTest)
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)

#Setting names
names(dataSubject)<-c("subject")
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path(path_file, "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2

#Merging everything to one data frame
dataCombine <- cbind(dataSubject, dataActivity)
Data <- cbind(dataFeatures, dataCombine)


####################################[Part 2]####################################
#Extracts only the measurements on the mean and standard deviation for
#each measurement.

#extracting the names of variables with "mean" or "std"
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)",
                                                dataFeaturesNames$V2)]

selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

####################################[Part 3]####################################
#Uses descriptive activity names to name the activities in the data set

#Getting the activity labels

Data$activity <- read.table(file.path(path_file, "activity_labels.txt"),
                            header = FALSE)[Data$activity,2]

####################################[Part 4]####################################
#Appropriately labels the data set with descriptive variable names.

names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

####################################[Part 5]####################################
#From the data set in step 4, creates a second, independent tidy data set with
#the average of each variable for each activity and each subject.

Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
