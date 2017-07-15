#set working directory
energy <- read.table(file = "household_power_consumption.txt", sep = ";", header =TRUE)
require("dplyr")
energy$Timestamp <- format(as.Date(energy$Date, format = "%d/%m/%Y"))
subdate <- energy[(energy$Timestamp == "2007-02-01" | energy$Timestamp == "2007-02-02"),]

subdate$DateTime <- as.POSIXct(paste(subdate$Timestamp, subdate$Time), "%Y-%m-%d %H:%M:%S", tz = "")

png(filename = "plot4.png")

par(mfrow = c(2,2))
plot(subdate$DateTime, subdate$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
plot(subdate$DateTime, subdate$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")


plot(subdate$DateTime, subdate$Sub_metering_1, type = "l", xlab = "",
     ylab = "Energy sub metering")
lines(subdate$DateTime, subdate$Sub_metering_2, type = "l", col = "red")
lines(subdate$DateTime, subdate$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lwd = c(2.5,2.5,2.5),col = c("black", "red", "blue"))
 
plot(subdate$DateTime, subdate$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global-reactive_power")    

dev.off()
