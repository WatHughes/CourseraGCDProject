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
StudentCode - contains the 

So there are 88 columns total. There are 30 test subjects and measurements for each subject for each of the 6 types of activities tested so there are 180 row total.

-------

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.
