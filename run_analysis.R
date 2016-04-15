run_analysis <- function() {
#*****************************************************************************
# run_analysis.R
#
# This script does the following:
# 1. Merges the training and the test sets to create one data set.
#   561 col/var names are in features.txt
#   561 cols x_test.txt, x_train.txt
# 2. Extracts only the measurements on the mean and standard deviation for 
#    each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
#
#   2016-04-08 whbrown555 - v0r00
#*****************************************************************************
# 0. Housekeeping
#   a. set the working directories for the code and for the data. These will have been set 
#       as environment variables, dsgcdCode and dsgcdData prior to initializing the runtime
#       environment.
    # library(data.table)
    # library(plyr)
    # library(reshape)
    # library(reshape2)
    
    l_dsgcdVars <- Sys.getenv(c("dsgcdCode", "dsgcdData"))
    l_dsgcdCode <- l_dsgcdVars[1]
    l_dsgcdData <- l_dsgcdVars[2]
    l_HARData <- paste0(l_dsgcdData,"/UCI_HAR_Dataset/")
    l_HARData
    setwd(l_dsgcdData)
    setwd("UCI_HAR_Dataset")
    activity_labels <- read.table("activity_labels.txt", quote="\"", comment.char="")
    features <- read.table("features.txt", quote="\"", comment.char="")
    x_test <- read.table("./test/x_test.txt", quote="\"", comment.char="")
    x_train <- read.table("./train/x_train.txt", quote="\"", comment.char="")
    y_test <- read.table("./test/y_test.txt", quote="\"", comment.char="")
    y_train <- read.table("./train/y_train.txt", quote="\"", comment.char="")
    subject_test <- read.table("./test/subject_test.txt", quote="\"", comment.char="")
    subject_train <- read.table("./train/subject_train.txt", quote="\"", comment.char="")



# 1. Merge the training and the test sets to create one data set.
    xm <- rbind(x_test, x_train)
# 4. Appropriately label the data set with descriptive variable names.
    #   I decided to do this first
    features$V2<-gsub("[()]","",features$V2)
    colnames(xm) <- as.vector(features[,2])
# 3. Use descriptive activity names to name the activities in the data set
    #   set colnames in activity_labels
    colnames(activity_labels) <- c("actCode", "actLabel")
    #   combine test and train subjects and name the column appropriately
    sm <- rbind(subject_test,subject_train)
    colnames(sm) <- c("subjectID")
    #   combine test and train activity codes and merge with activity_labels
    ym <- rbind(y_test,y_train)
    colnames(ym) <- c("actCode")
    ymLabels <- merge(ym, activity_labels)
    #   bind the activity labels ('y') to the associated features ('x' values)
    xmClean <- cbind(ymLabels,sm,xm)

# 2. Extract only the measurements on the mean and standard deviation for 
#    each measurement. (I intentionally kept the activity code and label, as well)
    xmCleanMeanCols <- grep("act|subjectID|[Mm]ean|[Ss]td", colnames(xmClean))
    xmCleanAndMean <- xmClean[,xmCleanMeanCols]
    xdpMelt<-melt.data.frame(xmCleanAndMean,id.vars = 1:3,variable_name = "feature_name")
    
    setnames(xdpMelt, "value", "feature_value")
    write.csv(xdpMelt,"./UCI_HAR_FeatureMeanStd.csv",row.names = FALSE, quote = TRUE)
    
# 5. From the resulting data set, create a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.
    xmCleanAndMean$actLabel<-NULL
    xdp<-ddply(xmCleanAndMean,1:2,colMeans)
    xdpLab<-merge(activity_labels,xdp)
    xdpMelt<-melt.data.frame(xdpLab,id.vars = 1:3,variable_name = "feature_name")
    setnames(xdpMelt, "value", "feature_value")
    write.csv(xdpMelt,"./UCI_HAR_Avg_FeatureMeanStd.csv",row.names = FALSE, quote = TRUE)
## END of run_analysis.R
}