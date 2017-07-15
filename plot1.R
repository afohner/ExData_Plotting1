#set working directory
energy <- read.table(file = "household_power_consumption.txt", sep = ";", header =TRUE)
require("dplyr")
energy$Timestamp <- format(as.Date(energy$Date, format = "%d/%m/%Y"))
subdate <- energy[(energy$Timestamp == "2007-02-01" | energy$Timestamp == "2007-02-02"),]

png(filename = "plot1.png")
plot1 <- hist(as.numeric(as.character(subdate$Global_active_power)), col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()
