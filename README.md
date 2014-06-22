run_analysis.R
==============================

Scripts to analize row data to get tidy data set.

The purpose of this project was to demonstrate my ability to collect, work with, and clean a data set. The goal was to prepare tidy data that can be used for later analysis.

The procedure was the following: 

a) Set your working directory

b) Get the row data, in this case, download and uncompress the Samsung data in your working directory.

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

c) When uncompress your zip file, you will look /UCI HAR Dataset directory and its parent must be your working directory.

d) The run_analysis.R file will be use to collect, work with, and clean data. You can run the script from R interactive mode by typing

source("run_analysis.R")
run_analysis()

e) The scripts from run_analysis.R will do the following:


    1.Merges the training and the test sets to create one data set.
    2.Extracts only the measurements on the mean and standard deviation for each measurement.
    3.Uses descriptive activity names to name the activities in the data set
    4.Appropriately labels the data set with descriptive variable names.
    5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

f) After some seconds you can get two processed data files:

tidyData1.csv-Main tidy data set only measurements on mean y standard deviation for each measurement.

tidyData2_avg.csv-Second tidy data set with averages.
