
#Code Book

##Full description of the data can be found

at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##The raw data can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


In order to run the code, the above data set needs to be located in the same directory as the code.

##The method "finalData()" executes the below functions in the proper order.

Download data

getdata()

Merges the "training" and the "test" sets to create one data set.

dataSet <- mergeTestTrainingdatasets()

Extracts only the measurements on the mean and standard deviation for each measurement.

MSValue <- getMeanAndStd(dataSet)

Uses descriptive activity names to name the activities in the data set

fooData <- activitiesName(dataSet)

Use descriptive column name for subjects

colnames(dataSet$subject) <- c("subject")

Combine data frames into one

bindDataV <- bindData(MSValue, fooData, dataSet$subject)

Appropriately labels the data set with descriptive variable names.

bindDataFullNameV <- bindfullName(bindDataV)

Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

newdatasetV <- newdataset(bindDataFullNameV)

data set as a txt file created with

write.table() using row.name=FALSE write.table(newdatasetV, "tidyData.txt", row.names=FALSE)

uncomment out the line below to use excel to view data

write.csv(newdatasetV, "tidyData.csv", row.names=FALSE)

##The below is the varibles in the data set:

 
[1] "subject"
[2] "activity"
[3] "timeBodyAccelerometer-mean()-X"
[4] "timeBodyAccelerometer-mean()-Y"
[5] "timeBodyAccelerometer-mean()-Z"
[6] "timeBodyAccelerometer-std()-X"
[7] "timeBodyAccelerometer-std()-Y"
[8] "timeBodyAccelerometer-std()-Z"
[9] "timeGravityAccelerometer-mean()-X"
[10] "timeGravityAccelerometer-mean()-Y"
[11] "timeGravityAccelerometer-mean()-Z"
[12] "timeGravityAccelerometer-std()-X"
[13] "timeGravityAccelerometer-std()-Y"
[14] "timeGravityAccelerometer-std()-Z"
[15] "timeBodyAccelerometerJerk-mean()-X"
[16] "timeBodyAccelerometerJerk-mean()-Y"
[17] "timeBodyAccelerometerJerk-mean()-Z"
[18] "timeBodyAccelerometerJerk-std()-X"
[19] "timeBodyAccelerometerJerk-std()-Y"
[20] "timeBodyAccelerometerJerk-std()-Z"
[21] "timeBodyGyroscope-mean()-X"
[22] "timeBodyGyroscope-mean()-Y"
[23] "timeBodyGyroscope-mean()-Z"
[24] "timeBodyGyroscope-std()-X"
[25] "timeBodyGyroscope-std()-Y"
[26] "timeBodyGyroscope-std()-Z"
[27] "timeBodyGyroscopeJerk-mean()-X"
[28] "timeBodyGyroscopeJerk-mean()-Y"
[29] "timeBodyGyroscopeJerk-mean()-Z"
[30] "timeBodyGyroscopeJerk-std()-X"
[31] "timeBodyGyroscopeJerk-std()-Y"
[32] "timeBodyGyroscopeJerk-std()-Z"
[33] "timeBodyAccelerometerMagnitude-mean()"
[34] "timeBodyAccelerometerMagnitude-std()"
[35] "timeGravityAccelerometerMagnitude-mean()"
[36] "timeGravityAccelerometerMagnitude-std()"
[37] "timeBodyAccelerometerJerkMagnitude-mean()"
[38] "timeBodyAccelerometerJerkMagnitude-std()"
[39] "timeBodyGyroscopeMagnitude-mean()"
[40] "timeBodyGyroscopeMagnitude-std()"
[41] "timeBodyGyroscopeJerkMagnitude-mean()"
[42] "timeBodyGyroscopeJerkMagnitude-std()"
[43] "frequencyBodyAccelerometer-mean()-X"
[44] "frequencyBodyAccelerometer-mean()-Y"
[45] "frequencyBodyAccelerometer-mean()-Z"
[46] "frequencyBodyAccelerometer-std()-X"
[47] "frequencyBodyAccelerometer-std()-Y"
[48] "frequencyBodyAccelerometer-std()-Z"
[49] "frequencyBodyAccelerometerJerk-mean()-X"
[50] "frequencyBodyAccelerometerJerk-mean()-Y"
[51] "frequencyBodyAccelerometerJerk-mean()-Z"
[52] "frequencyBodyAccelerometerJerk-std()-X"
[53] "frequencyBodyAccelerometerJerk-std()-Y"
[54] "frequencyBodyAccelerometerJerk-std()-Z"
[55] "frequencyBodyGyroscope-mean()-X"
[56] "frequencyBodyGyroscope-mean()-Y"
[57] "frequencyBodyGyroscope-mean()-Z"
[58] "frequencyBodyGyroscope-std()-X"
[59] "frequencyBodyGyroscope-std()-Y"
[60] "frequencyBodyGyroscope-std()-Z"
[61] "frequencyBodyAccelerometerMagnitude-mean()"
[62] "frequencyBodyAccelerometerMagnitude-std()"

##The readme file can be found here:
https://github.com/powerspectra/TidyDataClass3Project/blob/master/README.md
##The code can be found here:
https://github.com/powerspectra/TidyDataClass3Project/blob/master/run_analysis.R
