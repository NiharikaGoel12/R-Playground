# R-Playground

This repository contains basic codes for R, which might be useful in day to day work, especially doing data analysis on large datasets in Excel or CSV.

#Merge multiple Excel/CSV files in a folder

Consider a case when you have multiple xlsx/csv files in a folder & you to merge them into one single file. Here, I have used lapply() which returns a list of the same length as i. And grepl() will check exact match between merge_file_name & existing file 'i'. In this case, if the two files are same, we will ignore already created "merge file". 

rbind() will combine data frame by rows and merge all the files. 

