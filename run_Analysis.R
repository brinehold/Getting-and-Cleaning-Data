# setwd("~/Documents/Coursera/Getting and Cleaning Data")
# Step1. Merges the training and the test sets to create one data set.
# Load Train Data
trainData <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainNames <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainSub <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Load Test Data
testData <- read.table("./UCI HAR Dataset/test/X_test.txt")
testNames <- read.table("./UCI HAR Dataset/test/y_test.txt") 
testSub <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Merge Train and Test Data
mergeData <- rbind(trainData, testData)
mergeNames <- rbind(trainNames, testNames)
mergeSub <- rbind(trainSub, testSub)

# Step2. Extracts only the measurements on the mean and standard deviation 
# for each measurement. 
features <- read.table("./UCI HAR Dataset/features.txt")
meanIdx <- grep("mean\\(\\)|std\\(\\)", features[, 2])
mergeData <- mergeData[, meanIdx]

# Clean names and Filter Names
names(mergeData) <- gsub("\\(\\)", "", features[meanIdx, 2]) # remove "()"
names(mergeData) <- gsub("mean", "Mean", names(mergeData)) # capitalize Mean
names(mergeData) <- gsub("std", "Std", names(mergeData)) # capitalize Std
names(mergeData) <- gsub("-", "", names(mergeData)) # remove "-" in col names 

# Step3. Uses descriptive activity names to name the activities in 
# the data set
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
activityNames <- activity[mergeNames[, 1], 2]
mergeNames[, 1] <- activityNames

# Step4. Appropriately labels the data set with descriptive activity 
# names. 
tidyData <- cbind(mergeSub, mergeNames, mergeData)
colnames(tidyData)[1:2] <- c("Subject", "Activity")
write.table(tidyData, "tidy_data.txt") # write out the 1st dataset

# Step5. Creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject. 

meanData <- aggregate(x=tidyData, by=list(activities=tidyData$Activity, subj=tidyData$Subject), FUN=mean)
meanData <- meanData[, !(colnames(meanData) %in% c("subj", "activity"))]

write.table(meanData, "MeanData.txt") # write out the mean data.