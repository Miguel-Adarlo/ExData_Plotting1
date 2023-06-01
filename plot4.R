#plot4.R
#Opens png file
png("plot4.png", width = 480, height = 480)

#Assumes file has been downloaded and has been placed in working directory
#Reading, naming and subsetting power consumption data
power <- read.table("household_power_consumption.txt", skip = 1, sep = ";", stringsAsFactors =  FALSE)
#Rename the variables
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Subset only the data we need
subpower <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

#Fixing date and time
datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Calling Plot and Lines
par(mfrow = c(2,2))

##Topleft
plot(datetime, as.numeric(subpower$Global_active_power), type = "l", xlab="", ylab="Global Active Power", cex=0.2)
##Topright
plot(datetime, as.numeric(subpower$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")
##Lowerleft
plot(datetime, as.numeric(subpower$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(datetime, as.numeric(subpower$Sub_metering_2), type="l", col="red")
lines(datetime, as.numeric(subpower$Sub_metering_3), type="l", col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
##Lowerright
plot(datetime, as.numeric(subpower$Sub_metering_3), type="l", xlab="datetime", ylab="Global_reactive_power")

#Close the png file
dev.off()