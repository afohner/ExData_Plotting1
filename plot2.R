#set working directory
energy <- read.table(file = "household_power_consumption.txt", sep = ";", header =TRUE)
require("dplyr")
energy$Timestamp <- format(as.Date(energy$Date, format = "%d/%m/%Y"))
subdate <- energy[(energy$Timestamp == "2007-02-01" | energy$Timestamp == "2007-02-02"),]

subdate$DateTime <- as.POSIXct(paste(subdate$Timestamp, subdate$Time), "%Y-%m-%d %H:%M:%S", tz = "")

png(filename = "plot2.png")

plot(subdate$DateTime, subdate$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
     

dev.off()
