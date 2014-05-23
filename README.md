Coursera-Cleanign-Data-Assignment
=================================

Submitted by Onook Oh on May 23, 2014.

This assignment has two major files: (1) dataCleaning.R and (2) run_analysis.R. The first file calls the 
run_analysis() function from the run_analysis.R file. The 'run_analysis()' function reads multiple raw data, merges 
the train and test datasets. The variables of interest are only mean and standard deviation, resulting in 33 variables for each. The variables are merged by subject number and activity. The activity data was transformed into descriptive text from number. The output data, tidyData.txt, contains the mean of each variable grouped by each subject and activity combination. 
