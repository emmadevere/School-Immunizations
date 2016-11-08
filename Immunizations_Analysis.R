library("tidyr")
library("stringi")


setwd("~/School-Immunizations")

raw_data <- read.csv(
  "School_Immunization_Survey__Beginning_2012-13_School_Year.csv",
   na.strings="")

###Tidying the data

#Separating the start and end years of each reported academic 
#school year
tidy_data <- separate(raw_data, Report.Period, into = c("Start.Year", 
    "End.Year"))

#Extracting and then separating the GPS coordinates
tidy_data$GPS <- gsub(".*\\((.*)\\).*", "\\1", tidy_data$Location)

tidy_data <- separate(tidy_data, GPS, sep = ",", into = c("Latitude", 
    "Longitude"))

#Removing the percentage signs
tidy_data <- cbind(tidy_data[1:8], sapply(tidy_data[9:16], 
    function(x) as.numeric(gsub("%", "", x))), tidy_data[17:24])

