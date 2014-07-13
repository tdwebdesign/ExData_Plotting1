URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(URL,"household_power_consumption.zip")
unzip("household_power_consumption.zip")
library(data.table)
data <- fread("household_power_consumption.txt", na.strings="?")
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
datetime <- paste(data$Date, data$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
png(file = "plot3.png")
plot(datetime, data$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
lines(datetime, data$Sub_metering_1)
lines(datetime, data$Sub_metering_2, col = "red")
lines(datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty = 1, col = c("black", "red", "blue"), cex = .75)
dev.off()