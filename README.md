# MODISTools-Lab-368
Materials for an R/RStudio-based lab examining MODIS EVI and NDVI using MODISTools

The materials here (R script and lab description handout for students) are intended for an upper-level undergraduate plant ecophysiology course. In week 11-12 of the course, we have explored different methods of remote sensing of vegetation, including SIF, hyperspectral sensing, LiDAR, and MODIS. The concept of NDVI, its calculation, and what it says about a leaf or ecosystem was also discussed. 

In this lab exercise, students use the MODISTools package developed by Koen Hufkens @khufkens (https://github.com/khufkens/MODISTools) to download MODIS NDVI and EVI at specific sites of interest and plot how they vary through time. 

Part I of the lab generally follows steps outlined here: https://github.com/khufkens/MODISTools and written in detail in the R script provided here. Part I guides students through downloading and plotting NDVI and EVI in base R and ggplots. An earlier lab had students play around with ggplot2, so this should be an extention of those skills. 

Part II challenges students to develop an 'experiment' wherein they compare a minimum of 2 sites (or time periods) in terms of their NDVI and EVI.
  
  Examples of comparisons could be altitudinal, latitudinal, climactic, or land-use gradients, or comparing the same location at different times. 
  
  Students develop hypotheses and make predictions of expected outcomes prior to downloading the data and plotting NDVI and EVI from their sites. 
  
  Included here are: (1) RScript for Parts I and II of the lab and (2) a PDF of the lab description and expectations for write up by students
  
  Lab period is 3 hrs; students can work in teams if they prefer (each running code on their own computer); write up can occur while going through the lab. Ideally, they will complete the questions in class, and be done within 2.5-3 hrs. 
