##getting mean and standard deviation variables vector
fedata<-read.table("./data/UCI HAR Dataset/features.txt")
clean_fedata<-tolower(gsub("\\(|\\)","",fedata[ ,2]))
ids<-grep("(\\Wmean\\W|std)",fedata$V2,ignore.case=TRUE) 
renamev<-clean_fedata[ids]

##getting activity label data
act<-read.table("./data/UCI HAR Dataset/activity_labels.txt")
acts<-act[,"V2"]

##reading from test data 
subt<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")
xt<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
yt<-read.table("./data/UCI HAR Dataset/test/y_test.txt")
subxt<-xt[,ids]
testdata<-cbind(yt,subt,subxt)

##reading from training data 
subtr<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")
xtr<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
ytr<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
subxtr<-xtr[,ids]
traindata<-cbind(ytr,subtr,subxtr)

mergeD<-rbind(traindata,testdata)
names(mergeD)<-c("activity","subject",renamev)
mergeD$activity<-acts[mergeD[,"activity"]]

ndata<-aggregate(mergeD[,3:68],mergeD[,c("activity","subject")],mean)

write.table(ndata,file="./data/cleanUCIdata.txt",row.name=FALSE)

