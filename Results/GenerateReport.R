#require(rmarkdown)

GenerateReport = function(VarsInclude = NULL){
  if(is.null(VarsInclude)){
    VarsInclude=c("Hometime","ProbPause","CircdnRtn","SigLocsVisited")
  }
  header_info=read.csv(paste(data_filepath,"PatientInfo_Report.csv",sep="/"),stringsAsFactors=F)
  featmat=readRDS(paste(output_filepath,"Processed_Data","Group","feature_matrix_clean.rds",sep="/"))[[1]]
  for(patient_name in patient_names){
    hi_rowID = which(header_info[,1]==patient_name)
    if(length(hi_rowID)==1){
      Patient_Initials=header_info[hi_rowID,2]
      Clinician_ID = header_info[hi_rowID,3]
      Clinic_Name = header_info[hi_rowID,4]
    }else{
      Patient_Initials=NULL
      Clinician_ID = NULL
      Clinic_Name = NULL
      warning(paste("Patient",patient_name,"not in \"PatientInfo_Report.csv\""))
    }
    INDID = which(featmat$IID==patient_name)
    if(length(INDID)>1){
      submat=featmat[INDID,c("Date",VarsInclude)]
    }else{
      submat=NULL
      warning(paste("No summary data for patient",patient_name))
      next
    }
    WeeksInTreatment = ceiling(nrow(submat)/7)
    render(input=paste(source_filepath,"Results","KnitReportPDF.Rmd",sep="/"),output_file=paste("Report_pID-",patient_name,"_date",submat$Date[nrow(submat)],".pdf",sep=""),output_dir=paste(output_filepath,"/Results/Individual/",patient_name,sep=""),intermediates_dir=paste(output_filepath,"/Processed_Data/Individual/",patient_name,sep=""),knit_root_dir=paste(output_filepath,"/Processed_Data/Individual/",patient_name,sep=""),output_format="pdf_document")
  }
}

#GenerateReport()


