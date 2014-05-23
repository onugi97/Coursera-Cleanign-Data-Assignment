Coursera-Cleanign-Data-Assignment
=================================

Submitted by Onook Oh on May 23, 2014.

This assignment has two major files: (1) dataCleaning.R and (2) run_analysis.R. The first file calls the function
'run_analysis()' from the run_analysis.R. Once the 'run_analysis()' function is called from the first file, it will 
read multiple raw data, combines the train and test datasets into one data set. The variables of interest are only 
mean and standard deviation, resulting in 33 variables for each. The variables are merged by subject number and activity. 
The activity data was transformed into a descriptive text from number. The tidyData.txt, contains the mean of each 
variable grouped by each subject/activity combination. 
