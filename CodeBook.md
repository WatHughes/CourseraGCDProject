---
title: "TidyData Text Data Documentation"
author: "Wat Hughes"
date: "June 21, 2015"
output: html_document
---


TidyData.txt contains a tidy data set that summarizes some of the measurements of volunteer test subject movement. The original source of that data is http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones which includes background information on how the trials were conducted and also updated data for download.

The source data obtained from that website is not the raw data from the accelerometers and gyroscopes. Rather it has been preprocessed in a number of standard ways. See the above link for more information on the preprocessing. That data set offers 561 measurements and includes dimensions to record both the test subject and the activity that generated each measurement.

This Tidy Data Set is the mean of each of the 86 measurements from that set where the measurement description provided by the link above contains "mean" or "std" (case insensitive) computed for each activity for each subject.

Each row of this data set contains all 86 summarized variables for 1 particular combination of test subject and activity. The first two columns are the dimension columns:

Activity.Name - contains the text of the activity description from the original data

SubjectCode - contains the integer identifier from the original data for each subject

The remaining 86 columns contain 1 measurement each for each subject - activity combination. The names are the same as the feature names in the original data, except cleaned up for use as
names in R. *These variables are:*

tBodyAcc.mean...X
tBodyAcc.mean...Y
tBodyAcc.mean...Z
tBodyAcc.std...X
tBodyAcc.std...Y
tBodyAcc.std...Z
tGravityAcc.mean...X
tGravityAcc.mean...Y
tGravityAcc.mean...Z
tGravityAcc.std...X
tGravityAcc.std...Y
tGravityAcc.std...Z
tBodyAccJerk.mean...X
tBodyAccJerk.mean...Y
tBodyAccJerk.mean...Z
tBodyAccJerk.std...X
tBodyAccJerk.std...Y
tBodyAccJerk.std...Z
tBodyGyro.mean...X
tBodyGyro.mean...Y
tBodyGyro.mean...Z
tBodyGyro.std...X
tBodyGyro.std...Y
tBodyGyro.std...Z
tBodyGyroJerk.mean...X
tBodyGyroJerk.mean...Y
tBodyGyroJerk.mean...Z
tBodyGyroJerk.std...X
tBodyGyroJerk.std...Y
tBodyGyroJerk.std...Z
tBodyAccMag.mean..
tBodyAccMag.std..
tGravityAccMag.mean..
tGravityAccMag.std..
tBodyAccJerkMag.mean..
tBodyAccJerkMag.std..
tBodyGyroMag.mean..
tBodyGyroMag.std..
tBodyGyroJerkMag.mean..
tBodyGyroJerkMag.std..
fBodyAcc.mean...X
fBodyAcc.mean...Y
fBodyAcc.mean...Z
fBodyAcc.std...X
fBodyAcc.std...Y
fBodyAcc.std...Z
fBodyAcc.meanFreq...X
fBodyAcc.meanFreq...Y
fBodyAcc.meanFreq...Z
fBodyAccJerk.mean...X
fBodyAccJerk.mean...Y
fBodyAccJerk.mean...Z
fBodyAccJerk.std...X
fBodyAccJerk.std...Y
fBodyAccJerk.std...Z
fBodyAccJerk.meanFreq...X
fBodyAccJerk.meanFreq...Y
fBodyAccJerk.meanFreq...Z
fBodyGyro.mean...X
fBodyGyro.mean...Y
fBodyGyro.mean...Z
fBodyGyro.std...X
fBodyGyro.std...Y
fBodyGyro.std...Z
fBodyGyro.meanFreq...X
fBodyGyro.meanFreq...Y
fBodyGyro.meanFreq...Z
fBodyAccMag.mean..
fBodyAccMag.std..
fBodyAccMag.meanFreq..
fBodyBodyAccJerkMag.mean..
fBodyBodyAccJerkMag.std..
fBodyBodyAccJerkMag.meanFreq..
fBodyBodyGyroMag.mean..
fBodyBodyGyroMag.std..
fBodyBodyGyroMag.meanFreq..
fBodyBodyGyroJerkMag.mean..
fBodyBodyGyroJerkMag.std..
fBodyBodyGyroJerkMag.meanFreq..
angle.tBodyAccMean.gravity.
angle.tBodyAccJerkMean..gravityMean.
angle.tBodyGyroMean.gravityMean.
angle.tBodyGyroJerkMean.gravityMean.
angle.X.gravityMean.
angle.Y.gravityMean.
angle.Z.gravityMean.

The original units of each measurement were washed out by the original author's
preprocessing. In particular, note the follow (empahsis added by me):

### Each of the original source data measurements were normalized from -1 to 1!

There are 2 + 86 = 88 columns total. There are 30 test subjects and measurements for each subject for each of the 6 types of activities tested so there are 180 row total.

-------

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.
