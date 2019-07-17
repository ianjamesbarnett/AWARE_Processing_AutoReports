################################################################
################    Beiwe Master Pipeline    ###################
################################################################

source_filepath    = "C:/Users/Ian/Dropbox/ProcessingCode/AWARE_R_pipeline"
data_filepath      = "C:/Users/Ian/Documents/AWAREtest/test/data"
output_filepath    = "C:/Users/Ian/Documents/AWAREtest/test/output"

# Source all files
source(paste(source_filepath, "Utility/Initialize.R",sep="/"))


###################################
### individual patient analysis ###
###################################

for(patient_name in patient_names){
  print(patient_name)
  # Preprocess Data
#  surveys_preprocessing(patient_name)
#  text_preprocessing(patient_name)
#  calls_preprocessing(patient_name)
  powerstate_preprocessing(patient_name)
  accelerometer_preprocessing(patient_name, minutes = acc_binsize)
  GPS_preprocessing(patient_name)
  # Process Data
  GPS_imputation(patient_name,nreps=1)
  CreateMobilityFeatures(patient_name)
  # Results
  ContinuousDataCollectionTracks(patient_name, acc_binsize)
  #Individual_Trajectory_Plots(patient_name)
}
print("completed!")
#####################################
#### combined patient processing ####
#####################################


daily_features()
fill_in_NAs()
GenerateReport()





