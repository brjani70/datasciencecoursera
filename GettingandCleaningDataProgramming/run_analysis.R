install.packages("dplyr")
install.packages("plyr")

library(dplyr)
library(plyr)

getwd()
setwd("C:/Users/brjani70/datasciencecoursera/GettingandCleaningDataProgramming/UCI HAR Dataset")
# Step 1
# Merging training and test tables to create one dataframe
###############################################################################

x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Appending 'x' tables, 'y' tables, and 'subject' tables together into separate dataframes
x_dataframe <- rbind(x_train, x_test)

y_dataframe <- rbind(y_train, y_test)

subject_dataframe <- rbind(subject_train, subject_test)

# Step 2
# Extract only the measurements on the mean and standard deviation for each measurement
###############################################################################

features <- read.table("features.txt")

# get only columns with mean() or std() in their names
Mean_StandardDeviation_Feature <- grep("-(mean|std)\\(\\)", features[, 2])
class(Mean_StandardDeviation_Feature)
str(Mean_StandardDeviation_Feature)
View(Mean_StandardDeviation_Feature)

# subset the desired columns
x_dataframe <- x_dataframe[, Mean_StandardDeviation_Feature]

# correct the column names
names(x_dataframe) <- features[Mean_StandardDeviation_Feature, 2]

# Step 3
# Use descriptive activity names to name the activities in the data set
###############################################################################

activity_labels <- read.table("activity_labels.txt")

# updating values in activity_labels table with the correct activity names
y_dataframe[, 1] <- activities[y_dataframe[, 1], 2]

# Doing the same for column names
names(y_dataframe) <- "activity"

# Step 4
# Appropriately label the data set with descriptive variable names
###############################################################################

# updating values for column names
names(subject_dataframe) <- "subject"

# binding all the data together into a single dataframe
FINAL_data <- cbind(x_dataframe, y_dataframe, subject_dataframe)

# Step 5
# Create a second, independent tidy data set with the average of each variable for each activity and each subject
###############################################################################

averages_data <- ddply(FINAL_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

setwd("C:/Users/brjani70/datasciencecoursera/GettingandCleaningDataProgramming")
write.table(averages_data, "averages_data.txt", row.name=FALSE)
