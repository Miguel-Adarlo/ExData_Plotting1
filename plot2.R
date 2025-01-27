#plot2.R
#Opens png file
png("plot2.png", width = 480, height = 480)

#Assumes file has been downloaded and has been placed in working directory
#Reading, naming and subsetting power consumption data
power <- read.table("household_power_consumption.txt", skip = 1, sep = ";", stringsAsFactors =  FALSE)
#Rename the variables
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Subset only the data we need
subpower <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

#Fixing date and time
subpower$DateTime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Calling Plot
plot(subpower$DateTime, as.numeric(subpower$Global_active_power), type = "l", main = "Global Active Power Vs Time", xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n") 

#Changing the axis labels
axis(side = 1, at = c(as.numeric(subpower$DateTime[1]),
                      as.numeric(subpower$DateTime[1441]),
                      as.numeric(subpower$DateTime[2880])),labels = c("Thu","Fri","Sat"))

#Close the png file
dev.off()