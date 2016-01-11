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

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAccMagnitude and timeGravityAccMagnitude) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerkMagnitude and timeBodyGyroJerkMagnitude).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing the relative variable with 'freq' names. (Note the 'f' to indicate frequency domain signals). 

* `timeBodyAccMagnitudeMean` - Mean of the body acceleration signal magnitude
* `timeBodyAccMagnitudeStdDev` - Standard deviation of the body acceleration signal magnitude
* `timeGravityAccMagnitudeMean` - Mean of the gravity acceleration signal magnitude
* `timeGravityAccMagnitudeStdDev` - Standard deviation of the gravity acceleration signal magnitude
* `timeBodyAccJerkMagnitudeMean` - Mean of the Jerk signal magnitude
* `timeBodyAccJerkMagnitudeStdDev` - Standard deviation of the Jerk signal magnitude
* `timeBodyGyroMagnitudeMean` - Mean of the Gyro signal magnitude
* `timeBodyGyroMagnitudeStdDev` - Standard deviation of the Gyro signal magnitude
* `timeBodyGyroJerkMagnitudeMean` - Mean of the Gyro Jerk signal magnitude
* `timeBodyGyroJerkMagnitudeStdDev` - Standard deviation of the Gyro Jerk signal magnitude
* `freqBodyAccMagnitudeMean` - Mean of FFT of the body acceleration signal magnitude
* `freqBodyAccMagnitudeStdDev` - Standard deviation of the FFT of the body acceleration signal magnitude
* `freqBodyAccJerkMagnitudeMean` - Mean of FFT of the Jerk signal magnitude
* `freqBodyAccJerkMagnitudeStdDev` - Standard deviation of the FFT of the Jerk signal magnitude
* `freqBodyGyroMagnitudeMean` - Mean of FFT of the Gyro signal magnitude
* `freqBodyGyroMagnitudeStdDev` - Standard deviation of the FFT of the Gyro signal magnitude
* `freqBodyGyroJerkMagnitudeMean` - Mean of FFT of the Gyro Jerk signal magnitude
* `freqBodyGyroJerkMagnitudeStdDev` - Standard deviation of the FFT of the Gyro Jerk signal magnitude
* `activityType` - Activity as in the next section

## Activity Labels

* `WALKING`: subject was walking during the test
* `WALKING_UPSTAIRS`: subject was walking up a staircase during the test
* `WALKING_DOWNSTAIRS`: subject was walking down a staircase during the test
* `SITTING`: subject was sitting during the test
* `STANDING`: subject was standing during the test
* `LAYING`: subject was laying down during the test
