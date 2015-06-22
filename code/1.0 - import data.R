# data source: http://www.nyc.gov/html/nypd/html/analysis_and_planning/stop_question_and_frisk_report.shtml
# codebooks are also saved in that location

#### 1. import raw data from the web...one dataset for each year ####
for(i in 2013:2014){
  temp <- tempfile()
  url<-paste("http://www.nyc.gov/html/nypd/downloads/zip/analysis_and_planning/",i,"_sqf_csv.zip",sep='')
  download.file(url,temp)
  assign(paste("d",i,sep=''),read.csv(unz(temp, paste(i,".csv",sep=''))))
}
unlink(temp)
rm(temp,url,i)

#### 2. Save each of the downloaded files as csv...one csv for each year ####
setwd('.../Stable Markets/Stop and Frisk/data')

# function keep_vars() subsets each year's dataset to only selected variables.
# Note: not all datsets have the same variables. 
varlist<-c('year','xcoord','ycoord','race','sex','age','timestop','explnstp','city','state','datestop','arstmade')
keep_vars<-function(x){
  x[,varlist]
}

# put all the datasets in a list and apply keep_vars() over all datasets.
full<-list(d2003,d2004,d2005,d2006,d2007,d2008,d2009,d2010,d2011,d2012,d2013,d2014)
sub<-lapply(full,keep_vars)

# Stack each year's dataset and save.
d_full<-rbind(sub[[1]],sub[[2]],sub[[3]],sub[[4]],sub[[5]],sub[[6]],sub[[7]],sub[[8]],sub[[9]],sub[[10]],sub[[11]],sub[[12]])
save(d_full,file='full_stop_frisk.Rdata')