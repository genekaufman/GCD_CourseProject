---
title: "CodeBook.md"
author: "Gene Kaufman"
date: "December 26, 2015"
output: html_document
---

### Purpose of this document
This codebook describes the summarized data contained in tidy_data.txt. The data 
file is a summary of the combined test and train data furnished by Smartlab (www.smartlab.ws) (Original data file available at [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]( 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip))

The data file consists of 66 measurements for a specified subject and activity, for a total of 68 fields per line. This summary file contains the mean for each measurement.

### Fields

1.	"**Subject**" 
  + integer in range 1-30 indicating subject
2.	"**Activity**" 
  + character field indicating Activity type - limited to values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
3.	"**mean.tBodyAcc.mean...X**"
4.	"**mean.tBodyAcc.mean...Y**"
5.	"**mean.tBodyAcc.mean...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of tBodyAcc-mean-XYZ
6.	"**mean.tBodyAcc.std...X**"
7.	"**mean.tBodyAcc.std...Y**"
8.	"**mean.tBodyAcc.std...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of tBodyAcc-std-XYZ
9.	"**mean.tGravityAcc.mean...X**"
10.	"**mean.tGravityAcc.mean...Y**"
11.	"**mean.tGravityAcc.mean...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of tGravityAcc-mean-XYZ
12.	"**mean.tGravityAcc.std...X**"
13.	"**mean.tGravityAcc.std...Y**"
14.	"**mean.tGravityAcc.std...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of tGravityAcc-std-XYZ
15.	"**mean.tBodyAccJerk.mean...X**"
16.	"**mean.tBodyAccJerk.mean...Y**"
17.	"**mean.tBodyAccJerk.mean...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of tBodyAccJerk-mean-XYZ
18.	"**mean.tBodyAccJerk.std...X**"
19.	"**mean.tBodyAccJerk.std...Y**"
20.	"**mean.tBodyAccJerk.std...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of tBodyAccJerk-std-XYZ
21.	"**mean.tBodyGyro.mean...X**"
22.	"**mean.tBodyGyro.mean...Y**"
23.	"**mean.tBodyGyro.mean...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of tBodyGyro-mean-XYZ
24.	"**mean.tBodyGyro.std...X**"
25.	"**mean.tBodyGyro.std...Y**"
26.	"**mean.tBodyGyro.std...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of tBodyGyro-std-XYZ
27.	"**mean.tBodyGyroJerk.mean...X**"
28.	"**mean.tBodyGyroJerk.mean...Y**"
29.	"**mean.tBodyGyroJerk.mean...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of tBodyGyroJerk-mean-XYZ
30.	"**mean.tBodyGyroJerk.std...X**"
31.	"**mean.tBodyGyroJerk.std...Y**"
32.	"**mean.tBodyGyroJerk.std...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of tBodyGyroJerk-std-XYZ
33.	"**mean.tBodyAccMag.mean..**"
 + numeric field indicating mean of tBodyAccMag-mean
34.	"**mean.tBodyAccMag.std..**"
 + numeric field indicating mean of tBodyAccMag-std
35.	"**mean.tGravityAccMag.mean..**"
 + numeric field indicating mean of tGravityAccMag-mean
36.	"**mean.tGravityAccMag.std..**"
 + numeric field indicating mean of tGravityAccMag-std
37.	"**mean.tBodyAccJerkMag.mean..**"
 + numeric field indicating mean of tBodyAccJerkMag-mean
38.	"**mean.tBodyAccJerkMag.std..**"
 + numeric field indicating mean of tBodyAccJerkMag-std
39.	"**mean.tBodyGyroMag.mean..**"
 + numeric field indicating mean of tBodyGyroMag-mean
40.	"**mean.tBodyGyroMag.std..**"
 + numeric field indicating mean of tBodyGyroMag-std
41.	"**mean.tBodyGyroJerkMag.mean..**"
 + numeric field indicating mean of tBodyGyroJerkMag-mean
42.	"**mean.tBodyGyroJerkMag.std..**"
 + numeric field indicating mean of tBodyGyroJerkMag-std
43.	"**mean.fBodyAcc.mean...X**"
44.	"**mean.fBodyAcc.mean...Y**"
45.	"**mean.fBodyAcc.mean...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of fBodyAcc-mean-XYZ
46.	"**mean.fBodyAcc.std...X**"
47.	"**mean.fBodyAcc.std...Y**"
48.	"**mean.fBodyAcc.std...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of fBodyAcc-std-XYZ
49.	"**mean.fBodyAccJerk.mean...X**"
50.	"**mean.fBodyAccJerk.mean...Y**"
51.	"**mean.fBodyAccJerk.mean...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of fBodyAccJerk-mean-XYZ
52.	"**mean.fBodyAccJerk.std...X**"
53.	"**mean.fBodyAccJerk.std...Y**"
54.	"**mean.fBodyAccJerk.std...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of fBodyAccJerk-std-XYZ
55.	"**mean.fBodyGyro.mean...X**"
56.	"**mean.fBodyGyro.mean...Y**"
57.	"**mean.fBodyGyro.mean...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of fBodyGyro-mean-XYZ
58.	"**mean.fBodyGyro.std...X**"
59.	"**mean.fBodyGyro.std...Y**"
60.	"**mean.fBodyGyro.std...Z**"
 + numeric fields indicating mean for each axis (X,Y,Z) of fBodyGyro-mean-XYZ
61.	"**mean.fBodyAccMag.mean..**"
 + numeric field indicating mean of fBodyAccMag-mean
62.	"**mean.fBodyAccMag.std..**"
 + numeric field indicating mean of fBodyAccMag-std
63.	"**mean.fBodyBodyAccJerkMag.mean..**"
 + numeric field indicating mean of fBodyBodyAccJerkMag-mean
64.	"**mean.fBodyBodyAccJerkMag.std..**"
 + numeric field indicating mean of fBodyBodyAccJerkMag-std
65.	"**mean.fBodyBodyGyroMag.mean..**"
 + numeric field indicating mean of fBodyBodyGyroMag-mean
66.	"**mean.fBodyBodyGyroMag.std..**"
 + numeric field indicating mean of fBodyBodyGyroMag-std
67.	"**mean.fBodyBodyGyroJerkMag.mean..**"
 + numeric field indicating mean of fBodyBodyGyroJerkMag-mean
68.	"**mean.fBodyBodyGyroJerkMag.std..**"
 + numeric field indicating mean of fBodyBodyGyroJerkMag-std
