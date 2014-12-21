The explanation of the R script in run_analysis.R: 

Computer paramaters for the script: 

Windows 8.1. (64bit) 
R package: 3.1.1 (32bit) 

STEP 1: 
Downloading and saving 3 txt files ("subject_train.txt", "y_train.txt", "X_train.txt") for the train data using read.table function. 
The new datasets are called subject_train.txt, y_train.txt, X_train.txt respectively. 

Downloading and saving 3 txt files ("subject_test.txt", "y_test.txt", "X_test.txt") for the test data using read.table function.
The new datasets are called subject_test, y_test.txt, X_test.txt respectively.

cbinding subject_test, y_test.txt, X_test.txt in that order to create a new dataset called "test" so that the 1st column is the data 
from subject_test.txt (that corresponds to subjectID), 2nd column is y_test.txt (that corresponds to labels), 3rd and other columns 
are are from X_test.txt (that corresponds to the measurements) 

cbinding subject_train.txt, y_train.txt, X_train.txt in this order to create a new dataset called "train" for the train data such that 
the 1st column is the data from subject_train.txt (that corresponds to subjectID), 2nd column is y_train.txt (that corresponds to labels), 
3rd and other columns are are from X_train.txt (that corresponds to the measurements) 

rbinding the "train" data and "test" data. We are adding rows of "test" to "train" into a new variable datatotal. 

This completes the merging the process of Step 1.  

STEP 2: 
Choosing the relevant columns (variables) 1 through 8 that contain the subjects (1st column), activities (2nd column), measurements on the mean 
and standard deviation for each measurement (3rd through 8)

STEP 3: 
Instead of STEP 3 in the assignment, we first do STEP 4 from the assignment (Labelling the data set with descriptive variable names):
"subjectID", "activities", "tBodyAcc_mean_X", "tBodyAcc_mean_Y", "tBodyAcc_mean_Z", "tBodyAcc-std-X", "tBodyAcc-std-Y", "tBodyAcc-std-Z"
For that we need to use names() function. 

STEP 4: 
In the assignment it's STEP 3 (using descriptive activity names to name the activities in the data set)
First, download and save the file "activity_labels.txt" (the new dataset would be called "labels").
Then, name two of its columns as "activities", "descriptions of activities" (so that the 1st column name of the dataset "labels"
corresponds the name of the 1st column in dataset "datacol").
Complete the merge of the two dataframes ("datacol" and "labels") using merge() function by=activities and setting all=TRUE and SORT=False.
The new merged dataframe is "mergeddatacol". 
Eliminate the first column "activities" from "mergeddatacol" and reorder the other columns so that the new 9th column is now 2nd. 
The new dataframe is now called "datacolnew". 
Rename the new column "descriptions of activities" back to the original name: "activities". 

STEP 5: 
To determine the averages of all observation for each subjectID and activity level, we need to use reshape2 R package from the library by using library(reshape2). 
(reshape2 package can be installed by install.package(reshape2). 
Use melt + dcast method to summarise the data by subjectID and activity. ID's are set to "subjectID" and "activities" in the melt function. 
For dcast function we are setting "subjectID + activities" so that we can order our means first by the subject and then by activities. 

End.   




 