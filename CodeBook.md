## Data description
### Data origin
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Initial dataset for this project is <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

It's original source is located at
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The initial set of variables that were estimated from these signals are:

Variable|Meaning
--------|-------
mean()| Mean value
std()|Standard deviation
mad()|Median absolute deviation 
max()|Largest value in array
min()|Smallest value in array
sma()|Signal magnitude area
energy()|Energy measure. Sum of the squares divided by the number of values. 
iqr()|Interquartile range 
entropy()|Signal entropy
arCoeff()|Autorregresion coefficients with Burg order equal to 4
correlation()|correlation coefficient between two signals
maxInds()|index of the frequency component with largest magnitude
meanFreq()|Weighted average of the frequency components to obtain a mean frequency
skewness()|skewness of the frequency domain signal 
kurtosis()|kurtosis of the frequency domain signal 
bandsEnergy()|Energy of a frequency interval within the 64 bins of the FFT of each window.
angle()|Angle between two vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean

* tBodyAccMean

* tBodyAccJerkMean

* tBodyGyroMean

* tBodyGyroJerkMean

### Variable description
For the purpose of this project only means and standard deviations were selected. The summarizing variables for the angle() variables were not included. Feature have "mean" and "std" in their names correspondingly. For the 3-axial raw signals X, Y and Z are collected separetely (coded as XYZ).

**Time** domain signals start with **t**, while **frequency** domain signals with **f**.

The obtained subsets have following variables:

Variable name        | Variable description
---------------      | --------------------
Type                 | Factor variable meaning the origin of the observation, can be "train" or "test"
Activity             | Factor variable meaning the type of activity performed in the observation. Can be of six types - "laying", "sitting", "standing", "walking", "walking_downstairs", "walking_upstairs".
Subject              | Factor variable for the observed subjects, varies in 1-30.
tBodyAcc        | Body linear acceleration signal, mean and std for 3-axis (XYZ)
tGravityAcc     | Gravity acceleration signal, mean and std for 3-axis (XYZ)
tBodyAccJerk    | Body linear acceleration Jerk signal, mean and std for 3-axis (XYZ)
tBodyGyro       | Body angular velocity signal, mean and std for 3-axis (XYZ)
tBodyGyroJerk   | Body angular velocity Jerk signal, mean and std for 3-axis (XYZ)
tBodyAccMag     | Body linear acceleration signal magnitude, mean and std
tGravityAccMag  | Gravity acceleration signal magnitude, mean and std
tBodyAccJerkMag | Body linear acceleration Jerk signal magnitude, mean and std
tBodyGyroMag    | Body angular velocity signal magnitude, mean and std
tBodyGyroJerkMag| Body angular velocity Jerk signal magnitude, mean and std
fBodyAcc        | Body linear acceleration signal, mean and std for 3-axis (XYZ)
fBodyAccJerk    | Body linear acceleration Jerk signal, mean and std for 3-axis (XYZ)
fBodyGyro       | Body angular velocity signal signal, mean and std for 3-axis (XYZ)
fBodyAccMag     | Body linear acceleration signal magnitude, mean and std
fBodyAccJerkMag | Body linear acceleration Jerk signal magnitude, mean and std
fBodyGyroMag    | Body angular velocity signal magnitude, mean and std
fBodyGyroJerkMag| Body angular velocity Jerk signal magnitude, mean and std