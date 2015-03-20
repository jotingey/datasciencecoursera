=======================================================
run_analysis.R
Version 1.0
=======================================================
JoAnna Tingey
Data Science Coursera - Cleaning Data Project

=======================================================
The data returned by this script is a statistical summary of the average mean and average standard deviation of each of the measurements by Subject and Activity based on the data collected on Human Activity Recognition using Smartphones.

Original Data can be found 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
More information about the original data can be found 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Prerequisites:
==============
This script requires the data.table and dplyr libraries to be installed

install.packages("data.table")
install.packages("dplyr")

Description of what the run_analysis.R does:
====================================
1.  calls for the data.table and dplyr libraries
2.  downloads the file if it doesn't already exist in your working directory
3.  Extracts all files into a tempData folder created on your working directory
4.  Reads the Test and Training files for the Subjects,X and Y data
5.  Combines the data and extracting ONLY the variables from the X files that were calculations of the mean and standard deviation.
6.  Combines the Test and Training Data to create a MergeData table
7.  Set the column Names
8.  Changes the Activity value to a factor and replacing them with more descriptive text
9.  Group the data by Subject and Activity and return the average (aka mean) of each of those measurements being grouped
10. Create a file UCItidy.txt and save it to the working directory.

The script creates the following file:
======================================
UCItidy.txt

Notes:
======
- Each row in the text file is a unique subject and activity.