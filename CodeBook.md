#*Human Activity Recognition - Feature Selection Code Book*

-*This document is a subset and adaptation of the features_info.txt file included with the Human Activity Recognition Using Smartphones Dataset, Version 1.0*

-*It describes the variables contained in the modified dataset.*

-**(Document modifications are** _italicized_**)** 

##*The original data was manipulated as follows:*

- *Merged the training and the test sets to create one data set.*

    - *561 col/var names are in features.txt*

    - *561 cols x_test.txt, x_train.txt*

- *Appropriately labeled the data set with descriptive variable names.*

- *Associated (merged) descriptive activity names to name the activities in the data set*

- *Extracted only the measurements on the mean and standard deviation for each measurement.*

- *"melt" 'ed the data frame generating a 'feature_name' and a 'feature_value' column.*

- *Created a second, independent tidy data set with the **average** of each variable for each activity and each subject.*

##*The resulting 'id' and 'measure' columns in the new dataset:*
- *actCode - an integer identifier associated with a particular activity associated with a particular feature vector. Values 1-6, associate with the 'actLabel' column.*
- *actLabel - The text description (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) of the activity code associated with each feature vector.*
- *subjectID - an integer identifier for each of the 30 volunteers who participated in the HAR experiment*
- *feature_name - The description of the feature and its associated summary metric.*
- *feature_value - The average value of the associated 'feature_name' for each unique actCode/subjectID/feature_name combination.*


##*Original Dataset*
> > The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

##*Features*
> > These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> >- tBodyAcc-XYZ
> >- tGravityAcc-XYZ
> >- tBodyAccJerk-XYZ
> >- tBodyGyro-XYZ
> >- tBodyGyroJerk-XYZ
> >- tBodyAccMag
> >- tGravityAccMag
> >- tBodyAccJerkMag
> >- tBodyGyroMag
> >- tBodyGyroJerkMag
> >- fBodyAcc-XYZ
> >- fBodyAccJerk-XYZ
> >- fBodyGyro-XYZ
> >- fBodyAccMag
> >- fBodyAccJerkMag
> >- fBodyGyroMag
> >- fBodyGyroJerkMag

##*Mean and Standard Deviation Metrics*
> > The set of variables that were estimated from these signals are: 

> >- mean(): Mean value
> >- std(): Standard deviation

*<snip original>*

> > Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

> >- gravityMean
> >- tBodyAccMean
> >- tBodyAccJerkMean
> >- tBodyGyroMean
> >- tBodyGyroJerkMean

#*Average the Feature Values for each Activity and Subject*

> > The complete list of variables of each feature vector in this project is available in *'features_mean_std.txt'*
