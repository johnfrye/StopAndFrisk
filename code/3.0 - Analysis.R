setwd('.../Stable Markets/Stop and Frisk/data')
load('full_stop_frisk_clean.Rdata')

# get time series of %blacks stopped %whites stopped and #stops
b<-aggregate(d_full$black,list(d_full$yearmon),mean)
w<-aggregate(d_full$white,list(d_full$yearmon),mean)
c<-aggregate(d_full$c,list(d_full$yearmon),sum)
e<-aggregate(d_full$exp,list(d_full$yearmon),mean)

par(mfrow=(c(3,1)))

plot(c$x,type='l',axes=FALSE,xlab='',main='Number of Stops', ylab='Number of Stops',col='blue')
  axis(2)
  axis(1,at=seq(1,length(b$x),4),label=b$Group.1[seq(1,length(b$x),4)],las=2)

plot(b$x/w$x,type='l',axes=FALSE,xlab='',main='Ratio of %Blacks and %Whites Stopped', ylab='Ratio',col='blue')
  axis(2)
  axis(1,at=seq(1,length(b$x),4),label=b$Group.1[seq(1,length(b$x),4)],las=2)

plot(e$x,type='l',axes=FALSE,xlab='',main='%Explained Stops Over Time', ylab='% of Stops Explained',col='blue')
  axis(2)
  axis(1,at=seq(1,length(b$x),4),label=b$Group.1[seq(1,length(b$x),4)],las=2)
  
hist(d_full$age,main='Age Distribution of Stopped Persons',
     xlab='Age',Freq=FALSE, ylab='Count', col='darkblue')
abline(v=median(d_full$age),col='red',lwd=2)
