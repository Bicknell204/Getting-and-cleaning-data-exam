
check_if_exists<-function(){
    ## It checks if the "UCI HAR Dataset" folder exists in the working directory. 
  
    ## If it exists, the function does not do anything since it assumes that the 
    ## existing "UCI HAR Dataset" folder already contains all the files needed for the project.
  
    ## If "UCI HAR Dataset" folder does not exist, the function download the zipped file from the link  
    ## provided in the project instructions, unzips it and creates the "UCI HAR Dataset" folder in the working directory.
  
    
    if(!file.exists("./UCI HAR Dataset")) {dir.create("./UCI HAR Dataset")
                                         
    ## Informs the user about what is being doing.
    message("")
    message("")                                           
    message("The UCI HAR folder does not exist in the working directory")
    message("The dataset will now downloaded and unzipped to create the UCI HAR Dataset folder in the") 
    message("working directory with all the files and subfolders needed for the project")
    message("")
    message("")
                                         
    ## Download the file from the source provided in the project instructions
    ## and stores it in the working directory with the name "UCI HAR Dataset.zip"
    fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" 
    download.file(fileUrl,destfile="UCI HAR Dataset.zip", method="curl")
                                         
    ## Unzip the recently downloaded file in the same directory where the zipped file is stored, i.e. in the working directory 
    unzip("UCI HAR Dataset.zip", files = NULL, list = FALSE, overwrite = TRUE, 
          junkpaths = FALSE, exdir = ".", unzip = "internal", setTimes = FALSE)
    }
  
    ## At this point the "UCI HAR Dataset" folder has been created in the working directory.   
}





readData<-function(main_folder="UCI HAR Dataset", inertial=FALSE){
    ## This function builds the dataset from files stored in the "main_folder" and its subdirectories.
    ## The "main_folder" name is passed as an argument being "UCI HAR Dataset" the default value.
    ## If you need to change the directory name or the directory path, the "main_folder" parameter 
    ## will allows to do so. You only need to change the default value accordingly.  
  
    ## "Inertial" is another argument of the "readData()" function. If set to FALSE, as per default, 
    ## the files contained in the Inertial Signals subfolder will not be loaded.  
    ## If set to TRUE, the "readData()" function will also load all the files contained in the 
    ## Inertial Signals subfolder. Notice that, in this case, the resulting dataframe will be a gigantic 
    ## 10299x1716 dataframe. It is reccomended to set Inertial=TRUE only onto 
    ## powerful computers to handle the resulting dataframe comfortably 
  
    ## In order to save code typing and keep the code compact, the "readData()" function 
    ## takes advantage from the identical structure of the 2 folders included 
    ## in the UCI folder: "train" and "test".
    ## Using the same exact functions ("firstLevelData()" and "readInertialData()" explained 
    ## further below in this .R file) applied with a different value for the 
    ## "type" argument, 2 dataframes with the same structure will be built.
    ## The first contains data form the "train" subfolder and the other from the "test" subfolder.
    ## The function ends by rbinding these 2 dataframes toghether.
  
    ## Let's start with building the dataframe "testData" containing data from the "test" folder.
    ## This is accomplished by calling the "firstLevelData()" function with "type" argument set to "test". 
    ## This allows to build a dataframe called "testData" with basic information (i.e.: subject, 
    ## activity and basic sensorial information, i.e. without Inertial Singals) from data stored in the "test" subfolder
    
    ## If the "inertial" argument (inherited from argument in the "readData()" function) is set to TRUE,
    ## the inertial data from the "test" folder will be loaded through the function "readInertialData()" and
    ## cbinded into the "testData" dataframe.
    ## Notice that "readInertialData()" is called with "type" argument set to "test". 
    
    ## Regardless the value of inertial argument, a column named "train" is added to dataframe and 
    ## all its rows are (in this case) set to 0 to specify that this is not data from "train" subset.
    testData<-firstLevelData(main_folder, "test")
    if(inertial==TRUE) {testData<-readInertialData(testData, main_folder, "test" )}
    testData$train<- 0
  
    ## Let's now build the dataframe "trainData" with data form the "train" folder.
    ## The instructions are exactly the same as the "test" case with only two differences: 
    ## 1) in both functions "firstLevelData" and "readInertialData" 
    ## the argument type is set to "train" instead of "test".
    ## 2) the "train" column is set to 1 since in this case, data refer to "train" subjects   
    trainData<-firstLevelData(main_folder, "train")
    if(inertial==TRUE) {trainData<-readInertialData(trainData, main_folder, "train" )}
    trainData$train<- 1
  
  
    ## The overall output dataframe is built by rbinding the "testData" and "trainData" dataframes.
    ## It worthy to notice that the "train" column allows to easily extract and distinguish data 
    ## from "train" and from "test" subjects despite both are now merged together into one gigantic dataframe.
    readData<-rbind(testData,trainData)
  
}



firstLevelData<-function(main_folder, type) {
    ## This function is called from the "readData()" function described above.  
    ## It builds a dataframe with basic information, i.e.: subject, activity, 
    ## and basic sensorial data (not the Inertial Signals data! There is a specific function to load these data)
    
    ## Depending on the value of the argument "type" (either "test" or "train"), 
    ## data are taken from files into either "test" or "train" directory.
  
    ## If the argument "type" is set to "test", this function will load info from:
    ## "subject_test.txt", "X_test.txt" and "y_test.txt" files stored in "test" subdirectory
  
    ## If the argument type is set to "train", this function will load info from:
    ## "subject_train.txt", "X_train.txt" and "y_train.txt" files stored in "train" subdirectory
  
    ## This is accomplished through an extensive use of the "paste" function 
  
    X <- read.table(paste(main_folder, type, paste(paste("X", type, sep="_"), "txt", sep="."),sep="/"), dec=".", quote="\"")
    ## In the line above, if type is set to "test", the first argument of the read.table 
    ## will be the string: "UCI HAR Dataset/test/X_test.txt".
    ## if type is set to "train", it will be "UCI HAR Dataset/train/X_train.txt"
    
    ## Regardless the value of "type", at this point, X dataframe contains basic sensorial 
    ## data with 561 columns.
  
    ## With the 2 following commands, the 561 columns in X will be assigned the 
    ## same names as extracted from the "features.txt" file 
    features <- read.table(paste(main_folder, paste("features", "txt", sep="."),sep="/"), dec=".", quote="\"")
    colnames(X)<-features$V2
  
    ## We'll now read information on the subjects form either "subject_test.txt" 
    ## file in the "test" folder or from "subject_train.txt" file in the "train" 
    ## folder depending on the value of "type" argument
    subject_test <- read.table(paste(main_folder, type, paste(paste("subject", type, sep="_"), 
                    "txt", sep="."),sep="/"), dec=".", quote="\"")
  
    ## We'll now read the activity information form either "y_test.txt" file in the
    ## "test" folder or from "y_train.txt" file in the "train" folder 
    ## depending on the value of "type" argument
    y <- read.table(paste(main_folder, type, paste(paste("y", type, sep="_"), 
                                        "txt", sep="."),sep="/"), dec=".", quote="\"")
  
    ## We finally cbind the 3 set of data previously loaded (i.e. subject_test,y, X)
    ## and assign to the first and second column a descriptive name, i.e.: "subject" and "activity". Notice that X columns had been named previously. 
    X<-cbind(subject_test,y, X)
  
    colnames(X)[1] <- "subject"
    colnames(X)[2] <- "activity"
  
    ## By calling "replaceActivityName()" function, the numeric values
    ## in the X$activity column will be replaced with descriptive strings 
    ## Details are provided below in the replaceActivityName function description
    X$activity<-replaceActivityName(main_folder, X$activity)
  
    return(X)
  
  
}

replaceActivityName<-function (main_folder, activity_col) {
    ## The numeric values in the argument "activity_col" 
    ## are replaced with descriptive string according to the "activity_labels.txt" file
  
    ## Let's read data from "activity_labels.txt"
    repl.tab <- read.table(paste(main_folder,"activity_labels.txt",sep="/"), dec=".", quote="\"")
  
    ## Let's "de-factorize" values from repl.tab. If we don't, the following replacement operation would not  
    ## work as expected (a factor is treated as a number even though it looks like a string)
    repl.tab <- data.frame(lapply(repl.tab, as.character), stringsAsFactors=FALSE)
  
    ## Replace numeric values in activity_col with the correspondant strings according to the repl.tab table 
    indx <- match(activity_col, repl.tab[, 1], nomatch = 0) 
    activity_col[indx != 0] <- repl.tab[indx, 2] 
    return(activity_col)
  
}


readInertialData<-function(original_df, main_folder, type) {
    ## This function cbinds data from the Inertial Signals files to 
    ## the "original_df" dataframe passed as an argument.
    ## This same function loads files from the Inertial Signals subfolder from 
    ## either "test" or "train" folder depending on the setting for the argument "type"
    
    ## Each of the 9 files in the Inertial Signals folder has 128 columns. 
    ## The resulting 1152 columns are cbinded to the input dataframe "original_df"
    ## The 128 columns read from one file are named combining the file name 
    ## with progressive number from 1 to 128.
    ## For instance the 128 columns of each observation in "body_acc_x.txt" file are added to "original_df" with the 
    ## following names: "body_acc_x.1", "body_acc_x.2", "body_acc_x.3"...."body_acc_x.128"
    ## The same to remaining 8 files in the Inertial Signal folder.
  
    ## Observing the 9 file names into the Inertial Signals folder, we can see that 
    ## these names are the result of all possible combination of 2 vecotrs of stings, 
    ## "root_part" and "second_part" as defined below.
    root_part<-c("body_acc","body_gyro","total_acc")
    second_part<-c("x","y","z")
  
    ## To keep the code compact we can take advantage of this pattern: instead of 
    ## writing 9 callings to the read.table function, we can crate a loop with one single 
    ## read.call function applied to each element 
    ## of a vector of 9 filenames created as all the possible combinations of the 
    ## "root_part" and "second_part" vectors correctly ordered.
    
    ## Let's create the "filename" vector of string and let's order it. 
    filenames<-apply(expand.grid(root_part, second_part), 1, paste, collapse = "_")
    filenames<-sort(filenames)
  
    ## The elements stored in the filenames vector are now: names Please notice that in filnames both the extension ".txt" and the path are missing. 
    ## This is done on purpose since filenames without these pieces of information will be used to name
    ## the columns of the data frame that is going to be built in the next few lines.
    for (i in filenames) 
    {
    ## Let's build a fullname vector from the filenames vector and adding both 
    ## the path  and the extension ".txt".   
    fullname<-paste(main_folder,type,"Inertial Signals", paste(paste(i,type, sep="_"),"txt", sep="."), sep="/")
    ## From "body_acc_x" in filenames, the above operation builds the full path: 
    ## "test/Inertial Signals/body_acc_x.txt" or "train/Inertial signals/body_acc_x.txt" 
    ## depending on the value of the argument "type"
    
    ## Let's now read the file
    fil<-read.table(fullname, dec=".", quote="\"")
    
    ## In the following, from the filename, a vector of 128 names is created as, in the 
    ## case of "bocy_acc_x" file, "body_acc_x.1", "body_acc_x.2", "body_acc_x.3"...."body_acc_x.128"
    ## This vector is then assigned as column names to the dataframe "fil" previously loaded  
    subn<-1:128
    coln<-paste(i, subn, sep=".")
    colnames(fil) <- coln
    
    ## The resulting dataframe "fil" with descriptive column names is cbinded to 
    ## the original dataframe "original_df" passed as an argument to the "readInertialData()" function
    original_df<-cbind(original_df,fil)
    
  }
  return(original_df)
}

extractMeanStdColumns<-function(original_df){
    ## The "extractMeanStdColumns()" function allows extracting from the original dataframe 
    ## "original_df" those columns containing mean and standard deviation values.
  
    ## Let's first extract all column names from "original_df".
    z<-names(original_df)
  
    ## Let's first create a logical vector pinpointing those columns whose name 
    ## contains either the substring "mean()" or "sd()"
    ## Notice that columns containing substring "meanFreq()" are not extracted since from 
    ## my understanding these are not required.
    gh<-grepl("mean()",z, fixed=TRUE)|grepl("std()",z, fixed=TRUE)
  
    ## Now let's subset z according to the logical vector gh
    z<-z[gh]
  
    ## Let's add to z also the names of other useful columns such as "subject", 
    ## "activity" and "train"
    z<-c("subject", "activity", z, "train")
  
    ## We'll finally subset the original dataframe according to the vector of column names "z" built above.
    subset_df<-original_df[,z]
  
    return(subset_df)
}

summarizedData<-function(subset_df){
    ## This function allows collapsing the argument dataframe grouping the input dataframe  
    ## by both "subject" and "activity" variables. While collapsing the dataframe, both 
    ## the mean and the standard deviation of each column is calculated and stored in the 
    ## resultng dataframe.
  
    nam<-colnames(subset_df)
    aggregated_df<-aggregate(subset_df[nam[3:length(nam)]], by=subset_df[c("subject","activity")], 
                             FUN=function(x) c(mean=mean(x), std=sd(x)) )
    
    ## Please notice that the “aggragate()” function, for each column of the input dataframe "subset_df" 
    ## builds a 2 column matrix: one column containing the mean and the other the standard deviation.
    ## In other words, for example, from the vector variable tBodyAcc-mean()-X, 
    ## the aggregate() function creates a 2 column matrix named tBodyAcc-mean()-X. 
    ## If you now call dim(ht) or names(ht), you will only display the matrix names,
    ## that is to say tBodyAcc-mean()-X, tBodyAcc-mean()-Y tBodyAcc-mean()-Z etc, which may mislead and
    ## make people think that there is no mean or standard deviation information in it. 
    
    ## But if you now print out values instead of names through commands like head(dt) or dt, 
    ## you will notice that, for example tBodyAcc-mean()-X, actually contains both fields: 
    ## tBodyAcc-mean()-X.mean and tBodyAcc-mean()-X.sd
        
    aggregated_df$train<-aggregated_df$train[,1]
    return(aggregated_df)
  
}
