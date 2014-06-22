DATA DICTIONARY - 2014 
=======================
Human Activity Recognition Using Smartphones Dataset
V.1.1

This code book mentions the variables, the data, and transformations performed to clean up the data.

1. Variables
=============

The used variables were described in the features_info.txt and README.txt files from sourde data. The total variables were 564: a 561-feature vector with time and frequency domain variables, an identifier of the subject who carried out the experiment, activity labels, and description activity names.

 
2. Data
==========

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The used files to process and get tidy data set:

    
    features.txt
    X_test.txt
    subject_test.txt.
    activity_labels.txt
    y_test.txt
    X_train.txt
    subject_train.txt
    y_train.txt



3. Transformations
===================

The procedure to transforms row data to tidu data set was the following: 

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

f) After some seconds you can get two output data files:

tidyData1.csv-Main tidy data set only measurements on mean y standard deviation for each measurement.

tidyData2_avg.csv-Second tidy data set with averages.


License:
=========

Using this source dataset in publications must be acknowledged by referencing the following publication [1]

This run_analysis.R script was developed in coursera's course as an assignment project at "Getting and Cleaning Data" by Jeff Leek, PhD, Roger D. Peng, PhD, Brian Caffo, PhD.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited by the original authors.
