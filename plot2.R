##assume the data file  household_power_consumption.txt downloaded and put in current directory
##else need to download file and put proper filePath for read.table
##read data and filter by required dates 1/2/2007 - 2/2/2007
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
filterData <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

##plot 2
##create new column DateTime to store DateTime in Date format
filterData$DateTime <- strptime(paste(filterData$Date, filterData$Time), format = "%d/%m/%Y %H:%M:%S")

##plot and save
plot(filterData$DateTime, filterData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="./plot2.png")
dev.off()