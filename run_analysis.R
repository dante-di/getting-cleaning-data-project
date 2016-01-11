################
# Loading Data #
################

# Data Download
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")
#unzip
unzip(zipfile="./data/Dataset.zip",exdir="./data")
#set working directory to the unziped dataset location
setwd("./data/UCI HAR Dataset/")

##################################################################
# 1. Merge the training and the test sets to create one data set #
##################################################################

# Read the data files
features = read.table('./features.txt',header=FALSE);
activityType = read.table('./activity_labels.txt',header=FALSE);
subjectTrain = read.table('./train/subject_train.txt',header=FALSE);
xTrain = read.table('./train/X_train.txt',header=FALSE);
yTrain = read.table('./train/y_train.txt',header=FALSE);
# Column names
colnames(activityType) = c('activityId','activityType');
colnames(subjectTrain) = "subjectId";
colnames(xTrain) = features[,2]; 
colnames(yTrain) = "activityId";
# Merging yTrain, subjectTrain, and xTrain in a unique dataset
trainingData = cbind(yTrain,subjectTrain,xTrain);

# Read in the test files
subjectTest = read.table('./test/subject_test.txt',header=FALSE);
xTest = read.table('./test/X_test.txt',header=FALSE);
yTest = read.table('./test/y_test.txt',header=FALSE);
# Column names
colnames(subjectTest) = "subjectId";
colnames(xTest) = features[,2]; 
colnames(yTest) = "activityId";
# Merging xTest, yTest and subjectTest in a unique dataset
testData = cbind(yTest,subjectTest,xTest);

# Merging training and test data
finalData = rbind(trainingData,testData);

# Column name's vector
colNames  = colnames(finalData); 

############################################################################################
# 2. Extract only the measurements on the mean and standard deviation for each measurement #
############################################################################################

# TRUE values for the ID, mean() & stddev() columns and FALSE for others
logicalVector = (grepl("activity..",colNames) | 
                   grepl("subject..",colNames) | 
                   grepl("-mean..",colNames) & 
                   !grepl("-meanFreq..",colNames) & 
                   !grepl("mean..-",colNames) | 
                   grepl("-std..",colNames) & 
                   !grepl("-std()..-",colNames));

# Keep only desired columns
finalData = finalData[logicalVector==TRUE];

############################################################################
# 3. Use descriptive activity names to name the activities in the data set #
############################################################################

# Merge for descriptive activity names
finalData = merge(finalData,activityType,by='activityId',all.x=TRUE);

# Update colNames vector
colNames  = colnames(finalData); 

########################################################################
# 4. Appropriately labels the data set with descriptive variable names #
########################################################################

# Cleaning variable names
for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std$","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};

# Cleaned column name for finalData set
colnames(finalData) = colNames;

######################################################################################################################
# 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject #
######################################################################################################################

# Remove the activityType column
finalDataNoActivityType = finalData[,names(finalData) != 'activityType']

# Summarizing
tidyData = aggregate(finalDataNoActivityType[,names(finalDataNoActivityType) != c('activityId','subjectId')],
                        by=list(activityId=finalDataNoActivityType$activityId,subjectId = finalDataNoActivityType$subjectId),mean)

# Merging with activityType
tidyData = merge(tidyData,activityType,by='activityId',all.x=TRUE)

# Export the tidyData set
setwd("../..") #root of the project
write.table(tidyData, file = "./tidydata.txt",row.name=FALSE)
