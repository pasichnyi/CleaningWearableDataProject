## Summary
This repo is for the Course Project in the "Getting and Cleaning Data" course. It includes 3 files with tidy data (full dataset, subset of means and stds, summary with averages by activities and subjects), the R script for obtaining those from the initial dataset, CodeBook and this README.

## Files
File name          | Description
------------------ | -----------
README.md          | This file
CodeBook.md        | Description of the datasets and its variables
run_analysis.R     | Script to produce tidy data sets
fulldata.txt       | Full data set obtained by merging train and test data and coupling them with activities and subjects
means_and_stds.txt | Subset of the full data - only means and standard deviations are included
averages.txt       | Summary for the means and stds - average is counted for each Activity and Subject

## Instructions
1. Download files from <https://github.com/pasichnyi/CleaningWearableDataProject>

2. Download the data set from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

3. Unzip the data set to the same folder

4. Load RStudio and set your working directory to the same folder as the downloaded files

5. Run the R script

```
source('run_analysis.R')
```

6.The tidy datasets **(fulldata.txt, means_and_stds.txt and averages.txt)** will be saved to the working folder.


## Notes on the script
**Run_analysis.R** aims to perform 5 steps assigned in the task:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


It's implemented in two functions. The main one - **run_analysis(url)** has default parameter **directory** with the name of the directory with the raw dataset and makes call to the **create_merged_dataset(url)**.

Steps 1,3,4 are completed in the **create_merged_dataset** function, while steps 2 and 5 are made directly in the main function **run_analysis**.

All produced files are put to the current working directory.

### Detailed workflow description
1. Main function **run_analysis** launches the **create_merged_dataset** function. Raw data is looked for at the default **directory="UCI HAR Dataset"** if no user parameter is passed to the main function.
2. Function subsequently reads in labels for activities and features from the top extracted directory.
3. Function reads in subjects, activities and signals from the train and test directories.
4. Created dataframes are merged into one single **merged_df** dataframe, with which steps 5-9 are done.
5. Activity column is set up - values are set according to the read labels, case is lowered down.
6. Subject column is factorised to have a proper data type for the column.
7. The features columns are set up:
+ initial labels are created;
+ extra dots are removed;
+ extra "Body" words are removed in case of "BodyBody" in the variable names.
8. Dataset is ordered by Type, Activity and Subject columns.
9. Resulting dataset is returned to the **run_analysis** function as a **dataset** dataframe.
10. Means and stds are subsetted with regular expression, that looks for the "mean" and "std" but eliminates frequencies for those. Result is saved to the **means_and_stds** dataframe.
11. Summary with averages by Activity and Subjects is created to the **averages** dataframe.
12. Obtained datasets are saved to the resulting txt files.