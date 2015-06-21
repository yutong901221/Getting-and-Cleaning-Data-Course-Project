# Introduction
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

Using read.table() to get data.

# Procedure

* Merges the training and the test sets to create one data set.
merges x_data, y_data and subject_data respectively by rows. Features contains the correct names for the X dataset. Using cbind() to merge a dataset

* Extracts only the measurements on the mean and standard deviation for each measurement. 

* Uses descriptive activity names to name the activities in the data set

* Appropriately labels the data set with descriptive variable names. 

* Creates a tidy data set with the average of each variable for each activity and each subject. Calculating the mean of each variable for each activity and each subject by using aggregate().
