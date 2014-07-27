# TidyDataAssignment

This repository contains a script "run_analysis.R", output of the script "TidyData.txt" and a code book "CodeBook.md" to analyze the human activity data collected from Samsung Galaxy S II smartphone.

## Project Setup:
* Checkout this project and copy the "run_analysis.R" file into the working directory of R.
* This script uses the dataset downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.  
* Extract the zip file to the working directory and copy the run_analysis.R to the same working directory of R.

### Directory Structure:
```
<Working directory>
./run_analysis.R
./UCI HAR Dataset/
./UCI HAR Dataset/features.txt
./UCI HAR Dataset/activity_labels.txt
./UCI HAR Dataset/test/subject_test.txt
./UCI HAR Dataset/test/X_test.txt
./UCI HAR Dataset/test/y_test.txt
./UCI HAR Dataset/train/subject_train.txt
./UCI HAR Dataset/train/X_train.txt
./UCI HAR Dataset/train/y_train.txt
```

## Run Project:
* After setting up the project, run the following command at R command prompt "source('./run_analysis.R')" in the R working directory.
* The script will load the information from the features.txt, activity_info.txt and the files from test and train folders in the dataset
* The feature names in features.txt is not in a user friendly format.  So the script will clean the names using more descriptive column names
* The script will the load all activity names into a variable
* Test data is then loaded and combined to prepare a summary_test object
* Train data is loaded and combined to a summary_train object
* The script will combine both the test data and training data
* Script will merge the data with the activity names so that we can use activity names instead of activity ids
* After the full merged data is prepared, script will then extract all mean and std columns to another dataset
* A tidy data is then prepared with the mean of each of the observations per subject and per activity name
* The tidy data is then saved to an external file called "TidyData.txt"
* Script will print the first 5 lines of the tidy data as a sample.

## Output:
* A file "TidyData.txt" is saved in the working directory with the tidy data
* The first 5 lines of tidy data are displayed at the command prompt

## Citations:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.