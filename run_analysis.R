# Coursera
# Getting and Cleaning Data (getdata-015)
# Course Project

# This implements all the instructions in the project assignment. Some of the steps are
# broken into a preperation phase and a finalization phase. The steps have been ordered
# to make this script easier to follow. Each section of this documents which instruction
# it addresses.

library(dplyr)

getwd() # Verify the current working directory
RawDataRootDir = './UCI HAR Dataset/' # The assignment data download was unzipped into this sub directory

# Prep for instruction 2:
# Extracts only the measurements on the mean and standard deviation for each measurement.
#
# Load the feature names, make them acceptable as names to R, and keep only
# those features whose name includes 'mean' or 'std' anywhere in the name,
# case insensitive.

features=read.table(paste0(RawDataRootDir,'features.txt'),stringsAsFactors = FALSE)
colnames(features)=c('Code','Name')
features[,2]=make.names(features[,2])
str(features) # 561 obs. of 2 variables
featuresOnlyMeanStd=features[grepl('mean',features$Name,ignore.case=TRUE)|grepl('std',features$Name,ignore.case=TRUE),]
str(featuresOnlyMeanStd) # 86 obs. of 2 variables

# Prep for instruction 3:
# Uses descriptive activity names to name the activities in the data set.
#
# Load the activity names and make them acceptable as names to R.

activities=read.table(paste0(RawDataRootDir,'activity_labels.txt'),stringsAsFactors = FALSE)
colnames(activities)=c('Code','Name')
activities[,2]=make.names(activities[,2])
activities
str(activities) # 6 obs. of 2 variables

# Load the training data and then the test data

xtrain=read.table(paste0(RawDataRootDir,'train/x_train.txt'))
str(xtrain)
ytrain=read.table(paste0(RawDataRootDir,'train/y_train.txt'))
str(ytrain)
strain=read.table(paste0(RawDataRootDir,'train/subject_train.txt'))
str(strain)

xtest=read.table(paste0(RawDataRootDir,'test/x_test.txt'))
str(xtest)
ytest=read.table(paste0(RawDataRootDir,'test/y_test.txt'))
str(ytest)
stest=read.table(paste0(RawDataRootDir,'test/subject_test.txt'))
str(stest)

# For instruction 4:
# Appropriately labels the data set with descriptive variable names.

AssignedTrainMeasures=xtrain[,featuresOnlyMeanStd$Code]
colnames(AssignedTrainMeasures)=featuresOnlyMeanStd$Name

AssignedTestMeasures=xtest[,featuresOnlyMeanStd$Code]
colnames(AssignedTestMeasures)=featuresOnlyMeanStd$Name

# Prep for instruction 5:
# ...each variable for each activity and each subject.

AssignedTrainMeasures$ActivityCode=ytrain$V1
AssignedTrainMeasures$SubjectCode=strain$V1
str(AssignedTrainMeasures) # 7352 obs. of  88 variables

AssignedTestMeasures$ActivityCode=ytest$V1
AssignedTestMeasures$SubjectCode=stest$V1
str(AssignedTestMeasures) # 2947 obs. of  88 variables

# For instruction 1:
# Merges the training and the test sets to create one data set.
# Note this completes instructions 1,2, and 4.

AssignedMeasures = tbl_df(rbind(AssignedTestMeasures,AssignedTrainMeasures))
str(AssignedMeasures) # 10299 obs. of  88 variables

# For instruction 5:
# From the data set in step 4, creates a second, independent tidy data set with the
# average of each variable for each activity and each subject.

AssignedMeasures = group_by(AssignedMeasures, ActivityCode,SubjectCode)
TidyData=summarise_each(AssignedMeasures,funs(mean),everything())

# For insturction 3:
# Uses descriptive activity names to name the activities in the data set.

TidyData=inner_join(TidyData,activities,by=c('ActivityCode'='Code'))
str(TidyData) # 180 obs. of  89 variables
TidyData[,1]=TidyData[89] # Put the activity names at the begginning of each row
TidyData$Name=NULL # This column is no longer needed
colnames(TidyData)[1]='Activity.Name' # This is a better column name
str(TidyData) # 180 obs. of  88 variables

# Prepare the upload file

write.table(TidyData,file='TidyData.txt',row.names=FALSE)
