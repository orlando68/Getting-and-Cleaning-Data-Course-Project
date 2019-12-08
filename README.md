# Coursera Getting and Cleaning Data course project
A R script is made to analyze the data from UCI HAR Dataset, which is extracted in the working directory.

This following files are used:

- `features.txt` 
- `train/X_train.txt` 
- `test/X_test.txt` 
- `train/subject_train.txt` 
- `test/subject_test.txt` 
- `train/y_train.txt` 
- `test/y_test.txt`
## Study design <a name="study-design"></a>

First, merge training and test data together to create one data set, then pick up the measurements on the mean and standard deviation, finally then the measurements were averaged for each subject and activity, resulting in the final data set.

## Creating the data set <a name="creating-data-set"></a>

The `GCDC_project.R` R script does all the work:
- Read files.
- Merge data sets.
- Extract only wnated the measurements 
- Rename activities.
- Better label for variable names.
- Create a second dataset with the average of each variable for each activity and each subject.
- Create `tidy_data.txt` file.