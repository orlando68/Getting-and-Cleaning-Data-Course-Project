
# fname <- paste(getwd(),"//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//test//kk.txt", sep = "", collapse = NULL)
# kk <- read.table(fname,sep=' ',header = FALSE)
# 
# a<-strsplit(as.character( kk[3,1]),' ')[1]
# x<-as.numeric(a[[1]])
# x<-x[!is.na(x)]



fname <- paste(getwd(),"//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//features.txt", sep = "", collapse = NULL)
col_names <- read.table(fname,sep='',header = FALSE)

fname <- paste(getwd(),"//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//activity_labels.txt", sep = "", collapse = NULL)
activities <- read.table(fname,sep='',header = FALSE)
colnames(activities) <- c("activityId", "activityLabel")


fname <- paste(getwd(),"//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//test//X_test.txt", sep = "", collapse = NULL)
X_test <- read.table(fname,sep='',header = FALSE)
names(X_test)<-col_names$V2
fname <- paste(getwd(),"//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//test//subject_test.txt", sep = "", collapse = NULL)
subject_test <- read.table(fname,sep='',header = FALSE)
names(subject_test)<-'Person_Id'
fname <- paste(getwd(),"//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//test//y_test.txt", sep = "", collapse = NULL)
y_test <- read.table(fname,sep='',header = FALSE)
names(y_test)<-'Activity_Id'

fname <- paste(getwd(),"//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//train//X_train.txt", sep = "", collapse = NULL)
X_train <- read.table(fname,sep='',header = FALSE)
names(X_train)<-col_names$V2
fname <- paste(getwd(),"//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//train//subject_train.txt", sep = "", collapse = NULL)
subject_train <- read.table(fname,sep='',header = FALSE)
names(subject_train)<-'Person_Id'
fname <- paste(getwd(),"//getdata_projectfiles_UCI HAR Dataset//UCI HAR Dataset//train//y_train.txt", sep = "", collapse = NULL)
y_train <- read.table(fname,sep='',header = FALSE)
names(y_train)<-'Activity_Id'

#-------------Merges the training and the test sets to create one data set.
total_activity <- rbind(
                        cbind(subject_test,y_test,X_test),
                        cbind(subject_train,y_train,X_train)
                        )
#---Extracts only the measurements on the mean and standard deviation for each measurement.
columns_wanted <- grepl("Person_Id|Activity_Id|mean|std", colnames(total_activity))
total_activity_summ <- total_activity[columns_wanted]

#------------------------Uses descriptive activity names to name the activities in the data set--------
total_activity_summ$Activity_Id = factor(total_activity_summ$Activity_Id,
                                         levels = activities[, 1], labels = activities[, 2])

#-----Appropriately labels the data set with descriptive variable names.

T_Act_Cols <- colnames(total_activity_summ)


T_Act_Cols <- gsub("[\\(\\)-]", "", T_Act_Cols)


T_Act_Cols <- gsub("^f", "Freq_Domain", T_Act_Cols)
T_Act_Cols <- gsub("^t", "Time_Domain", T_Act_Cols)
T_Act_Cols <- gsub("Acc", "Accelerometer", T_Act_Cols)
T_Act_Cols <- gsub("Gyro", "Gyroscope", T_Act_Cols)
T_Act_Cols <- gsub("Mag", "Magnitude", T_Act_Cols)
T_Act_Cols <- gsub("Freq", "Frequency", T_Act_Cols)
T_Act_Cols <- gsub("mean", "Mean", T_Act_Cols)
T_Act_Cols <- gsub("std", "StandardDeviation", T_Act_Cols)
T_Act_Cols <- gsub("BodyBody", "Body", T_Act_Cols)
colnames(total_activity_summ) <- T_Act_Cols

#-From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
#-for each activity and each subject.

# group by subject and activity and summarise using mean


second_table <- total_activity_summ %>%   group_by(Person_Id, Activity_Id) %>%  summarise_each(mean)
# output to file "tidy_data.txt"
write.table(second_table, file = "tidy_data.txt", row.names = FALSE, quote = TRUE)

