


# 4. DATA DICTIONARY - UCI HAR DATASET

The whole project is made of 3 functions called one ofter the other in the following sequence:  
-readData()  
-extractMeanStdColumns()   
-summarizedData()  

The output of readData() is used as an input for extractMeanStdColumns() function.  
The output of extractMeanStdColumns() function si the input for summarizedData() function.  
The output of summarizedData()  is teh final output which has been uploaded in Coursera web page.  

This document is composed by 3 sections each of which describing the variables contained in output of the 3 above mentioned functions.  

If you are intersted only in the codebook of the final output (meaning the variables of the file "Output.txt"" uploaded in Coursera), please refer to the section "VARIABLES FROM summarizedData() OUTPUT" of this document.  


# 4.1 : CODEBOOK OF VARIABLES IN  THE OUTPUT OF FUNCTION "readData()"
### VARIABLE NAME: "subject"
TYPE: factor numecial variable  
MEANING: It identifies the subject of the experiment  
RANGE: numerical value in the range from 1 to 30  
  
### VARIABLE NAME: "activity"
TYPE: factor string variable  
MEANING: It identifies the activity carried out by the subject.  
RANGE: one of the following 6 values:  
 -WALKING  
 -WALKING_UPSTAIRS  
 -WALKING_DOWNSTAIRS  
 -SITTING  
 -STANDING  
 -LAYING  
  
### VARIABLE NAME: "train"  
TYPE: 2 values variable (either 0 or 1)  
MEANING: It identifies if the subject belongs to "train" or "test" group
RANGE:
 -0: subject belongs to test group 
 -1: subject belongs to train group


### FEATURE VARIABLES (group of 561 variables):
There are 561 variables used to measure different features in the time and frequency domains.   
Features whose name starts with an f are in the frequency domain.  
Features whose name starts with a t are in the time domain.  
Each of the following feature has an X, Y and Z components.  
Values are numeric in double precision format. 

The measured variables are:. 
-Body acceleration (in both Time and Frequency domains)  
-Gravity Acceleration (in Time domain only)  
-Body acceleration Jerk (in both Time and Frequency domains)  
-Body Angular Speed (in both Time and Frequency domains)  
-Body Angular Accelleration (in Time domain only)  
-Body Acceleration Magnitude (in both Time and Frequency domains)  
-Gravity Accelleration Magnitude (in Time domain only)  
-Body Accelleration Jerk Magnitude (in both Time and Frequency domains)  
-Body Angular Speed Magnitude (in both Time and Frequency domains)  
-Body Angular Acceleration Magnitude (in both Time and Frequency domains)  

In parentesis the domain of reference is indicated.  
"in Time domain only" means that there is no frequancy correspondant of that variable.  
  
"in both Time and Frequency domains" means that of that variable it exists both version:  
-the t version  
-the f version obtaind applying a Fast Fourier transformation to its t correspondant  
  
For instance:  
of the variable Body Accelleration, there will be 2 versions:  
-tBodyAcc  
-fBodyAcc  
  
while of the variable Gravity Acceleration, there will be only the Time version:  
tGravAcc

Of each of the above mentioned variables, the data set includes the following values:  
-mean: mean value  
-std: standard deviation  
-mad: median absolute value 
-max: largest value in the array  
-min: smalles value in the array  
-sma: signal magnitude area  
-energy: average sum of squares  
-iqr: inetrquartile range  
-entrop: signal entropy  
-arCoeff: autoregression coefficient  
-correlation: correlation coefficient  
-maxFreqIng: largest frequency component  
-manFreq: Frequency signal weighted average  
-skewness: frequency signal Skewness  
-kurtosis: frequancy signal Kurtosis  
-energyBand: Energy of a frequency interval  
-angle: Angle between two vectors  

Each  variable is measured in their 3 axis component.  
This means that the x value of Body Acc variable in the time domain is called "tBodyAcc-x" while the correspondant variable in the f domain is called "tBodyAcc-y"
  

In this groups there isa total of 561 variables  

### 4.1.1 INERTIAL SIGNALS VARIABLES (group of 1152 variables):
In case the function "readData()" is called by setting the Inertial argument to TRUE, also the Inertial Signals will be loaded and  stored in the output dataframe in a total of additional 1152 columns in double precision format.   
These columns are named as follows:  
body_acc_x.1 ... body_acc_x.128  
body_acc_y.1 ... body_acc_y.128  
body_acc_z.1 ... body_acc_z.128  
body_gyro_x.1 ... body_gyro_x.128  
body_gyro_y.1 ... body_gyro_y.128  
body_gyro_z.1 ... body_gyro_z.128  
total_acc_x.1 ... total_acc_x.128  
total_acc_y.1 ... total_acc_y.128  
total_acc_z.1 ... total_acc_z.128  
In other words, each observation from body_acc_x file is a 128 vector with column names body_acc_x.1, body_acc_x.2 ... up to body_acc_x.128.


# 4.2: CODEBOOK OF VARIABLES FROM "extractMeanStdColumns ()" OUTPUT
The output of "extractMeanStdColumns()" function is a subset of the output from the "readData()". 
Therefore, the data dictionary follows the same rules previously described.  
The subset includes all and only the columns with the mean and standard deviation information, along with the 3 columns: "subject"", "activity" and "train".  

A complete list of variables included in this dataframe is reported below. For the meaning of each, please refer ro the above section.

subject  
activity   
train 
tBodyAcc-mean()-X.mean  
tBodyAcc-mean()-Y.mean  
tBodyAcc-mean()-Z.mean  
tBodyAcc-std()-X.mean  
tBodyAcc-std()-Y.mean  
tBodyAcc-std()-Z.mean  
tGravityAcc-mean()-X.mean  
tGravityAcc-mean()-Y.mean  
tGravityAcc-mean()-Z.mean  
tGravityAcc-std()-X.mean  
tGravityAcc-std()-Y.mean  
tGravityAcc-std()-Z.mean  
tBodyAccJerk-mean()-X.mean  
tBodyAccJerk-mean()-Y.mean  
tBodyAccJerk-mean()-Z.mean  
tBodyAccJerk-std()-X.mean  
tBodyAccJerk-std()-Y.mean  
tBodyAccJerk-std()-Z.mean  
tBodyGyro-mean()-X.mean  
tBodyGyro-mean()-Y.mean  
tBodyGyro-mean()-Z.mean  
tBodyGyro-std()-X.mean  
tBodyGyro-std()-Y.mean  
tBodyGyro-std()-Z.mean  
tBodyGyroJerk-mean()-X.mean  
tBodyGyroJerk-mean()-Y.mean  
tBodyGyroJerk-mean()-Z.mean  
tBodyGyroJerk-std()-X.mean  
tBodyGyroJerk-std()-Y.mean  
tBodyGyroJerk-std()-Z.mean  
tBodyAccMag-mean().mean  
tBodyAccMag-std().mean  
tGravityAccMag-mean().mean  
tGravityAccMag-std().mean  
tBodyAccJerkMag-mean().mean  
tBodyAccJerkMag-std().mean  
tBodyGyroMag-mean().mean  
tBodyGyroMag-std().mean  
tBodyGyroJerkMag-mean().mean  
tBodyGyroJerkMag-std().mean  
fBodyAcc-mean()-X.mean  
fBodyAcc-mean()-Y.mean  
fBodyAcc-mean()-Z.mean  
fBodyAcc-std()-X.mean  
fBodyAcc-std()-Y.mean  
fBodyAcc-std()-Z.mean  
fBodyAccJerk-mean()-X.mean  
fBodyAccJerk-mean()-Y.mean  
fBodyAccJerk-mean()-Z.mean  
fBodyAccJerk-std()-X.mean  
fBodyAccJerk-std()-Y.mean  
fBodyAccJerk-std()-Z.mean  
fBodyGyro-mean()-X.mean  
fBodyGyro-mean()-Y.mean  
fBodyGyro-mean()-Z.mean  
fBodyGyro-std()-X.mean  
fBodyGyro-std()-Y.mean  
fBodyGyro-std()-Z.mean  
fBodyAccMag-mean().mean  
fBodyAccMag-std().mean  
fBodyBodyAccJerkMag-mean().mean  
fBodyBodyAccJerkMag-std().mean  
fBodyBodyGyroMag-mean().mean  
fBodyBodyGyroMag-std().mean  
fBodyBodyGyroJerkMag-mean().mean  
fBodyBodyGyroJerkMag-std().mean  
tBodyAcc-mean()-X.std  
tBodyAcc-mean()-Y.std  
tBodyAcc-mean()-Z.std  
tBodyAcc-std()-X.std  
tBodyAcc-std()-Y.std  
tBodyAcc-std()-Z.std  
tGravityAcc-mean()-X.std  
tGravityAcc-mean()-Y.std  
tGravityAcc-mean()-Z.std  
tGravityAcc-std()-X.std  
tGravityAcc-std()-Y.std  
tGravityAcc-std()-Z.std  
tBodyAccJerk-mean()-X.std  
tBodyAccJerk-mean()-Y.std  
tBodyAccJerk-mean()-Z.std  
tBodyAccJerk-std()-X.std  
tBodyAccJerk-std()-Y.std  
tBodyAccJerk-std()-Z.std  
tBodyGyro-mean()-X.std  
tBodyGyro-mean()-Y.std  
tBodyGyro-mean()-Z.std  
tBodyGyro-std()-X.std  
tBodyGyro-std()-Y.std  
tBodyGyro-std()-Z.std  
tBodyGyroJerk-mean()-X.std  
tBodyGyroJerk-mean()-Y.std  
tBodyGyroJerk-mean()-Z.std  
tBodyGyroJerk-std()-X.std  
tBodyGyroJerk-std()-Y.std  
tBodyGyroJerk-std()-Z.std  
tBodyAccMag-mean().std  
tBodyAccMag-std().std  
tGravityAccMag-mean().std  
tGravityAccMag-std().std  
tBodyAccJerkMag-mean().std  
tBodyAccJerkMag-std().std  
tBodyGyroMag-mean().std  
tBodyGyroMag-std().std  
tBodyGyroJerkMag-mean().std  
tBodyGyroJerkMag-std().std  
fBodyAcc-mean()-X.std  
fBodyAcc-mean()-Y.std  
fBodyAcc-mean()-Z.std  
fBodyAcc-std()-X.std  
fBodyAcc-std()-Y.std  
fBodyAcc-std()-Z.std  
fBodyAccJerk-mean()-X.std  
fBodyAccJerk-mean()-Y.std  
fBodyAccJerk-mean()-Z.std  
fBodyAccJerk-std()-X.std  
fBodyAccJerk-std()-Y.std  
fBodyAccJerk-std()-Z.std  
fBodyGyro-mean()-X.std  
fBodyGyro-mean()-Y.std  
fBodyGyro-mean()-Z.std  
fBodyGyro-std()-X.std  
fBodyGyro-std()-Y.std  
fBodyGyro-std()-Z.std  
fBodyAccMag-mean().std  
fBodyAccMag-std().std  
fBodyBodyAccJerkMag-mean().std  
fBodyBodyAccJerkMag-std().std  
fBodyBodyGyroMag-mean().std  
fBodyBodyGyroMag-std().std  
fBodyBodyGyroJerkMag-mean().std  
fBodyBodyGyroJerkMag-std().std  


## 4.3: CODEBOOK OF VARIABLES FROM "summarizedData()" OUTPUT
The output of "summarizedData()" is the mean and standard deviation of each variable of "extractMeanStdColumns()"" output, that is to say of each variable in the table above except for "subject", "activity" and "train" variables for which the mean and standard deviation are not calculated.  
For example, to the "tBodyAcc-mean()-X" variable in the "extractMeanStdColumns()" output, corresponds 2 variables: "tBodyAcc- mean()-X.mean" and "tBodyAcc-mean()-X.sd" which represent the mean and standard deviation of the variable "tBodyAcc-mean()-X".  
Please notice that once generated the dataframe dt as output of the "summarizedData()" function, if you call dim(dt) or names(dt) it may seem that dt did not contain mean and standard deviation information.  
Please type head(dt) or dt in the command line to display the real structure of this dataframe and display mean and standard deviation data.  
This "stange" behaviour is due to the "aggragate()" function used to build the dataframe "dt" called within "summarizedData()" function.
The "aggregate()" function, for each column of the its input dataframe, builds a 2 column matrix: one column containing the mean and the other the standard deviation.
In other words, for example, from the vector variable "tBodyAcc-mean()- X", the "aggregate()" function creates a 2 column matrix named "tBodyAcc-mean()-X". The same applies to the other variables such as "tBodyAcc-mean()-Y" and "tBodyAcc-mean()-Z".
If you now call dim(ht) or names(ht), you will only display the matrix names, that is to say "tBodyAcc-mean()-X", "tBodyAcc-mean()-Y", "tBodyAcc-mean()-Z" etc, which may mislead and make people think that there is no mean or standard deviation information in it.  
But if you now print out values instead of names through commands like head(dt) or dt you will notice that, for example the matrix "tBodyAcc- mean()-X", actually contains both fields: "tBodyAcc-mean()-X.mean" and "tBodyAcc-mean()-X.sd"
The exhaustive list of variables is reported in Appendix 3.

The exhaustive list of variables si as follows: 
subject: numeric variable ranging from 1:30  
activity: categrical variable indicating the activity 
train: boolean variable indicating if the subject belongs to the training ortest group.  
All the rest are double precision numerical variable.  
tBodyAcc-mean()-X.mean  
tBodyAcc-mean()-Y.mean  
tBodyAcc-mean()-Z.mean  
tBodyAcc-std()-X.mean  
tBodyAcc-std()-Y.mean  
tBodyAcc-std()-Z.mean  
tGravityAcc-mean()-X.mean  
tGravityAcc-mean()-Y.mean  
tGravityAcc-mean()-Z.mean  
tGravityAcc-std()-X.mean  
tGravityAcc-std()-Y.mean  
tGravityAcc-std()-Z.mean  
tBodyAccJerk-mean()-X.mean  
tBodyAccJerk-mean()-Y.mean  
tBodyAccJerk-mean()-Z.mean  
tBodyAccJerk-std()-X.mean  
tBodyAccJerk-std()-Y.mean  
tBodyAccJerk-std()-Z.mean  
tBodyGyro-mean()-X.mean  
tBodyGyro-mean()-Y.mean  
tBodyGyro-mean()-Z.mean  
tBodyGyro-std()-X.mean  
tBodyGyro-std()-Y.mean  
tBodyGyro-std()-Z.mean  
tBodyGyroJerk-mean()-X.mean  
tBodyGyroJerk-mean()-Y.mean  
tBodyGyroJerk-mean()-Z.mean  
tBodyGyroJerk-std()-X.mean  
tBodyGyroJerk-std()-Y.mean  
tBodyGyroJerk-std()-Z.mean  
tBodyAccMag-mean().mean  
tBodyAccMag-std().mean  
tGravityAccMag-mean().mean  
tGravityAccMag-std().mean  
tBodyAccJerkMag-mean().mean  
tBodyAccJerkMag-std().mean  
tBodyGyroMag-mean().mean  
tBodyGyroMag-std().mean  
tBodyGyroJerkMag-mean().mean  
tBodyGyroJerkMag-std().mean  
fBodyAcc-mean()-X.mean  
fBodyAcc-mean()-Y.mean  
fBodyAcc-mean()-Z.mean  
fBodyAcc-std()-X.mean  
fBodyAcc-std()-Y.mean  
fBodyAcc-std()-Z.mean  
fBodyAccJerk-mean()-X.mean  
fBodyAccJerk-mean()-Y.mean  
fBodyAccJerk-mean()-Z.mean  
fBodyAccJerk-std()-X.mean  
fBodyAccJerk-std()-Y.mean  
fBodyAccJerk-std()-Z.mean  
fBodyGyro-mean()-X.mean  
fBodyGyro-mean()-Y.mean  
fBodyGyro-mean()-Z.mean  
fBodyGyro-std()-X.mean  
fBodyGyro-std()-Y.mean  
fBodyGyro-std()-Z.mean  
fBodyAccMag-mean().mean  
fBodyAccMag-std().mean  
fBodyBodyAccJerkMag-mean().mean  
fBodyBodyAccJerkMag-std().mean  
fBodyBodyGyroMag-mean().mean  
fBodyBodyGyroMag-std().mean  
fBodyBodyGyroJerkMag-mean().mean  
fBodyBodyGyroJerkMag-std().mean  
tBodyAcc-mean()-X.std  
tBodyAcc-mean()-Y.std  
tBodyAcc-mean()-Z.std  
tBodyAcc-std()-X.std  
tBodyAcc-std()-Y.std  
tBodyAcc-std()-Z.std  
tGravityAcc-mean()-X.std  
tGravityAcc-mean()-Y.std  
tGravityAcc-mean()-Z.std  
tGravityAcc-std()-X.std  
tGravityAcc-std()-Y.std  
tGravityAcc-std()-Z.std  
tBodyAccJerk-mean()-X.std  
tBodyAccJerk-mean()-Y.std  
tBodyAccJerk-mean()-Z.std  
tBodyAccJerk-std()-X.std  
tBodyAccJerk-std()-Y.std  
tBodyAccJerk-std()-Z.std  
tBodyGyro-mean()-X.std  
tBodyGyro-mean()-Y.std  
tBodyGyro-mean()-Z.std  
tBodyGyro-std()-X.std  
tBodyGyro-std()-Y.std  
tBodyGyro-std()-Z.std  
tBodyGyroJerk-mean()-X.std  
tBodyGyroJerk-mean()-Y.std  
tBodyGyroJerk-mean()-Z.std  
tBodyGyroJerk-std()-X.std  
tBodyGyroJerk-std()-Y.std  
tBodyGyroJerk-std()-Z.std  
tBodyAccMag-mean().std  
tBodyAccMag-std().std  
tGravityAccMag-mean().std  
tGravityAccMag-std().std  
tBodyAccJerkMag-mean().std  
tBodyAccJerkMag-std().std  
tBodyGyroMag-mean().std  
tBodyGyroMag-std().std  
tBodyGyroJerkMag-mean().std  
tBodyGyroJerkMag-std().std  
fBodyAcc-mean()-X.std  
fBodyAcc-mean()-Y.std  
fBodyAcc-mean()-Z.std  
fBodyAcc-std()-X.std  
fBodyAcc-std()-Y.std  
fBodyAcc-std()-Z.std  
fBodyAccJerk-mean()-X.std  
fBodyAccJerk-mean()-Y.std  
fBodyAccJerk-mean()-Z.std  
fBodyAccJerk-std()-X.std  
fBodyAccJerk-std()-Y.std  
fBodyAccJerk-std()-Z.std  
fBodyGyro-mean()-X.std  
fBodyGyro-mean()-Y.std  
fBodyGyro-mean()-Z.std  
fBodyGyro-std()-X.std  
fBodyGyro-std()-Y.std  
fBodyGyro-std()-Z.std  
fBodyAccMag-mean().std  
fBodyAccMag-std().std  
fBodyBodyAccJerkMag-mean().std  
fBodyBodyAccJerkMag-std().std  
fBodyBodyGyroMag-mean().std  
fBodyBodyGyroMag-std().std  
fBodyBodyGyroJerkMag-mean().std  
fBodyBodyGyroJerkMag-std().std  