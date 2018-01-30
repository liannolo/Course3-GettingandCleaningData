# Course3-GettingandCleaningData
# Assignment and Data

The assignment for this project is as follows:

Create one R script called run_analysis.R that does the following. 
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The data used in this assignment was collected by the accelerometers from the Samsung Galaxy S smartphone.  The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.  See the full description of the data at the site below.[1]

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# How to Use the Script

The script run_analysis.R takes in the various data files found in the folder and cleans, combines, and reorganizes the data into a tidy data file which is exported back into the data folder.  Simply replace the “mainfolder” path with the relevant path of the data folder downloaded on your own machine and run the run_analysis.R script.  CodeBook.md further explains the steps taken to clean the data.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
