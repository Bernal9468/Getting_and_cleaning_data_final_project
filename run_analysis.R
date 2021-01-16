# Import data set 
filename <- 'project dataset.zip'
if ((list.files() == filename) == FALSE){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method = "curl")
  unzip(filename)
}
# Build each column for the data 
library(dplyr)
library(data.table)
activities <- fread('UCI HAR Dataset/activity_labels.txt', col.names = c('code', 'activity'))
features <- fread('UCI HAR Dataset/features.txt', col.names = c('n', 'feature'))
subject_test <- fread('UCI HAR Dataset/test/subject_test.txt', col.names = 'subject')
x_test <- fread('UCI HAR Dataset/test/X_test.txt', col.names = features$feature)
y_test <- fread('UCI HAR Dataset/test/y_test.txt', col.names = 'code')
subject_train <- fread('UCI HAR Dataset/train/subject_train.txt', col.names = 'subject')
x_train <- fread('UCI HAR Dataset/train/X_train.txt', col.names = features$feature)
y_train <- fread('UCI HAR Dataset/train/y_train.txt', col.names = 'code')

# Merge train data set
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
S <- rbind(subject_train, subject_test)
Merge_data <- cbind(S, X, Y)

# Columns that contains mean and std for each measurement 
Tidy_Data <- select(Merge_data, subject, code, contains('mean'), contains('std'))
Tidy_Data$code <- activities[Tidy_Data$code, 2]

# Rename columns 
names(Tidy_Data)[2] <- "activity"
names(Tidy_Data) <- gsub("Acc", "Accelerometer", names(Tidy_Data))
names(Tidy_Data) <- gsub("Gyro", "Gyroscope", names(Tidy_Data))
names(Tidy_Data) <- gsub("BodyBody", "Body", names(Tidy_Data))
names(Tidy_Data) <- gsub("Mag", "Magnitude", names(Tidy_Data))
names(Tidy_Data) <- gsub("^t", "Time", names(Tidy_Data))
names(Tidy_Data) <- gsub("^f", "Frequency", names(Tidy_Data))
names(Tidy_Data) <- gsub("tBody", "TimeBody", names(Tidy_Data))
names(Tidy_Data) <- gsub("-mean()", "Mean", names(Tidy_Data), ignore.case = TRUE)
names(Tidy_Data) <- gsub("-std()", "STD", names(Tidy_Data), ignore.case = TRUE)
names(Tidy_Data) <- gsub("-freq()", "Frequency", names(Tidy_Data), ignore.case = TRUE)
names(Tidy_Data) <- gsub("angle", "Angle", names(Tidy_Data))
names(Tidy_Data) <- gsub("gravity", "Gravity", names(Tidy_Data))

# Final data 
final <- Tidy_Data %>% group_by(subject, activity) %>% summarise_all(mean)