This file describes how to run the run_analysis.R script and create a tidy data set
* First, unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and save to your working directory.
* Second, use source("run_Analysis.R") command in RStudio. 
* Running the script will generate two data files:
  - tidyData.txt : contains the tidy dataset in accordance with the project objectives.
  - MeanData.txt : contains the average of each activity for each subject
* You could use read.table to open the file in RStudio if you wanted. 