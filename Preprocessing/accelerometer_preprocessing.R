accelerometer_preprocessing = function(patient_name, minutes, verbose = TRUE, ...){
  accel_filepath = paste(data_filepath, "/", patient_name, "/linear_accelerometer-",substr(patient_name,0,8),".csv",sep="")
  accel_filename = paste(output_filepath, "/Preprocessed_Data/Individual/",patient_name, "/accelerometer_data.rds",sep="")
  if(verbose) cat("Preprocessing accelerometer data\n")
  if(verbose) cat(paste("Aggregating by",minutes,"minutes\n"))
  code_location = paste(source_filepath,"Preprocessing", "accelerometer_preprocessing.py",sep="/")
  patient_data_filepath = paste(output_filepath, "/Preprocessed_Data/Individual/", patient_name, sep="")
  patient_data_filename_TXT = paste(patient_data_filepath, "/appended_sheared_file_acc_",minutes,".txt",sep="")
  patient_data_filename_RDS = paste(patient_data_filepath, "/appended_sheared_file_acc_",minutes,".rds", sep="")
  if(file.exists(patient_data_filename_RDS)){
  	if(verbose) cat("Already preprocessed.\n")
  }else{
	  if(verbose) cat("Preprocessing...\n")
  	system(paste("python", code_location, data_filepath, output_filepath, patient_name, minutes, sep=" "))
  	accmat = read.table(patient_data_filename_TXT, header = TRUE)
  	accmat[,1] = accmat[,1] / 1000
  	accmat = accmat[,-2]
  	accmat[,c("hours","days")] = hours(accmat[,"timestamp"])
  	saveRDS(accmat, patient_data_filename_RDS)
  	file.remove(patient_data_filename_TXT)
  }
}



