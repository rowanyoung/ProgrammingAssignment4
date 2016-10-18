#Programming Assignment 4

# You should create one R script called run_analysis.R that does the following.
#1) Merges the training and the test sets to create one data set.
#2) Extracts only the measurements on the mean and standard deviation for each measurement.
#3) Uses descriptive activity names to name the activities in the data set
#4) Appropriately labels the data set with descriptive variable names.
#5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each 
#    activity and each subject. (levels on activity and subject)

library(reshape2)

fileName <- "getdata_projectfiles_UCI_HAR_Dataset.zip"
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#Downloads and unzips data file to current working directory
download.file(fileURL, fileName)
unzip(fileName)

#Loading in datasets
activitylabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

#Extract mean and std columns (numbers and names) from feature dataset
meanstdcol <- grep("*mean*|*std*",features[,2])
meanstdcolname <- grep("*mean*|*std*",features[,2],value=TRUE)

#Test dataset load (mean and std columns, activity, subject)
testset <- read.table("UCI HAR Dataset/test/X_test.txt")[meanstdcol]
testactivity <- read.table("UCI HAR Dataset/test/y_test.txt")
testsubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testset, testactivity, testsubject)

#Train dataset load (mean and std columns, activity, subject)
trainset <- read.table("UCI HAR Dataset/train/X_train.txt")[meanstdcol]
trainactivity <- read.table("UCI HAR Dataset/train/y_train.txt")
trainsubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainset, trainactivity, trainsubject)

#Merges the test and train datasets into one dataset and renames variables with descriptive labels
testtrain <- rbind(test, train)
colnames(testtrain) <- c(paste0("mean_",meanstdcolname),"activity","subject")

#Relabels activities variable with descriptive names and applies factors to activities and subjects
testtrain$activity <- factor(testtrain$activity, levels = activitylabels[,1], labels = activitylabels[,2])
testtrain$subject <- as.factor(testtrain$subject)

#Creates tidy data set with means of variables grouped by activity and subject
meltedtt <- melt(testtrain, id.vars=c("activity", "subject"))
meantt <- dcast(meltedtt, subject + activity ~ variable, mean)

#Exports summarized data to txt file in working directory
write.table(meantt, "tidy.txt", row.names = FALSE, quote = FALSE)