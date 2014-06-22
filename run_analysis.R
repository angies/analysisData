run_analysis<-function(){
   
   #Instructions:
   #You should create one R script called run_analysis.R that does the following.
   #1. Merges the training and the test sets to create one data set.
   #2. Extracts only the measurements on the mean and standard deviation for each measurement.
   #3. Uses descriptive activity names to name the activities in the data set
   #4. Appropriately labels the data set with descriptive variable names.
   #5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
   
   #Setting the source directory of row data
   setwd("./UCI HAR Dataset")
   
   #_________test data________
   #Getting header labels to 561 feature columns for domain variables.
   file<-"./features.txt"
   headF <- read.table("features.txt",nrows=561)
   headers<-headF[,2]
     
   #Getting the value of domain 561-feature variables
   setwd("./test")
   file <-"./X_test.txt"
   test <- read.csv(file,sep="",header=FALSE,col.names=headers,nrows=2947)     
      
   #Getting an identifier of the subject who carried out the experiment
   file<-"./subject_test.txt"
   idSubject<-read.csv(file,sep="",header=FALSE,nrows=2947)
   test$idSubject<-idSubject
   names(test[,"idSubject"])<-"idSubject"
   
   #Getting activities data for training group
   file<-"./y_test.txt"
   activities<- read.csv(file,sep="",header=FALSE,nrows=2947)
   names(activities)[1]<-"activity"
   test$activity=(activities$activity)
   #test$activity<-cbind(activities$activity)
   
   #_________training data________
   #Getting the value of domain 561-feature variables
   setwd("../")
   setwd("./train")
   file <-"./X_train.txt"
   train <- read.csv(file,sep="",header=FALSE,col.names=headers,nrows=7352)
   
   #Getting an identifier of the subject who carried out the experiment
   file<-"./subject_train.txt"
   idSubject<-read.csv(file,sep="",header=FALSE,nrows=7352)
   train$idSubject<-idSubject
   names(train[,"idSubject"])<-"idSubject"
   
   #Getting activities data for training group
   file<-"./y_train.txt"
   activitiesTr<- read.csv(file,sep="",header=FALSE,nrows=7352)
   names(activitiesTr)[1]<-"activity"
   train$activity=(activitiesTr$activity)
   
   #_________1. Merges the training and the test sets to create one data set._________________________
   fullData = merge(test,train,by = intersect(names(test), names(train)),all=TRUE)
   
   #_________2. Extracts only the measurements on the mean and standard deviation for each measurement
   vars<-c(1,2,3,4,5,6,41,42,43,44,45,46,121,122,123,124,125,126,563)
   extData<-fullData[,vars]   
   
   #_________3. Uses descriptive activity names to name the activities in the data set________________ 
   #Getting activities data labels
   setwd("../")
   file<-"./activity_labels.txt"
   actLabel<- read.table(file,nrows=6)
   names(actLabel)[1]<-"activity"
   names(actLabel)[2]<-"activity.name"
   library(plyr)   
   extData<-join(extData,actLabel)
      
   #__________4. Appropriately labels the data set with descriptive variable names.____________________
   file="./tidyData1.csv"
   write.csv(extData,file,row.names=FALSE)
   
   #__________5. Creates a second, independent tidy data set with the average of each variable for each 
   #activity and each subject.
   avgData <- aggregate(fullData, by=fullData[c("activity","idSubject")], FUN=mean)   
   names(avgData)[length(names(avgData))]<-"del"
   avgData$del<-NULL
   names(avgData)[length(names(avgData))]<-"del"
   avgData$del<-NULL
   localFile="./tidyData2avg.csv"
   write.csv(avgData,localFile,row.names=FALSE)  
}
