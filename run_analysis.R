
library(plyr)

# If data is not there, download it and unzip it.
getdata = function() {
   if (!file.exists("UCI HAR Dataset")) {
      # download the data
      fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      download.file(fileURL, "boogie.zip")
      unzip("boogie.zip")
   }
}

# 1. Merges the "training" and the "test" sets to create one data set.
mergeTestTrainingdatasets = function() {

   testFileX <- read.table("UCI HAR Dataset/test/X_test.txt")
   testFileY <- read.table("UCI HAR Dataset/test/y_test.txt")
   testFileSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")   

   trainingFileX <- read.table("UCI HAR Dataset/train/X_train.txt")   
   trainingFileY <- read.table("UCI HAR Dataset/train/y_train.txt")
   trainingFileSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")


   mergedX <- rbind(trainingFileX, testFileX)
   mergedY <- rbind(trainingFileY, testFileY)
   mergedSubject <- rbind(trainingFileSubject, testFileSubject)

   list(x=mergedX, y=mergedY, subject=mergedSubject)
}

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
getMeanAndStd = function(dataSet) {
   
   fooData = dataSet$x
   features <- read.table("UCI HAR Dataset/features.txt")

   mean.col <- sapply(features[,2], function(x) grepl("mean()", x, fixed=T))
   std.col <- sapply(features[,2], function(x) grepl("std()", x, fixed=T))

   MSValues <- fooData[, (mean.col | std.col)]
   colnames(MSValues) <- features[(mean.col | std.col), 2]
   MSValues
}

# 3. Uses descriptive activity names to name the activities in the data set
activitiesName <- function(dataSet){
   fooData = dataSet$y
   activities <- read.table("UCI HAR Dataset/activity_labels.txt")
   activities[, 2] <- gsub("_", "", tolower(activities[, 2]))
   fooData[,1] <- activities[fooData[,1], 2]
   colnames(fooData) <- "activity"
   fooData
}

#create one data frame
bindData <- function(getMeanAndStdV, activitiesNameV, mergedSubjects) {
   cbind(getMeanAndStdV, activitiesNameV, mergedSubjects)
}

# 4. Appropriately labels the data set with descriptive variable names.
bindfullName <- function(bindDataV){
  names(bindDataV)<-gsub("^t", "time", names(bindDataV))
  names(bindDataV)<-gsub("^f", "frequency", names(bindDataV))
  names(bindDataV)<-gsub("Acc", "Accelerometer", names(bindDataV))
  names(bindDataV)<-gsub("Gyro", "Gyroscope", names(bindDataV))
  names(bindDataV)<-gsub("Mag", "Magnitude", names(bindDataV))
  names(bindDataV)<-gsub("BodyBody", "Body", names(bindDataV))
  bindDataV
}

# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
newdataset = function(bindDataV) {
   new <- ddply(bindDataV, .(subject, activity), function(x) colMeans(x[,1:60]))
   new
}

finalData = function() {
   # Download data
   getdata()
   # 1. Merges the "training" and the "test" sets to create one data set.
   dataSet <- mergeTestTrainingdatasets()
   # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
   MSValue <- getMeanAndStd(dataSet)
   # 3. Uses descriptive activity names to name the activities in the data set
   fooData <- activitiesName(dataSet)
   # Use descriptive column name for subjects
   colnames(dataSet$subject) <- c("subject")
   # Combine data frames into one
   bindDataV <- bindData(MSValue, fooData, dataSet$subject)
   # 4. Appropriately labels the data set with descriptive variable names. 
   bindDataFullNameV <- bindfullName(bindDataV)
   # 5. From the data set in step 4, creates a second, independent tidy data set 
   #    with the average of each variable for each activity and each subject.
   newdatasetV <- newdataset(bindDataFullNameV)
   # data set as a txt file created with write.table() using row.name=FALSE
   write.table(newdatasetV, "tidyData.txt", row.names=FALSE)
   # uncomment out the line below to use excel to view data
   #write.csv(newdatasetV, "tidyData.csv", row.names=FALSE)
   newdatasetV
}