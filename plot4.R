##assume the data file  household_power_consumption.txt downloaded and put in current directory
##else need to download file and put proper filePath for read.table
##read data and filter by required dates 1/2/2007 - 2/2/2007
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
filterData <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

##create new column DateTime to store DateTime in Date format
filterData$DateTime <- strptime(paste(filterData$Date, filterData$Time), format = "%d/%m/%Y %H:%M:%S")

##plot 4
##plot and save
par(mfrow = c(2, 2))
with(filterData, {
		plot(filterData$DateTime, filterData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
		plot(filterData$DateTime, filterData$Voltage, type="l", ylab="Voltage", xlab="datetime") 		
		plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", main="", col="black")
 		lines(DateTime, Sub_metering_2, type="l", ylab="Energy sub metering", xlab="", main="", col="red")
 		lines(DateTime, Sub_metering_3, type="l", ylab="Energy sub metering", xlab="", main="", col="blue")
 		legend("topright", pch=".", lwd="1", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
		plot(filterData$DateTime, filterData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
 		})

dev.copy(png, file="./plot4.png")
dev.off()