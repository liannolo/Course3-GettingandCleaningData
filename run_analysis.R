
# Assignment Instructions:
# You should create one R script called run_analysis.R that does the following.
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.

# Data Source: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


library(dplyr)


#set working directory main folder
mainfolder <- '/Documents/Coursera Data Science/Course 3- Getting Data/UCI HAR Dataset/'


#Read in the data using read.table
getwd()
setwd(paste(mainfolder, 'test', sep=""))
getwd()

x_test_data <- read.table('X_test.txt')
y_test_data <- read.table('y_test.txt', col.names = c("activity"))
subject_test_data <- read.table('subject_test.txt', col.names = c("subject_num"))

setwd(paste(mainfolder, 'train', sep=""))

x_train_data <- read.table('X_train.txt')
y_train_data <- read.table('y_train.txt', col.names = c("activity"))
subject_train_data <- read.table('subject_train.txt',col.names = c("subject_num"))


#Step 1
#use c-bind to bind the test data and the training data together into 2 separate sets

training_data_full <- cbind(subject_train_data, y_train_data, x_train_data)

testing_data_full <- cbind(subject_test_data, y_test_data, x_test_data)

#use r-bind to bind the training data and testing data together
full_data_set <- rbind(training_data_full,testing_data_full)


#Step 2

setwd(mainfolder)

features_table <- read.table('features.txt',col.names = c("col_num","name"), colClasses = c("numeric","character"))
str(features_table)

#only want rows where mean() and std() appear so had to escape the parentheses characters
cols_to_keep <- grep("mean\\(\\)|std\\(\\)",features_table$name)

names(full_data_set) <- gsub("V", "", names(full_data_set))

#get only columns %in% the cols_to_keep list
full_data_set <- full_data_set[,c(cols_to_keep)]



#Step 3

#create a vector with the activities in the index spot of the number they correspond to
activities <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")

#take value from activities vector where the value of the activities column is equal to the index spot
#to sub out the numbers for the descriptions
full_data_set$activity <- activities[full_data_set$activity]



#Step 4

#create a vector of the descriptive names with the index being the number of the column it corresponded to
descriptive_names <- features_table$name

#swap out the number of the column for the name it corresponds to in features.txt
names(full_data_set) <- descriptive_names[as.numeric(names(full_data_set))]

#rename columns 1 and 2 as subject_num and activity since they got lost
names(full_data_set)[1] <- 'subject_num'
names(full_data_set)[2] <- 'activity'

#make the names a little more clear by subbing out t and f for their terminology,
#substituting the dash for a .
#removing the ()
#making all lowercase
names(full_data_set) <- gsub("^t", "time", names(full_data_set))
names(full_data_set) <- gsub("^f", "freq", names(full_data_set))
names(full_data_set) <- gsub("-", ".", names(full_data_set))
names(full_data_set) <- gsub("\\(\\)", "", names(full_data_set))
names(full_data_set) <- tolower(names(full_data_set))


#Step 5


#create a tidy data set by grouping the data by subject and activity and taking the mean for each group
#produces one record for each observation of the same type
tidy_data_set <- full_data_set %>% 
  group_by(subject_num, activity) %>% 
  summarize_all(mean)


#write the new data set to a text file
setwd(mainfolder)
write.table(tidy_data_set, "tidy_data_set.txt", row.names = FALSE)




