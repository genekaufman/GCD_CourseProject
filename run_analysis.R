library(dplyr)
library(downloader)
clear.variables<-TRUE

# get the data file if we don't have it already. Keeping it in a storage directory
# outside of current working directory so that we don't have to upload it to
# github
data.dir.storage<-"../data/"
data.dir.local<-"data/UCI HAR Dataset/"
file.data.zip <- "uci_har_dataset.zip"
file.data.zip.storage <- paste0(data.dir.storage,file.data.zip)
file.data.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists(file.data.zip.storage)) {
  message("Downloading zip file to storage directory")
  download.file(file.data.url,file.data.zip.storage,mode="wb")
} else {
  message("Data zip file already in storage directory")
}

# copy the file from the storage directory to the working directory
if (!file.exists(file.data.zip)){
  message("Copying zip file to local directory")
  file.copy(file.data.zip.storage,getwd())
} else {
  message("Data zip file already in local directory")
}

# Data file processing
dataDir<-data.dir.local
file.activity.labels <- paste(dataDir,"activity_labels.txt",sep="")
file.features <- paste(dataDir,"features.txt",sep="")
file.test.data <-paste(dataDir,"test/X_test.txt",sep="")
file.test.labels <- paste(dataDir,"test/y_test.txt",sep="")
file.test.subjects <- paste(dataDir,"test/subject_test.txt",sep="")
file.train.data <-paste(dataDir,"train/X_train.txt",sep="")
file.train.labels <- paste(dataDir,"train/y_train.txt",sep="")
file.train.subjects <- paste(dataDir,"train/subject_train.txt",sep="")

# unzip the data files if necessary
if (file.exists(file.data.zip)){
  # unzip if any of the data files don't exist
  if (any(!file.exists(file.activity.labels),
          !file.exists(file.features),
          !file.exists(file.test.data),
          !file.exists(file.test.labels),
          !file.exists(file.test.subjects),
          !file.exists(file.train.data),
          !file.exists(file.train.labels),
          !file.exists(file.train.subjects)
  ))
  {
    message("Unzipping data files")
    unzip (file.data.zip, exdir = "data")
  } else {
    message("All data files already unzipped")
  }
} else {
  stop(paste0("ERROR! Dataset zip file not found: ",file.data.zip))
}

# Pull out the activity labels
activity.labels<-read.table(file.activity.labels)
names(activity.labels)<-c("ID","Activity")

# Pull out the list of features
features<-read.table(file.features)
names(features)<-c("ID","Feature")

# We only want the features having to do with mean and standard deviation
features.mean.std<-features[grepl("-mean()",features$Feature,fixed=T) | grepl("-std()",features$Feature,fixed=T),]
wanted.features<-features.mean.std[,1]

# Full TEST and TRAIN data files are big enough that we don't want to have to read
#   them every run-through if we've already got them loaded
if (exists("data.merged")) {
  message("Merged Data Set found")
} else {
  message("Building Merged Data Set")
  if (exists("test.data")) {
    message("TEST data found")
  } else {
    message("Reading TEST file")
    test.data<-read.table(file.test.data)
    message("Extracting desired features from TEST data")
    test.data.extracted<-test.data[,wanted.features]
    names(test.data.extracted)<-features.mean.std[,2]
  }
  # these files are much smaller, so not as big a deal to read them every time
  test.labels<-read.table(file.test.labels)
  test.subjects<-read.table(file.test.subjects)

  # assign human-friendly activity labels to the data
  test.data.activities<-sapply(test.labels[1],function(x) activity.labels[x,2])

  # merge the activity list and the test data
  test.data.merge1<-cbind(test.data.activities,test.data.extracted)
  # merge in the subject list
  test.data.merge2<-cbind(test.subjects,test.data.merge1)

  if (exists("train.data")) {
    message("TRAIN data found")
  } else {
    message("Reading TRAIN file")
    train.data<-read.table(file.train.data)
    message("Extracting desired features from TRAIN data")
    train.data.extracted<-train.data[,wanted.features]
    names(train.data.extracted)<-features.mean.std[,2]
  }
  # these files are much smaller, so not as big a deal to read them every time
  train.labels<-read.table(file.train.labels)
  train.subjects<-read.table(file.train.subjects)

  # assign human-friendly activity labels to the data
  train.data.activities<-sapply(train.labels[1],function(x) activity.labels[x,2])

  # merge the activity list and the test data
  train.data.merge1<-cbind(train.data.activities,train.data.extracted)
  # merge in the subject list
  train.data.merge2<-cbind(train.subjects,train.data.merge1)

  # combine both data sets into a single one
  data.merged<-rbind(test.data.merge2,train.data.merge2)
  names(data.merged)[1:2] = c("Subject","Activity")

  # Clean up some temp variables and data
  if (clear.variables) {
    rm(list=ls()[grepl("test",ls())]) # all the *test* data and variables
    rm(list=ls()[grepl("train",ls())]) # all the *train* data and variables
  }
}

message("Merged Data ready for processing")
# Determine mean for all variables for each subject/activity
data.merged.avg<-data.merged %>%
  group_by(Subject,Activity) %>%
  summarise_each(funs(mean))

# rename the variables
newcolnames<-sapply(names(data.merged.avg),function(x) paste0("mean.",x))
names(data.merged.avg)[3:ncol(data.merged.avg)]<-newcolnames[3:ncol(data.merged.avg)]

message("Write output file")
write.table(data.merged.avg,file="tidy_data.txt",row.names=FALSE)

# Clean up unnecessary variables and files
if (clear.variables) {
  unlink("data", recursive = TRUE, force=TRUE)
  unlink(file.data.zip)
  rm(list=ls()[ls()!="data.merged" & ls()!="data.merged.avg"])
}

message("Processing complete!")