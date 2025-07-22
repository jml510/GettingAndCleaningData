## Load the dplyr library
library(dplyr)

## Set the working directory 
setwd("D:/Downloads/getdata_projectfiles_UCI HAR DATASET/UCI HAR DATASET")

## Reading the training datasets
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/Y_train.txt")
subject_train <- read.table("./train/subject_train.txt")

## Reading the testing datasets
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/Y_test.txt")
subject_test <- read.table("./test/subject_test.txt")

##Reading the features
features <- read.table("./features.txt")

## Reading the activity labels 
activity_labels <- read.table("./activity_labels.txt")
colnames(activity_labels) <- c("activityID", "activityType")

##Assigning names to variables
colnames(x_train) <- features[, 2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

colnames(x_test) <- features[, 2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

## Merge the datasets together
train <- cbind(x_train, y_train, subject_train)
test <- cbind(x_test, y_test, subject_test)
final <- rbind(train, test)

## Only getting measurements on the mean and sd 
mean_and_sd <- grepl("activityID|subjectID|mean\\(\\)|std\\(\\)", colnames(final))
mean_and_sd_set <- final[, mean_and_sd]

## Creating descriptive activity names
activitynames <- merge(mean_and_sd_set, activity_labels, by = "activityID")

## Creating labels for each variable name
colnames(activitynames) <- gsub("t", "time", colnames(activitynames))
colnames(activitynames) <- gsub("f", "frequency", colnames(activitynames))
colnames(activitynames) <- gsub("Acc", "accelerometer", colnames(activitynames))
colnames(activitynames) <- gsub("Gyro", "gyroscope", colnames(activitynames))
colnames(activitynames) <- gsub("Mag", "magnitude", colnames(activitynames))
colnames(activitynames) <- gsub("BodyBody", "body", colnames(activitynames))

## Creating the second, independent tidy data set with
## the average variable for each activity and subject
TidyDataSet <- activitynames%>%
  group_by(subjectID, activityID, activityType) %>%
  summarize_all(mean)

## Creating the text file for the final data set
write.table(TidyDataSet, "TidyDataSet.txt", row.names = FALSE)