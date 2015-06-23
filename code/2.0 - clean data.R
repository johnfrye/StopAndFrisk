setwd('/Users/arman/Dropbox/Stable Markets/Stop and Frisk/data')
load('full_stop_frisk.Rdata')

#install.packages('rgdal') 
library(rgdal)

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

## create binary flags
d_full$black<-ifelse(d_full$race=='B',1,0)
d_full$white<-ifelse(d_full$race=='W',1,0)
d_full$exp<-ifelse(d_full$explnstp=='Y',1,0)
d_full$c<-1

# save version without clean x-y coords,
# these are used to generate summary stats
save(d_full,file='full_stop_frisk_clean.Rdata')

## clean x-y coordinates. As indicated Statistical Notes
## accompanying the raw data, coordinates are in US State Plane format
## specifically: New York 3104, Long Island Zone (1983 Survey feet) 

## subset to just stops with location values
d_full_w_coords<-d_full[!is.na(d_full$xcoord) & !is.na(d_full$ycoord),]

raw_coords <- data.frame(x=d_full_w_coords$xcoord, y=d_full_w_coords$ycoord)
coordinates(raw_coords) <- c('x', 'y')

# ESRI:102718 corresponds to 
# US state Plane Coordinate Systems New York 3104, 
# Long Island Zone (1983 Survey feet) 
proj4string(raw_coords)<-CRS("+init=ESRI:102718")

# EPSG:4326 corresponds to our usually longitude/lattitude coordinate system
new_coords<-spTransform(raw_coords,CRS("+init=EPSG:4326"))

coords<-data.frame(year=d_full_w_coords$year,
                   black=d_full_w_coords$black,
                   white=d_full_w_coords$white,
                   new_coords)

save(coords,file='full_stop_frisk_clean_w_coords.Rdata')