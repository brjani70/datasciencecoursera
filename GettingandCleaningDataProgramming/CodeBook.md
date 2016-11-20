# Getting and Cleaning Programming Assignment CodeBook

The run_analysis.R file does the following 5 steps as outlined by the course programming assignment.

* All '..._train' and '..._test' datasets were merged using the rbind function. 
* The mean and standard deviation measure columns are extracted from the whole dataframe. After extracting these columns, they are given the correct names as per the 'features' text file.
* Activity data is represented by column values 1:6, so I take the activity names and IDs from the 'activity_labels' text file and they are substituted in the dataframe.
* On the whole dataframe, undescriptive/abbreviated column names are replaced and corrected.
* I generate A final dataframe with all the averages for each subject and activity type, named 'averages_data' - a text file.

# Variables

* x_train
* y_train
* x_test
* y_test
* subject_train
* subject_test 
* The variables names above refer to the data from the downloaded files
* ----------------------------------------------------------------------
* x_dataframe, y_dataframe and subject_dataframe merge/append the test and train tables together.
* The 'features' table refers to the 'features' text file that has the correct names for 'x_dataframe', which are applied to the column names stored in 'Mean_StandardDeviation_Feature'.
* The 'activity_labels' table does the same with 'y_dataframe'.
* 'FINAL_data' merges x_dataframe, y_dataframe and subject_dataframe together via the cbind function.
* 'averages_data' refers to the final averages output via a text file.