#plot3.R
#Opens png file
png("plot3.png", width = 480, height = 480)

#Assumes file has been downloaded and has been placed in working directory
#Reading, naming and subsetting power consumption data
power <- read.table("household_power_consumption.txt", skip = 1, sep = ";", stringsAsFactors =  FALSE)
#Rename the variables
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Subset only the data we need
subpower <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

#Fixing date and time
subpower$DateTime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Calling Plot and Lines
plot(subpower$DateTime, subpower$Sub_metering_1, type = "n", xaxt = "n",
                       xlab = "", ylab = "Energy sub metering")
axis(side = 1, at = c(as.numeric(subpower$DateTime[1]),
                      as.numeric(subpower$DateTime[1441]),
                      as.numeric(subpower$DateTime[2880])),labels = c("Thu","Fri","Sat"))
lines(subpower$DateTime, subpower$Sub_metering_1)
lines(subpower$DateTime, subpower$Sub_metering_2, col = "red")
lines(subpower$DateTime, subpower$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Close the png file
dev.off()