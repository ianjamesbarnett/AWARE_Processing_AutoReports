powerstate_preprocessing = function(patient_name, ...){
	power_state_filepath = paste(data_filepath, "/", patient_name, "/screen-",substr(patient_name,0,8),".csv",sep="")
	power_state_filename = paste(output_filepath, "/Preprocessed_Data/Individual/",patient_name, "/powerstate_data.rds",sep="")
	if(!file.exists(power_state_filename) && file.exists(power_state_filepath)){
		statemat = read.csv(power_state_filepath,header=T)
	  statemat[,1] = statemat[,1] / 1000
	  statemat[,c("hours","days")] = hours(statemat[,"timestamp"])
	  saveRDS(statemat, power_state_filename)
	}
}

