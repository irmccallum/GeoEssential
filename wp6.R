
# GEOEssential
# SDG Workflow for WP6 Food Water Energy Nexus

# 6.6.1 Change in the extent of water-related ecosystems over time 

# https://unstats.un.org/sdgs/tierIII-indicators/files/Tier3-06-06-01.pdf
# https://global-surface-water.appspot.com/
# gadm.org

rm(list = ls())
# first install.packages("raster")
library(raster)

# set working directory
#setwd("c:/GeoEssential/WP6/workflow")

# load country shapefile
c <- shapefile(paste0(getwd(),'/GMB_adm_shp/GMB_adm0.shp'))

# load water raster
e <- raster("change_20W_20N.tif")

# process raster
e.c <- crop(e,c)
e.c <- aggregate(e.c,fact=10,fun=modal)
e.c <- mask(e.c,c)
e.c[e.c > 200] <- NA

# calculate area
a <- area(e.c)
s <- stack(e.c,a)
names(s) <- c("Water","Area")
sdf <- as.data.frame(s)
sdf.sub <- subset(sdf,Water < 100, select=Area)
area.loss <- round(sum(sdf.sub$Area))
sdf.sub <- subset(sdf,Water == 100, select=Area)
area.nc <- round(sum(sdf.sub$Area))
sdf.sub <- subset(sdf,Water > 100, select=Area)
area.gain <- round(sum(sdf.sub$Area))
area.loss
area.nc
area.gain

#write csv
temp <- data.frame()
temp <- rbind(area.loss,area.nc,area.gain)
write.csv(temp, file = paste0(c$NAME_ENGLI,".csv"))

# plot
colors <- colorRampPalette(c("red", "black","cyan"))(99)
plot(e.c,col = colors, main=paste0(c$NAME_ENGLI," water change occurance 1984-2015"))
plot(c,add=T)
