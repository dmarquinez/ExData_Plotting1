library(dplyr)
library(data.table)
#Downloading data if not exists
if(!file.exists(file="household_power_consumption.txt")){
  download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                destfile = "data.zip")
  unzip("data.zip")
}
#Reading data
data <- read.table(file="household_power_consumption.txt",
                   header=TRUE,sep=";",dec=".",na.strings = "?")
#Convert data
data[,1] <- as.Date(data[,1],format = "%d/%m/%Y")
#Subsetting
data <- subset(data,Date<="2007-02-02")
data <- subset(data,Date>="2007-02-01")
data$datetime <- strptime(paste(data$Date,data$Time)
                          ,format = "%Y-%m-%d %H:%M:%S")
#Opening png
png(filename = "plot3.png",width = 480, height = 480)
#Creating plot
plot(data$datetime,data$Sub_metering_1,type = "l",
     xlab = "",ylab = "Energy sub metering", col="black")
lines(data$datetime,data$Sub_metering_2,type = "l",
      col="red")
lines(data$datetime,data$Sub_metering_3,type = "l",
      col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),lty=1)#Closing plot
dev.off()