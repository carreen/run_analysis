# run_analysis
course subject of getting and cleaning data

This project works with the data collected from the accelerometers from the Samsung Galaxy S smartphone.

## run_analysis.R dose the following things:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## how to run run_analysis.R 
1. put run_analysis.R file in the workding directory
2. download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. put the data folder under ./data directory
4. run the script, a clean data named "cleanUCIdata.txt" will be generated under data directory
   each record contains activity, subject identifier and 73 means of the features

## how run_analysis.R works
1. getting features data from 'features.txt', including reading, filtering only mean and standard deviation variables (not include mean frequency or angle mean), also altering the illegal characters(e.g., '\'). store the ids of features in 'renamev' as vector. 
2. getting acitivity label data from 'activity_labels.txt', store in 'acts' as 2 variable, 6 objcets data frame.
3. reading test data from 3 txt files, use 'ids' from step 1 to filter the features. And finally cbind the variables
4. repeat step 3 with training data
5. merge the data from step 3 & 4, change value of the activities by using 'acts'
6. use aggregate to accomplish objective 5
7. write table to a new txt file

