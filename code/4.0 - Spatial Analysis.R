#install.packages("ggmap")
#install.packages("gridExtra")
library(ggmap)
library(gridExtra)

lib<-"/Users/arman/Dropbox/Stable Markets/Stop and Frisk/data"
setwd(lib)

load('full_stop_frisk_clean_w_coords.Rdata')

ny_plot<-ggmap(get_map("New York, NY",zoom=11,source='google',maptype='terrain'))

## Stop Density Over Time and By Race
map_by_year<-function(yr){
  coords_sub<<-coords[coords$year==yr,]
  
  ny_plot+
    stat_density2d(data = coords_sub[coords_sub$black==1,],aes(x=x, y=y,alpha=.75,fill=..level..),
                   bins = 8, geom = "polygon",show_guide=FALSE)+
    stat_density2d(data = coords_sub[coords_sub$white==1,],aes(x=x, y=y,alpha=.75,fill=..level..),
                   bins = 8, geom = "density2d",show_guide=FALSE,col='red')+
    xlab(" ")+ylab(" ")+ggtitle(paste("Stop & Frisks - ",yr,sep=''))
}

yrlist<-c(2007,2009,2011,2013)
for(i in yrlist){
  assign(paste("p",i,sep=''),map_by_year(i))
}

grid.arrange(p2007,p2009,p2011,p2013,nrow=2,ncol=2)

p2014<-map_by_year(2014)
# death locations from wikipedia...google "garner death" or "liu, Ramos death".
deaths<-data.frame(des=c('Garner','Liu/Ramos'),x=c(-74.076574,-73.946494),y=c(40.637147,40.695886))
p2014+geom_point(data=deaths,aes(x=x,y=y),col='red',shape='*',size=11)