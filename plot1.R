##assume the data file  household_power_consumption.txt downloaded and put in current directory
##else need to download file and put proper filePath for read.table
##read data and filter by required dates 1/2/2007 - 2/2/2007
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
filterData <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

##plot 1
hist(filterData$Global_active_power, col="red", bg="white", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file="./plot1.png")
dev.off()