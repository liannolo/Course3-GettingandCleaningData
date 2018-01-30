# Data Description

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.  See the full description of the data at the site below.[1][2]

# Steps to Clean

1.	Data should first be downloaded from this link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2.	The relevant files are then automatically loaded into R when the script is run.  They are:
*	features.txt: List of all variables that correspond to the columns in the training and test sets
*	activity_labels.txt: Identifies the corresponding name of the numerical activities found in y_train.txt and y_test.txt
*	X_train.txt: Training set
*	y_train.txt: Training activity labels
*	subject_train.txt: Each row identifies the subject who performed the activity for each corresponding line of the training set
*	X_test.txt: Test set
*	y_test.txt: Test activity labels
*	subject_test.txt: Each row identifies the subject who performed the activity for each row in the test set
 
3.	Combine the training and the test sets as well as their subject and activity labels.  This leads to one data frame which has 10299 rows of 563 variables.
4.	Find the columns that contain the mean and standard deviation and keep only these measurements.  This left us with 66 variables.  
5.	Use descriptive names for the activities by substituting the numbers for the strings found in activity_labels.txt. 
6.	Then, the variable names are cleaned up further.
7.	Lastly, the script creates a second, independent tidy data set with the average of each variable for each activity and each subject.  This file contains 180 rows of 66 variables as specified below:

[1] "subject_num"                       "activity"                          "timebodyacc.mean.x"               
 [4] "timebodyacc.mean.y"                "timebodyacc.mean.z"                "timebodyacc.std.x"                
 [7] "timebodyacc.correlation.x,z"       "timebodyacc.correlation.y,z"       "timegravityacc.mean.x"            
[10] "timegravityacc.mean.y"             "timegravityacc.mean.z"             "timegravityacc.std.x"             
[13] "timegravityacc.correlation.x,z"    "timegravityacc.correlation.y,z"    "timebodyaccjerk.mean.x"           
[16] "timebodyaccjerk.mean.y"            "timebodyaccjerk.mean.z"            "timebodyaccjerk.std.x"            
[19] "timebodyaccjerk.correlation.x,z"   "timebodyaccjerk.correlation.y,z"   "timebodygyro.mean.x"              
[22] "timebodygyro.mean.y"               "timebodygyro.mean.z"               "timebodygyro.std.x"               
[25] "timebodygyro.correlation.x,z"      "timebodygyro.correlation.y,z"      "timebodygyrojerk.mean.x"          
[28] "timebodygyrojerk.mean.y"           "timebodygyrojerk.mean.z"           "timebodygyrojerk.std.x"           
[31] "timebodygyrojerk.correlation.x,z"  "timebodygyrojerk.correlation.y,z"  "timebodyaccmag.arcoeff3"          
[34] "timebodyaccmag.arcoeff4"           "timegravityaccmag.arcoeff3"        "timegravityaccmag.arcoeff4"       
[37] "timebodyaccjerkmag.arcoeff3"       "timebodyaccjerkmag.arcoeff4"       "timebodygyromag.arcoeff3"         
[40] "timebodygyromag.arcoeff4"          "timebodygyrojerkmag.arcoeff3"      "timebodygyrojerkmag.arcoeff4"     
[43] "freqbodyacc.mean.x"                "freqbodyacc.mean.y"                "freqbodyacc.mean.z"               
[46] "freqbodyacc.std.x"                 "freqbodyacc.bandsenergy.1,24"      "freqbodyacc.bandsenergy.25,48"    
[49] "freqbodyaccjerk.mean.x"            "freqbodyaccjerk.mean.y"            "freqbodyaccjerk.mean.z"           
[52] "freqbodyaccjerk.std.x"             "freqbodyaccjerk.bandsenergy.1,24"  "freqbodyaccjerk.bandsenergy.25,48"
[55] "freqbodygyro.mean.x"               "freqbodygyro.mean.y"               "freqbodygyro.mean.z"              
[58] "freqbodygyro.std.x"                "freqbodygyro.bandsenergy.1,24"     "freqbodygyro.bandsenergy.25,48"   
[61] "freqbodyaccmag.skewness"           "freqbodyaccmag.kurtosis"           "freqbodybodyaccjerkmag.skewness"  
[64] "freqbodybodyaccjerkmag.kurtosis"   "freqbodybodygyromag.skewness"      "freqbodybodygyromag.kurtosis"     


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
[2] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

