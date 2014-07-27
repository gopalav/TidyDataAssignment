# This script processes dataset collected from Samsung Galaxy S II and prepares a tidy dataset containing
# subject id, activity name and the mean of a lot of variables


# Load the required library reshape2
print("Loading required 'reshape2' library")
library(reshape2)

# Step1: Read all the feature names into a variable
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("feature_id", "feature_name"))

print ("Cleaning feature names ...")

# Step2: The feature names are not readable.  Clean them by giving more descriptive names using gsub function
feature_names <-  gsub("BodyBody","Body",features$feature_name)
feature_names <-  gsub("tBody","TimeforBody",feature_names)
feature_names <-  gsub("fBody","FFTforBody",feature_names)
feature_names <-  gsub("Acc","Acceleration",feature_names)
feature_names <-  gsub("tGravity","TimeforGravity",feature_names)
feature_names <-  gsub("-X","inX",feature_names)
feature_names <-  gsub("-Y","inY",feature_names)
feature_names <-  gsub("-Z","inZ",feature_names)
feature_names <-  gsub("-mean","Mean",feature_names)
feature_names <-  gsub("-std","Std",feature_names)
features_means <-  gsub("[[:punct:]]",".",grep("Mean\\(\\)", feature_names, value=TRUE))
features_stds <- gsub("[[:punct:]]",".",grep("Std\\(\\)", feature_names, value=TRUE))

# Step3: Read all the activity names into a variable
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("ActivityId", "ActivityName"))

# Step4: Read all the test data and combine them
print ("Reading test data ...")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("SubjectId"))
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt", col.names=feature_names)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",col.names = c("ActivityId"))
summary_test <- cbind(subject_test, y_test, x_test)

# Step5: Read all the training data and combine them
print ("Reading training data ...")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("SubjectId"))
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt", col.names=feature_names)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",col.names = c("ActivityId"))
summary_train <- cbind(subject_train, y_train, x_train)

# Step6: Combine both test and training data using rbind
print ("Merging test and training data ...")
merged_data <- rbind(summary_test, summary_train)

# Step7: Merge with the activity names using activity id as the key
merged_data <- merge(merged_data, activities, by = "ActivityId")

# Step8: Filter only the columns with mean and std values
print ("Filtering mean and std data ...")
filtered_cols <- c("SubjectId", "ActivityName", features_means, features_stds)
filtered_data <- merged_data[,filtered_cols]

# Step8: Now that we have filtered data, use melt and dcast to reshape the data to 
# calculate means by subject id and activity name
print ("Preparing tidy data ...")
melted_data <- melt(filtered_data,id.vars = c("SubjectId","ActivityName"))
tidy_data <- dcast(melted_data, SubjectId+ActivityName ~ variable, mean)

# Step9: Save the tidy data object to an external file to submit
print ("Saving tidy data to file ...")
write.table(tidy_data,file="TidyData.txt",row.names=FALSE,sep=",", append=FALSE)

# Step10: Print the first 5 lines of the tidy data as a sample
print ("Printing first 5 lines of tidy data ...")
print(head(tidy_data, 5))