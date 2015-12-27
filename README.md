---
title: "README.md"
author: "Gene Kaufman"
date: "December 26, 2015"
---
# Coursera - Getting and Cleaning Data 
## Course Project

### Assignment
Download data produced from a study involving Human Activity Recognition using Smartphones, conducted by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio and Luca Oneto at DITEN - Università degli Studi di Genova. (Data file available at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)).

Data file consisted of 2 sets of data (named Test and Train), which were to be merged after first integrating activity names and renaming variables. The merged data was to include only the variables that had a mean or standard deviation. Finally, produce an output file with tidy data consisting of averages for each measurement for each subject and activity.

### My approach (code completely contained in run_analysis.R):
1. Download data zip file if necessary, to a directory out of current working directory (so that wd could be pushed to github if desired without uploading large zip file)  
2. Copy data zip file to current working directory and unzip files (only if files are not already in directory)  
3. Read in all data files  
4. For each sub-dataset (TEST, TRAIN):  
4a. Build subset of data with only variables that contain "-mean()" or "-std()"   
4b. Use names() to rename columns to match variable names as described in features.txt  
4c. Build matrix with human-friendly activity label specified, based on activity ID in original data file  
4d. Use cbind to create new data frame with original data, subject and human-friendly activity label  
5. Use rbind to combine TEST and TRAIN datasets into a single dataset
6. Use dplyr to create new data frame grouped by Subject and Activity, determine mean for each measurement
7. Use sapply and names() to rename variables with "mean-" prefaced
8. Write out tidy data file using write.table()  
8a. To load file: `read.table("tidy_data.txt",header=TRUE)`

### Files supporting this project:
[README.md](README.md) - This document  
[CodeBook.md](CodeBook.md) - Describes fields in tidy data set  
[run_analysis.R](run_analysis.R) - R Script to read in original dataset, process and produce tidy data file  
[tidy_data.txt](tidy_data.txt) - Output file produced according to tidy data principles   