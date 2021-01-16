CodeBook
================

\\begin{flushleft} \#\# 1. Download the dataset

Data downloaded and extracted under the folder called “UCI HAR Dataset”

## 2\. Assign each data to variables

activities: list of activities performed when the corresponding
measurements were taken and its codes (labels).

features: the features selected for this database come from the
accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

subject\_test: contains test data of 9/30 volunteer test subjects being
observed.

x\_test: contains recorded features test data.

y\_test: contains test data of activities’code labels.

subject\_train: contains train data of 21/30 volunteer subjects being
observed.

x\_train: contains recorded features train data.

y\_train: contains train data of activities’code labels.

## 3\. Merges the training and the test data

X is created by merging x\_train and x\_test using rbind() function.

Y is created by merging y\_train and y\_test using rbind() function.

S is created by merging subject\_train and subject\_test using rbind()
function.

Merged\_Data is created by merging Subject, Y and X using cbind()
function.

## 4\. Extracts only the measurement on the mean and standard deviation for each measurement

Tidy\_Data is created by sub-setting Merged\_Data, selecting only
columns: subject, code and the measurements on the mean and standard
deviation (std) for each measurement.

## 5\. Uses descriptive activity names to name the activities in the data set

Entire numbers in code column of the Tidy\_Data replaced with
corresponding activity taken from second column of the activities
variable

## 6\. Appropriately labels the data set with descriptive variable names

code column in TidyData renamed into activities

All Acc in column’s name replaced by Accelerometer

All Gyro in column’s name replaced by Gyroscope

All BodyBody in column’s name replaced by Body

All Mag in column’s name replaced by Magnitude

All start with character f in column’s name replaced by Frequency

All start with character t in column’s name replaced by Time

## 7\. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

FinalData (180 rows, 88 columns) is created by sumarizing TidyData
taking the means of each variable for each activity and each subject,
after groupped by subject and activity.

Export FinalData into FinalData.txt file. \\end{flushleft}
