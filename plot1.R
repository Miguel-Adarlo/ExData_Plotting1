#plot1.R
#Opens png file
png("plot1.png", width = 480, height = 480)

#Assumes file has been downloaded and has been placed in working directory
#Reading, naming and subsetting power consumption data
power <- read.table("household_power_consumption.txt", skip = 1, sep = ";", stringsAsFactors =  FALSE)
#Rename the variables
names(power) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
#Subset the data we need
subpower <- subset(power, power$Date == "1/2/2007" | power$Date == "2/2/2007")

#Calling the Histogram
hist(as.numeric(subpower$Global_active_power), col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

#Close the png file
dev.off()