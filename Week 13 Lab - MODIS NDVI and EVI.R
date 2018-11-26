########### Using MODIS data in R ############
########### BIOL 368 Plant Ecophysiology #####
########### Macalester College / M Heskel ####
########### November 27, 2018 ################


# PART I: Downloading and plotting MODIS NDVI and EVI data

# First, open the package "MODISTools" developed by Koen Hufkens
library(MODISTools)

# See what is available through this package: 
products <- mt_products()
products

#This shows the list of available MODIS products that are extractable. 
# These include land cover type, vegatation indices EVI and NDVI, and others. 

#To check the dates available for NDVI/EVI at a certain lat/lon:
dates<-mt_dates(product="MOD13Q1", lat = , lon=) #fill in lat and lon for your site
head(dates)

#Q: What is the frequency of data collected at this site? What is the spatial resolution? 

#Downloading MODIS Data EVI /NDVI. Change liknes 27-32 as needed for your site.
subset_NDVI<-mt_subset(product = "MOD13Q1",
                  lat = 44.9537,
                  lon = -93.0900, 
                  start = "2015-01-01",
                  end = "2016-01-01", 
                  site_name="Saint Paul",
                  internal = TRUE)

#Look at all the data you downloaded from this pixel: 
View(subset_NDVI$data)

#Scrolling through the "band" column, identify the data needed to calculate NDVI by hand. 
#For the first date in your series, calculate NDVI by hand (or using R as a calculator).
# NDVI = (NIR-Red)/(NIR+Red)

#Q: What is the value? Compare it to the value of NDVI reported in column "data". 

## Creating a dataframe of our NDVI and EVI data from this site/time-series: 
date <- as.Date(subset_NDVI$data$calendar_date[subset_NDVI$data$band=="250m_16_days_NDVI"])
NDVI <- subset_NDVI$data$data[subset_NDVI$data$band=="250m_16_days_NDVI"]*0.0001
EVI <- subset_NDVI$data$data[subset_NDVI$data$band=="250m_16_days_EVI"]*0.0001

df_site_VI<-data_frame(date, NDVI, EVI)

#Make a simple plot of NDVI by Time using "base R" graphics: 
plot(date,
     NDVI,
     xlab = "Date",
     ylab = expression("NDVI"))

#Now add EVI on top using "points"" 
points(date, EVI, col="green")

#Q: What is the difference between NDVI and EVI? When does the biggest "jump" in NDVI occur, and what do you attribute that to? 

#Now create a ggplot graphic using your new MODIS NDVI and EVI data: 
library(ggplot2)

ggplot(data=df_site_VI, aes(x=date, y=NDVI))+
  geom_point()+
  geom_smooth(method="loess", span=0.5)+
  theme_classic()

#Change the values of "span" from 0.5 to 0.1 and 0.9, and note what is changing. 
#The grey shape is a an error term applied to the fit, you can remove by adding "se=FALSE" after "span=0.5" in line 64 above.

#Now let's add EVI to the plot as well: 
ggplot(data=df_site_VI, aes(x=date, y=NDVI))+
  geom_point()+
  geom_point(aes(y=EVI),col="green")+
  geom_smooth(method="loess", span=0.5)+
  geom_smooth(aes(y=EVI),method="loess", span=0.5)+
  theme_classic()

#Feel free to alter this graph to bring out more interesting themes and colors

# PART II: Creating a simple 'observational' experiment

#For the second part of the lab, choose 2-3 locations that can comprise your experiment. 
# Some ideas: Your previous remote sensing idea from the miniquiz; a gradient of latitude or altidude; urban to rural; land-use differences; time-space differences.

# Develop a hypotheses about the sites and how you believe vegetation at these sites/times will vary.
# Q: How do you predict NDVI and EVI will vary based on your hypothesis? 

# Test your hypothesis by repeating steps in PART 1 to plot patterns of EVI and NDVI.
# Remember to change the details with the lines of code!

#Download MODIS GPP (MOD17A2H) and compare across your experimental sites. 
#The below example is for Saint Paul: 

subset_GPP<-mt_subset(product = "MOD17A2H",
                       lat = 44.9537,
                       lon = -93.0900, 
                       start = "2015-01-01",
                       end = "2016-01-01", 
                       site_name="Saint Paul",
                       internal = TRUE)

date2 <- as.Date(subset_GPP$data$calendar_date[subset_GPP$data$band=="Gpp_500m"])
GPP<- subset_GPP$data$data[subset_GPP$data$band=="Gpp_500m"]
df_site_GPP<-data_frame(date2, GPP)

#Simple Base R plot: 
plot(date2,
     GPP,
     xlab = "Date",
     ylab = expression("GPP"))


