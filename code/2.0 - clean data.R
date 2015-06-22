setwd('.../Stable Markets/Stop and Frisk/data')
load('full_stop_frisk.Rdata')

## clean Age - remove extreme/unreasonable values
d_full$age<-as.numeric(d_full$age)
d_full<-d_full[!is.na(d_full$age),]
d_full<-d_full[d_full$age<=100 & d_full$age>3,]
d_full<-d_full[!is.na(d_full$race),]

## clean Date of stop
d_full$date<-as.character(d_full$datestop)
# dates in 2006 have different format
# non-2006 dates are of form m-dd-yyyy for single digit months
# for two digit months, mm-dd-yyyy. So add 0 to start of singe digit months
# standardize everything to mm-dd-yyyy
d_full$date<-ifelse(nchar(d_full$date)<=7 & d_full$year!=2006,paste('0',d_full$date,sep=''),d_full$date) 
d_full$date<-as.Date(d_full$date,'%m%d%Y')


d_full<-d_full[d_full$date!='1900-12-31' & !is.na(d_full$date),]
d_full$yearmon<-substr(d_full$date,1,7)

d_full$black<-ifelse(d_full$race=='B',1,0)
d_full$white<-ifelse(d_full$race=='W',1,0)
d_full$exp<-ifelse(d_full$explnstp=='Y',1,0)
d_full$c<-1

save(d_full,file='full_stop_frisk_clean.Rdata')

