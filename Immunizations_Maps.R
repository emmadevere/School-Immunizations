library(maps)
library(maptools)
#library(DCluster) USE LATER TO FIND CLUSTERS OF LOW IMMUNIZATION SCHOOLS
library(RColorBrewer)

#Creating a map of New York
NYS <- map("state",regions= c("new york:main", "new york:manhattan",
           "new york:staten island", "new york:long island"),
           fill=TRUE, plot=FALSE)
NYS.names <- NYS$names
NYS.IDs <- sapply(strsplit(NYS.names,":"),function(x) x[1])
NYS_poly_sp <- map2SpatialPolygons(NYS,IDs=NYS.IDs,
           proj4string=CRS(" +proj=longlat +datum=NAD27"))
plot(NYS_poly_sp,col="black",axes=FALSE)


#tidy_data$Color <- cut(tidy_data$Percent.Immunized.Measles, breaks = c(-1, 1, 3, 101), 
 #                   labels = c("blue", "white", "red"))
 
points(tidy_data$Longitude, tidy_data$Latitude, 
       col= ifelse(tidy_data$Type == ("Private School"), 
       "red", "white"), pch= 20, cex= 0.1)
legend("topright",c("Private", "Public"), bty = "n", 
       title = "School Type", fill = c("red","white"))

plot(NYS_poly_sp,col="black",axes=FALSE, main = "Mumps Vaccination <5%")
points(tidy_data$Longitude, tidy_data$Latitude, 
       col= ifelse(tidy_data$Percent.Immunized.Mumps <= (5.0), 
       "red", NA), pch= 20, cex= 1.5)   

plot(NYS_poly_sp,col="black",axes=FALSE, main = "Polio Vaccination <5%")
points(tidy_data$Longitude, tidy_data$Latitude, 
       col= ifelse(tidy_data$Percent.Immunized.Polio <= (5.0), 
                   "red", NA), pch= 20, cex= 1.5)   

plot(NYS_poly_sp,col="black",axes=FALSE, main = "Measles Vaccination <5%")
points(tidy_data$Longitude, tidy_data$Latitude, 
       col= ifelse(tidy_data$Percent.Immunized.Measles <= (5.0), 
                   "red", NA), pch= 20, cex= 1.5)  

plot(NYS_poly_sp,col="black",axes=FALSE, main = "Hepatitus B Vaccination <5%")
points(tidy_data$Longitude, tidy_data$Latitude, 
       col= ifelse(tidy_data$Percent.Immunized.HepatitisB <= (5.0), 
                   "red", NA), pch= 20, cex= 1.5)  
