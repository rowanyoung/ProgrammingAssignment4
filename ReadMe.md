---
title: "Read Me"
author: "Rowan Young"
date: "October 16, 2016"
output: html_document
---

### Getting and Cleaning Data - Programming Assignment Four

This repository includes the following files:

- 'ReadMe.md'

- 'run_analysis.R': R script that downloads, unzips, and combines the test and train datasets from Human Activity Recognition Using Smartphones Dataset, which only includes the mean and standard deviations of triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration, triaxial Angular velocity from the gyroscope, a vector with time and frequency domain variables, its activity label, and an identifier of the subject who carried out the experiment. This script also generates a tidy data set that averages by subject and activity, mean or standard deviation related variables mentioned above.

- 'CodeBook.md': List of all the variables for the tidy dataset. Quantitative variables list the values ranges and qualitative variables list the factors.

- 'tidy.txt': Tidied up dataset from the UCI Human Activity Recognition Using Smartphones Dataset. Aggregates the original column measurements relating to mean and standard deviations by activity and subject.