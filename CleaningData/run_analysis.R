
  library(data.table)
  library(dplyr)
  
  #download File if it doesn't exist
  fileUrl="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  if(!file.exists("./SmartphoneDataset.zip")) {download.file(fileUrl,destfile="./SmartphoneDataset.zip")}
    
  ##Extract files
  unzip(zipfile="./SmartphoneDataset.zip",exdir="./tempData")
  
  ##Read Files
  TestSubject <- read.table(file="tempData\\UCI HAR Dataset\\test\\subject_test.txt", header=FALSE)
  TestReadX <- read.table(file="tempData\\UCI HAR Dataset\\test\\X_test.txt", header=FALSE)
  TestReadY <- read.table(file="tempData\\UCI HAR Dataset\\test\\Y_test.txt", header=FALSE)
  TrainingSubject <- read.table(file="tempData\\UCI HAR Dataset\\train\\subject_train.txt", header=FALSE)
  TrainingReadX <- read.table(file="tempData\\UCI HAR Dataset\\train\\X_train.txt", header=FALSE)
  TrainingReadY <- read.table(file="tempData\\UCI HAR Dataset\\train\\y_train.txt", header=FALSE)
  
  ##Tests - need data.table package
  TestDT = data.table(x=TestSubject,y=TestReadY)
  TestDT = cbind(TestDT,TestReadX[,1:6])
  TestDT = cbind(TestDT,TestReadX[,41:46])
  TestDT = cbind(TestDT,TestReadX[,81:86])
  TestDT = cbind(TestDT,TestReadX[,121:126])
  TestDT = cbind(TestDT,TestReadX[,161:166])
  TestDT = cbind(TestDT,TestReadX[,201:202])
  TestDT = cbind(TestDT,TestReadX[,214:215])
  TestDT = cbind(TestDT,TestReadX[,227:228])
  TestDT = cbind(TestDT,TestReadX[,240:241])
  TestDT = cbind(TestDT,TestReadX[,253:254])
  TestDT = cbind(TestDT,TestReadX[,266:271])
  TestDT = cbind(TestDT,TestReadX[,345:350])
  TestDT = cbind(TestDT,TestReadX[,424:429])
  TestDT = cbind(TestDT,TestReadX[,503:504])
  TestDT = cbind(TestDT,TestReadX[,516:517])
  TestDT = cbind(TestDT,TestReadX[,529:530])
  TestDT = cbind(TestDT,TestReadX[,542:543])
  
  
      
  ##Training - need data.table package
  TrainingDT = data.table(x=TrainingSubject,y=TrainingReadY)
  TrainingDT = cbind(TrainingDT,TrainingReadX[,1:6])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,41:46])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,81:86])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,121:126])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,161:166])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,201:202])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,214:215])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,227:228])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,240:241])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,253:254])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,266:271])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,345:350])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,424:429])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,503:504])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,516:517])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,529:530])
  TrainingDT = cbind(TrainingDT,TrainingReadX[,542:543])
    
  #Merge training and the test sets to create one data set
  MergeData <- rbind(TestDT,TrainingDT)
  
  #Set Column Names
  setnames(MergeData,"x.V1","Subject")
  setnames(MergeData,"y.V1","Activity")
  setnames(MergeData,3:68,c("AvgtBodyAcc-mean-X","AvgtBodyAcc-mean-Y","AvgtBodyAcc-mean-Z","AvgtBodyAcc-std-X","AvgtBodyAcc-std-Y","AvgtBodyAcc-std-Z","AvgtGravityAcc-mean-X","AvgtGravityAcc-mean-Y","AvgtGravityAcc-mean-Z",
                            "AvgtGravityAcc-std-X","AvgtGravityAcc-std-Y","AvgtGravityAcc-std-Z","AvgtBodyAccJerk-mean-X","AvgtBodyAccJerk-mean-Y","AvgtBodyAccJerk-mean-Z","AvgtBodyAccJerk-std-X","AvgtBodyAccJerk-std-Y",
                            "AvgtBodyAccJerk-std-Z","AvgtBodyGyro-mean-X","AvgtBodyGyro-mean-Y","AvgtBodyGyro-mean-Z","AvgtBodyGyro-std-X","AvgtBodyGyro-std-Y","AvgtBodyGyro-std-Z","AvgtBodyGyroJerk-mean-X","AvgtBodyGyroJerk-mean-Y",
                            "AvgtBodyGyroJerk-mean-Z","AvgtBodyGyroJerk-std-X","AvgtBodyGyroJerk-std-Y","AvgtBodyGyroJerk-std-Z","AvgtBodyAccMag-mean","AvgtBodyAccMag-std","AvgtGravityAccMag-mean","AvgtGravityAccMag-std",
                            "AvgtBodyAccJerkMag-mean","AvgtBodyAccJerkMag-std","AvgtBodyGyroMag-mean","AvgtBodyGyroMag-std","AvgtBodyGyroJerkMag-mean","AvgtBodyGyroJerkMag-std","AvgfBodyAcc-mean-X","AvgfBodyAcc-mean-Y",
                            "AvgfBodyAcc-mean-Z","AvgfBodyAcc-std-X","AvgfBodyAcc-std-Y","AvgfBodyAcc-std-Z","AvgfBodyAccJerk-mean-X","AvgfBodyAccJerk-mean-Y","AvgfBodyAccJerk-mean-Z","AvgfBodyAccJerk-std-X","AvgfBodyAccJerk-std-Y",
                            "AvgfBodyAccJerk-std-Z","AvgfBodyGyro-mean-X","AvgfBodyGyro-mean-Y","AvgfBodyGyro-mean-Z","AvgfBodyGyro-std-X","AvgfBodyGyro-std-Y","AvgfBodyGyro-std-Z","AvgfBodyAccMag-mean","AvgfBodyAccMag-std",
                            "AvgfBodyBodyAccJerkMag-mean","AvgfBodyBodyAccJerkMag-std","AvgfBodyBodyGyroMag-mean","AvgfBodyBodyGyroMag-std","AvgfBodyBodyGyroJerkMag-mean","AvgfBodyBodyGyroJerkMag-std"))
  
  #Uses descriptive activity names to name the activities in the data set (****Convert from number to text******)
  MergeData$Activity <- as.factor(MergeData$Activity)
  levels(MergeData$Activity) <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
  
  #From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity 
  #and each subject
  GroupMergeData <-group_by(MergeData,Subject,Activity)
  tidyData<-MergeData[,lapply(.SD,mean),by=list(Subject,Activity),.SDcols=3:68]
  tidyData
  
  write.table(tidyData,"UCItidy.txt",row.name=FALSE)
  ##REMOVE THE FILE
  #file.remove("./tempData/UCI HAR Dataset/")
  
