run_analysis <- function(dir="Data/UCI HAR Dataset/"){
      # Reads files from train folder
      x = read.table(paste(dir, "train/X_train.txt", sep="")) #head(x) #dim(x)
      y = read.table(paste(dir, "train/y_train.txt", sep="")) #head(y)
      s = read.table(paste(dir, "train/subject_train.txt", sep="")) #head(s)
      f = read.table(paste(dir, "features.txt", sep="")) #head(f)
      
      ## Reads the features to select which columns to keep
       # grepl returns TRUE if a string contains the pattern, otherwise FALSE.
       # that is, grepl check if the straing in f[,2] contains "mean()" or "std()" characters
      mt = grepl("mean()|std()", f[, 2], fixed=FALSE) #head(mt) 
      trainData <- data.frame(subject = s, activity = y, x[, mt]) #head(train); dim(train)
      
      # Reads necessary files from test folder
      x1 = read.table(paste(dir, "test/X_test.txt", sep="")) #head(x1); dim(x1)
      y1 = read.table(paste(dir, "test/y_test.txt", sep="")) #head(y1); dim(y1)
      s1 = read.table(paste(dir, "test/subject_test.txt", sep="")) #head(s1); dim(s1)
      testData <- data.frame(subject = s1, activity = y1, x1[, mt]) #dim(testData)
      
      ## rbind trainData and testData
      mergedData <- rbind(trainData, testData) #head(mergedData); dim(mergedData)
      
      ## Assignes the activity labels text to the data in activity column
      activity <- read.table(paste(dir, "activity_labels.txt", sep="")) #head(activity); dim(activity)
      for (i in 1:6) {
            mergedData[, 2] <- sub(activity[i, 1], activity[i, 2], mergedData[, 2])
      }
      
      # Sets subject and activity as factors
      mergedData[, 2] <- as.factor(mergedData[, 2])
      mergedData[, 1] <- as.factor(mergedData[, 1])
      
      # Labels the column names from the features file
      colnames(mergedData)[3:68] <- as.character(f[mt, 2])
      colnames(mergedData)[1:2] <- c("subject", "activity")
      
      # Reshape the data and apply the mean fuction
      library(reshape2)
      temp = melt(mergedData, id=c("subject","activity"))
      temp2 = dcast(temp, subject + activity ~ variable, mean); dim(temp2)
      # Output the tidy data set to file output.txt
      write.table(x=temp2, "tidyData.txt", row.names=FALSE)
}