## Contents
This repository contains R code that will convert data collected from the smartphone app AWARE (in the form of a csv dump), such as GPS and call/text logs, and convert them into daily measures of behavior with automatically generated reports for each individual in your study. Current behavioral digital phenotypes encompass mobility and sociability. Measures of sleep from screen on/off logs will be incorporated next.

## Instructions
After downloading the repository, run the SensorPipeline.R script from the "Scripts" folder. NOTE: the first time you run this you may encounter some errors if you do not have all the necessary libraries installed. There are many! If you encounter such an error, simply read the error message to identify the missing package and install that package manually on your version of R before trying again. You may have to repeat this multiple times.

Before running SensorPipeline.R, change the source_filepath to point towards the where you downloaded the repository locally, change the data_filepath to point towards the location of your AWARE data csv dump, and change the output_filepath to point to the desired location of the output folder. PDF reports for each individual are placed in the patient-specific folders contained in /output_filepath/Results/Individual/.



## Contact
If you encounter an error when running the code, please email ibarnett@pennmedicine.upenn.edu with the error message and any other pertinent details to help me identify the location of the bug.
