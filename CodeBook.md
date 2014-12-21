The explanation of all variables in run.analysis.R

STEP 1: 

The following files are extracted from the UCI HAR Dataset/Train folder: 
"subject_train.txt", "y_train.txt", "X_train.txt"
The new variables are created after extracting and saving these datasets: subject_train.txt, y_train.txt, X_train.txt respectively

The following files are extracted from the UCI HAR Dataset/Test folder:
"subject_test.txt", "y_test.txt", "X_test.txt"
The new variables are created after extracting and saving these datasets: subject_test, y_test.txt, X_test.txt respectively

Other new vaiables: test, train. These two variables contain the combination of the test and train data each respectively. 

datatotal variable refers to the merger of test and train data. 

STEP 2: 

In this step we are selecting only the columns with the variables that we need for our tidy data. After binding our data in STEP 1, we 
know that the first column refers to subjects and the second to activities. The other columns come from X_train.txt and X.test.txt datasets
originally, so to know which columns we need to extract here we need to refer to the file Features.txt. From that file we see that 
the only variables that contain mean and standard deviation are tBodyAcc-mean()-X, tBodyAcc-mean()-Y, tBodyAcc-mean()-Z, tBodyAcc-std()-X,
tBodyAcc-std()-Y, tBodyAcc-std()-Z. These are the first six variables in Features.txt file, which correspond to columns 3 through 8. That's why 
we are selecting only columns 1-8 in the dataset "datatotal". 

STEP 3: 

The corresponding names of the selected columns in STEP 2 are "subjectID", "activities", "tBodyAcc_mean_X", "tBodyAcc_mean_Y", "tBodyAcc_mean_Z", 
"tBodyAcc-std-X", "tBodyAcc-std-Y", "tBodyAcc-std-Z". 

STEP 4: 

We are creating a new variable "labels" by downloading the data from the file "activity_labels.txt". Then we are assigning new names to its columns:
"activities", "descriptions of activities"
The new variable "mergeddatacol" is the merger of "labels" with "datatotal".
The new variable "datacolnew" is created after eliminating the first column from "datatotal" and reordering the other columns 
The name of the column "descriptions of activities" is changed back to "activities".

STEP 5: 
"melteddata" is created after using melt() function on "datacolnew" and selecting the appropriate ID parameters (explained in README.md) in order to prepare
the dataset for dcast() function in the next step. 
"casteddata" is created after using dcast() function on "melteddata" to determine the average of all observations per each subjectID and activity level. This 
final step is necessary to obtain the tidy data. 

There are no units for the the measurements in the dataset because the values are all normalized in the process of the calculation. 