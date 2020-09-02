library(dplyr)
library(data.table)
#Downloading data
download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile = "data.zip")
unzip("data.zip")
#Reading data
data <- read.table(file="household_power_consumption.txt",
                   header=TRUE,sep=";",dec=".",na.strings = "?")
#Convert data
data[,1] <- as.Date(data[,1],format = "%d/%m/%Y")
#Subsetting
data <- subset(data,Date<="2007-02-02")
data <- subset(data,Date>="2007-02-01")
#Opening png
png(filename = "plot1.png",width = 480, height = 480)
#Creating histogram
hist(data$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",main = "Global Active Power")
#Closing histogram
dev.off()