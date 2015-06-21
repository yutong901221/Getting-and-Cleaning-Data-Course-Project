## getting data
test1 = read.table("Y_test.txt",header = FALSE)
train1 = read.table("Y_train.txt",header = FALSE)

test2 = read.table("subject_test.txt",header = FALSE)
train2 = read.table("subject_train.txt",header = FALSE)

test3 = read.table("X_test.txt",header = FALSE)
train3 = read.table("X_train.txt",header = FALSE)

## Step 1: merges the training and the test sets to create one data set
data1 = rbind(train1, test1)
data2 = rbind(train2, test2)
data3 = rbind(train3, test3)

features = read.table("features.txt", head=FALSE)

names(data1) = "activity"
names(data2) = "subject"
names(data3) = features[,2]

data = cbind(data1, data2)
data = cbind(data, data3)

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
mean_std = features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
newdata = data[,c("activity","subject",as.character(mean_std))]

## Step 3: Uses descriptive activity names to name the activities in the data set
labels = read.table("activity_labels.txt",header = FALSE)
fac = factor(newdata[,1], labels=labels[,2])
newdata[,1] = fac

## Step 4: approprately labels the data set with descriptive variable names
names(newdata)<-gsub("^t", "time", names(newdata))
names(newdata)<-gsub("Acc", "Accelerometer", names(newdata))
names(newdata)<-gsub("^f", "frequency", names(newdata))
names(newdata)<-gsub("Gyro", "Gyroscope", names(newdata))
names(newdata)<-gsub("Mag", "Magnitude", names(newdata))
names(newdata)<-gsub("BodyBody", "Body", names(newdata))

## Step 5: creates tidy data set with the average of each variable for each activity and each subject
tidydata<-aggregate(. ~subject + activity, newdata, mean)
write.table(tidydata, file = "tidydata.txt",row.name=FALSE)









