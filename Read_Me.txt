README:

Repo contains:
 - A data processing and tidying script (run_analysis.R)
 - Two .csv files containing the results of this script

The script is written to read and tidy the UCI HAR dataset, which is a 
recording of accelerometer and gyroscope data from 30 subjects performing 6
exercises, further details can be found here: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

The location of the unzipped data folder must be set in the third line of the
script for it to proceed. The script combines all the training and test 
datasets into one dataframe named alldata. Two additional datasets are then
produced and saved to .csv files:

  1. All the mean and standard deviation variables from the original dataset.
     (means_devs.csv)
  2. The mean values for every variable for each combination of subject and 
     activity. 
     (summaries.csv)
     
These resulting csvs are included in the repository

Descriptions of the variables are included in the features_info.txt copied from
the original UCI folder.