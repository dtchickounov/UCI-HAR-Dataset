Changing and testing

#STEP 1:
#dowloading and saving 3 txt files for the train data: 

subject_train.txt <- read.table(".\\subject_train.txt")
y_train.txt <- read.table(".\\y_train.txt")
X_train.txt <- read.table(".\\X_train.txt")

#dowloading and saving 3 txt files for the test data: 

subject_test.txt <- read.table(".\\subject_test.txt")
y_test.txt <- read.table(".\\y_test.txt")
X-test.txt <- read.table(".\\X_test.txt")

#cbinding 3 different files for the test data : 

test <- cbind(subject_test.txt, y_test.txt, X_test.txt)

#cbinding 3 different files for the train data: 

train <- cbind(subject_train.txt, y_train.txt, X_train.txt)

#rbinding the train data and test data: 

datatotal <- rbind(train, test)

#STEP 2: 
#choosing the relevant columns (variables) that contain the
#measurements on the mean and standard deviation for each measurement:

datacol <- datatotal[, c(1:8)]

#STEP 3 (in the assignment it's step 4): 
#labeling the data set with descriptive variable names: 

names(datacol) <- c("subjectID", "activities", 
                "tBodyAcc_mean_X", "tBodyAcc_mean_Y", "tBodyAcc_mean_Z", 
                "tBodyAcc-std-X", "tBodyAcc-std-Y", "tBodyAcc-std-Z")

#STEP 4 (in the assignment it's step 3): 
#using descriptive activity names to name the activities in the data set
#by extracting the labels and merging them with their corresponding activities' numbers

labels <- read.table("activity_labels.txt")
names(labels) <- c("activities", "descriptions of activities")
mergeddatacol <- merge(datacol, labels, by = "activities", 
                 all = TRUE, sort = FALSE)
#eliminating the first column "activities" and reordering the other columns: 
datacolnew <- mergeddatacol[, c(2, 9, 3:8)]
#renaming the new column "descriptions of activities" back to the original name "activities"
names(datacolnew)[2] <- "activities"

#STEP 5 (the final step)
# Determining the weighted averages of each subjectID and activitiy 
# using melt + dcast method from reshape2 package 

library(reshape2)

melteddata <- melt(datacolnew, id.vars = c("subjectID", "activities"))  
casteddata <- dcast(melteddata, subjectID + activities ~ variable, mean)
