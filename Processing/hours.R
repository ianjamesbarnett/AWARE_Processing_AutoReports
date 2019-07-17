hours = function(timestamps){ # converts timestamps into hour of the day.
  days = timestamps %>% unlist %>% as.POSIXlt(origin = "1970-01-01") %>%
    as.character %>%
    map(function(x){if(is.na(x)){return(c("NA","NA"))}else{return(strsplit(x, " "))}}) %>%
    unlist %>%
    matrix(nrow=2) %>%
    t
  hours = as.numeric(substr(days[,2],1,2)) + as.numeric(substr(days[,2],4,5))/60 + as.numeric(substr(days[,2],7,8))/3600
  days = days[,1]
  output = as_data_frame(cbind(hours=hours, days=days))
  output["hours"] = lapply(output["hours"], as.numeric)
  return(output)
}
