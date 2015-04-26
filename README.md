# TidyDataClass3Project


###This is for the class "Getting and Cleaning Data"
###This repository contains R code that downloads and does some preprocessing on Human Activity Recognition data set.


###Full description of the data can be found
 at
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


###The raw data can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



###The assingnment: create one R script called run_analysis.R that does the following.

1) Merges the training and the test sets to create one data set.

2) Extracts only the measurements on the mean and standard deviation for each measurement.

3) Uses descriptive activity names to name the activities in the data set

4) Appropriately labels the data set with descriptive variable names.

5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##In order to run the code, the above data set needs to be located in the same directory as the code.


###The method "finalData()" executes the below functions in the proper order.



Download data

	getdata()

1. Merges the "training" and the "test" sets to create one data set.

	dataSet <- mergeTestTrainingdatasets()

2. Extracts only the measurements on the mean and standard deviation for each measurement.

	MSValue <- getMeanAndStd(dataSet)

3. Uses descriptive activity names to name the activities in the data set

	fooData <- activitiesName(dataSet)

	Use descriptive column name for subjects

	colnames(dataSet$subject) <- c("subject")

	Combine data frames into one

	bindDataV <- bindData(MSValue, fooData, dataSet$subject)

4. Appropriately labels the data set with descriptive variable names.

	bindDataFullNameV <- bindfullName(bindDataV)

5. From the data set in step 4, creates a second, independent tidy data set 
 with the average of each variable for each activity and each subject.

	newdatasetV <- newdataset(bindDataFullNameV)

	data set as a txt file created with
	write.table() using row.name=FALSE
write.table(newdatasetV, "tidyData.txt", row.names=FALSE)

	uncomment out the line below to use excel to view
	data
write.csv(newdatasetV, "tidyData.csv", row.names=FALSE)



##The codebook file can be found here:
https://github.com/powerspectra/TidyDataClass3Project/blob/master/Code%20Book.md
##The code can be found here:
https://github.com/powerspectra/TidyDataClass3Project/blob/master/run_analysis.R
