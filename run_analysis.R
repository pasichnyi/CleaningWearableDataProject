library(dplyr)
library(stringr)

# General function to call perform all stages of analysis
# Steps 1,3,4 are completed via call to the separate create_merged_dataset function
# Steps 2 and 5 are made directly in the main function
run_analysis<-function(dataset_url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"){
    # Merging the training and the test sets to create one data set.
    # It also uses descriptive activity names to name the activities in the data set
    # And appropriately labels the data set with descriptive variable names.
    dataset<-create_merged_dataset(dataset_url)
    
    # Extracts only the measurements on the mean and standard deviation for each measurement.
    # That gets only means() and stds() but skips all Freqs() and Means() for angle()
    means_and_stds<-select(dataset,Type:Subject,grep("(mean|std)(?!Freq)",names(dataset),perl=TRUE))
    print("Subset with means and stds is created.")
    
    # Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    averages<-aggregate(.~Activity+Subject,means_and_stds[-1],mean) %>%
        arrange(Activity,Subject)
    print("Summary with averages is created.")
    
    # Writing down obtained datasets to files
    write.csv(dataset,"fulldata.csv",row.names = FALSE)
    write.csv(means_and_stds,"means_and_stds.csv",row.names = FALSE)
    write.csv(averages,"averages.csv",row.names = FALSE)
    print("Files with tidy data are created. Finishing.")
}


# Merges the training and the test sets to create one data set. Tidies the obtained set up.
create_merged_dataset<-function(dataset_url){

    # Memorizing current location
    original_wd<-getwd()
    
    # Downloading and unzipping archive with raw_data
    print("Downloading raw dataset from the defined url:")
    download.file(url=dataset_url,destfile = "raw_data.zip",cacheOK = TRUE)
    unzip("raw_data.zip")
    
    setwd("UCI HAR Dataset")
          
    # Reading common list of labels and features
    activity_labels<-read.table("activity_labels.txt")
    features<-read.table("features.txt")
    
    # Moving to the train subfolder and reading in raw data
    print("Reading in the train data...")
    setwd("train")
    subject_train<-read.table("subject_train.txt")
    y_train<-read.table("y_train.txt")
    X_train<-read.table("X_train.txt",header=FALSE,colClasses = numeric())
    setwd("..")
    
    # Moving to the test subfolder and reading in raw data
    print("Reading in the test data...")
    setwd("test")
    subject_test<-read.table("subject_test.txt")
    y_test<-read.table("y_test.txt")
    X_test<-read.table("X_test.txt",header=FALSE,colClasses = numeric())
    setwd("..")
    
    # Merging read data frames into one single merged_df
    print("Merging the train and test datasets...")
    train_df<-cbind(Type="train",y_train,subject_train,X_train)
    test_df<-cbind(Type="test",y_test,subject_test,X_test)
    merged_df<-rbind(train_df,test_df)
    
    # Setting up names for the first columns
    names(merged_df)[2:3]<-c("Activity","Subject")
    # Making Activity column more meaningful (substituting category ids to category names)
    merged_df<-mutate(merged_df,Activity=activity_labels[Activity,2])
    # and nicer (lowering case)
    levels(merged_df$Activity)<-str_to_lower(levels(merged_df$Activity))
    
    # Factorising subjects to transform integer variables to categoric ones
    merged_df<-mutate(merged_df,Subject=factor(Subject))
    
    # And the names for the rest columns standing for different collected features
    names(merged_df)[-(1:3)]<-make.names(levels(features[,2])[features[,2]],unique = TRUE)
    # Removing extra repeating dots after conversion of the feature names
    names(merged_df)<-gsub("[.]+",".",names(merged_df))
    # Removing extra dot at the end of the feature names
    names(merged_df)<-gsub("\\.$","",names(merged_df))
    # Removing repeating BodyBody in some of the feature names
    names(merged_df)<-gsub("(Body)\\1","Body",names(merged_df))
    
    # Arranging final dataset by Type, Activity, Subject
    merged_df<-arrange(merged_df,Type, Activity, Subject)
    
    # Returning to the original working directory
    print("Initial dataset is created and arranged.")
    setwd(original_wd)
    merged_df
}