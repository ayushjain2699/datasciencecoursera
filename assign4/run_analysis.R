setwd("./UCI HAR Dataset/train")
x = read.table("X_train.txt")
y = read.table("y_train.txt")
s = read.table("subject_train.txt")
names(y) = "activity"
names(s) = "subject"
setwd("..")
features = read.table("features.txt")
c = grepl("mean|std",features$V2)
x = x[,c]
train = cbind(s,y,x)
setwd(".//test")
x = read.table("X_test.txt")
y = read.table("y_test.txt")
s = read.table("subject_test.txt")
setwd("..")
x = x[,c]
names(y) = "activity"
names(s) = "subject"
test = cbind(s,y,x)
final = rbind(test,train)
t = factor(final$activity,labels = c("walking","walking_upstairs","walking_downstairs","sitting","standing","laying"))
final$activity = t
features = filter(features,c)
feature_names = features$V2
coln = c("Subject","Activity",feature_names)
colnames(final) = coln
temp = final%>% group_by(Subject,Activity)%>%summarise_at(vars(`tBodyAcc-mean()-X`:`fBodyBodyGyroJerkMag-meanFreq()`),mean)
temp = as.data.frame(temp)
final2 = temp[,1:42]
