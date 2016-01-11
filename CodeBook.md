# Code Book

This code book summarizes the data source, the data processing and the resulting data fields in `tidydata.txt`.

## Description

The dataset consists of measures collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data Processing
The R script called `run_analysis.R` does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Identifiers

* `activityId` - The type of activity performed when the corresponding measurements were taken
* `subjectId` - The ID of the test subject

## Measurements

* `timeBodyAccMagnitudeMean`
* `timeBodyAccMagnitudeStdDev`
* `timeGravityAccMagnitudeMean`
* `timeGravityAccMagnitudeStdDev`
* `timeBodyAccJerkMagnitudeMean`
* `timeBodyAccJerkMagnitudeStdDev`
* `timeBodyGyroMagnitudeMean`
* `timeBodyGyroMagnitudeStdDev`
* `timeBodyGyroJerkMagnitudeMean`
* `timeBodyGyroJerkMagnitudeStdDev`
* `freqBodyAccMagnitudeMean`
* `freqBodyAccMagnitudeStdDev`
* `freqBodyAccJerkMagnitudeMean`
* `freqBodyAccJerkMagnitudeStdDev`
* `freqBodyGyroMagnitudeMean`
* `freqBodyGyroMagnitudeStdDev`
* `freqBodyGyroJerkMagnitudeMean`
* `freqBodyGyroJerkMagnitudeStdDev`
* `activityType`

## Activity Labels

* `WALKING`: subject was walking during the test
* `WALKING_UPSTAIRS`: subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS`: subject was walking down a staircase during the test
* `SITTING`: subject was sitting during the test
* `STANDING`: subject was standing during the test
* `LAYING`: subject was laying down during the test
