---
title: "Getting and Cleaning Data Course Project CodeBook"
author: Justin Lau
output: html_document
date: "2025-07-22"
---
This CodeBook was created to explain the contents of ```run_analysis.R```, as outlined in the project details.
The task of this course project was to collect, work with, and clean a data set. The goal is to prepare tidy data that 
can be used for later analysis. The raw data provided for this project looked at activity data collected
from a Samsung Galaxy smartphone. The origional data source can be found [here](https://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones)


<font size="6"> **For This Project** </font>

There are three different files for this course project in this repository:

1. ```run_analysis.R```, which holds the script that cleans the data. It does this by:

    a. Merging the training and the test sets to create one data set. 
    b. Extracting only the measurements on the mean and standard deviation for each measurement
    c. Using descriptive activity names to the name the activities in the data set
    d. Appropriately labeling the data sets with descriptive variable names
    e. Using the previous step, create a second, independent tidy data set with the average of each of 
     the variable for each activity and each subject. 
2. ```CodeBook.md```, This CodeBook which is meant to describe the variables, data, and any transformations or work 
that was performed in order to clean the data. 
3. ```TidyDataSet.txt```, the final data set that has been cleaned and has the average of each of the variables 
for each activity and subject. 

<font size="6"> **The Script** </font>

When looking at the script, you'll first notice that instead of downloading the data through R, I downloaded the data onto
my computer, then changed the working directory. This is just due to personal preference. Next, you'll see that all the 
important .txt files are assigned to a variable that reads them. In order to merge the two different data sets together, 
I bound the three data sets into one variable, then bound those two to combined them into one. 

After combining the data sets into one set, I then created the variable to extract only the measurements on the mean
and standard deviation for each measurement. Next, I used that previous mentioned variable to create a variable that held
those measurements and gave them new labels for each variable name. Finally, I created the second, independent tidy data set
with the average of each of the variables for each activity and each subject, and created the text file. 



<font size="6"> **The Variables** </font>

There are several variables that were in the raw data that were measured, that had to be labeled. These were also the only 
things changed from the raw data. 

    a. "t", which was changed to "time", 
    b. "f", which was changed to "frequency", 
    c. "Acc", which was changed to "accelerometer"
    d. "Gyro", which was changed to "gyroscope", 
    e. "Mag", which was changed to "magnitude", 
    f. "BodyBody", which was changed to "Body". 

Thank you for reading!