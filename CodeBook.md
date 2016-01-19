---
title: "Getting and Cleaning Data Course Project"
author: "Brett Rinehold"
date: "January 18, 2016"
output: html_document
---

This code book will explain all the variables and processes used to take the raw data and make it tidy.

For the first step:
  * The training and test data sets were read into R and saves as:
    - train/testData - contains the data
    - train/testNames - contains the labels
    - train/testSub - contains the subjects
  * Next, using a simple rbind to merge the three respective parts together (test with train)

For the second step:
  * The featurs were read into R and stored as features
  * Using the grep function, only the mean and std columns were extracted and stored as the final mergeData
  * Some cleaning of the names was done using gsub, where formatting to the names took place

For the third step:
  * The appropraite activity names were read into R
  * Again simple formatting was done using the substr function that substitutes part of a string.
  * The activity names were then applied to the merged data set

The fourth step required making it into tidy data:
  * For this a column bind was done with the Subjects, activitiy names, and the data
  * Appropriate column headers were given to the Subjects and Activity Names column
  * The data was then written out to a table called "tidy_data.txt"

The final step created a second tidy data set corresponding to the average of each variable for each activity.
  * First creating an empty matrix with dimension lengths equal to the subjects * activity , # of variables
  * A aggregat function splits the data into subsets and calculates the mean
      - This was stored in a new table, meanData
  * The resulting matrix was written out in the entitled Table, "MeanData"