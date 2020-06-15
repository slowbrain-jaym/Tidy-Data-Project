library(dplyr)

dataset_dir<-"/Users/jamen/Google Drive/Everything/Data Science Course/TidyData Project/UCI HAR Dataset" 
##directory of UCI HAR dataset

##load all the data sets into R
X_test<-read.table(paste(dataset_dir,"/test/X_test.txt",sep=""))
y_test<-read.table(paste(dataset_dir,"/test/y_test.txt",sep=""))
subject_test<-read.table(paste(dataset_dir,"/test/subject_test.txt",sep=""))

X_train<-read.table(paste(dataset_dir,"/train/X_train.txt",sep=""))
y_train<-read.table(paste(dataset_dir,"/train/y_train.txt",sep=""))
subject_train<-read.table(paste(dataset_dir,"/train/subject_train.txt",sep=""))

actlabels<-read.table(paste(dataset_dir,"/activity_labels.txt",sep=""))
features<-read.table(paste(dataset_dir,"/features.txt",sep=""))

names(actlabels)<-c("actid","activity")

## Give X data descriptive column labels
names(X_test)<-features[[2]]
names(X_train)<-features[[2]]

## Give y data a description column label
names(y_test)<-"actid"
names(y_train)<-"actid"

## Give subject data descriptive column label
names(subject_test)<-"subject"
names(subject_train)<-"subject"

## Merge X and y datasets
test_set<-bind_cols(subject_test,y_test,X_test)
train_set<-bind_cols(subject_train,y_train, X_train)

## Join the test and training sets
alldata<-bind_rows(train_set,test_set)
alldata<-merge(actlabels,alldata,by="actid")

## Find columns that are mean or standard deviation measurements, as well as
## the participant and activity labels
cols<-grepl("mean\\(\\)|std\\(\\)|activity|subject", names(alldata))
means_devs<-alldata[,cols]

## uncomment line below to remove capitals and brackets from variable names
## names(alldata)<-tolower(gsub("\\(\\)","",names(alldata)))

## create summary dataset including the mean of each subject and activity
## combination
summaries<- alldata %>%
  group_by(subject, activity) %>%
  summarise_all(mean) %>%
  select(-actid)

## write the two created datasets to csv files
write.csv(means_devs, "means_devs.csv")
write.csv(summaries, "summaries.csv")
